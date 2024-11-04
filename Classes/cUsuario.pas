unit cUsuario;

interface

uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs,
ZAbstractConnection, ZConnection,
ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils, DateUtils,
uFuncaoCriptografia, UDtmConexao; //lista de units

type
  TUsuario = class
    private
    ConexaoDB:TZConnection;
    F_usuarioId:Integer;
    F_nome:string;
    F_senha:string;
    function getSenha:string;
    procedure setSenha(const Value: String);



   public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
   function Selecionar(id:Integer):Boolean;
   function Logar(aUsuario, aSenha: String): Boolean;
   function UsuarioExiste(aUsuario:String):Boolean;
   function AlterarSenha: Boolean;

   published
    property codigo                :Integer       read F_usuarioId         write F_usuarioID;
    property nome                  :string        read F_nome              write F_nome;
    property senha                 :string        read getSenha            write setsenha;
  end;

implementation

{$region 'Constructor and Destructor'}
constructor TUsuario.Create(aConexao: TZConnection);
  begin
    ConexaoDB:= aConexao;
  end;

destructor TUsuario.Destroy;
  begin
    inherited;
  end;
{$endRegion}


{$Region 'Crud'}
function TUsuario.Apagar: Boolean;
var Qry:TzQuery;
  begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'C�digo: '+InttoStr(F_usuarioid)+#13+
                'Descri��o :'+F_nome,mtConfirmation,[mbYes, mbNo],0)=mrNo then

                begin
                  Result:=False;
                  abort;
                end;

  try
  Result:=True;
  Qry:=TZQuery.Create(nil);
  Qry.Connection:=ConexaoDB;
  Qry.SQL.Clear;
  Qry.SQL.Add('DELETE FROM clientes '+
              ' WHERE usuarioid= :usuarioid ');
  Qry.ParamByName('usuarioid').AsInteger:=F_usuarioid;

      Try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;

      Except
      ConexaoDB.Rollback;
      Result:=False;
      End;

  finally
  if Assigned(Qry) then
  FreeAndNil(Qry);

  end;
end;

function TUsuario.Atualizar: Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE USUARIOS'+
                ' SET nome              =:nome '+
                '    ,senha             =:senha '+
                ' WHERE usuarioid = :usuarioid ');

    Qry.ParamByName('USUARIOID').AsInteger       :=Self.F_usuarioid;
    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('senha').AsString            :=Self.F_senha;

    Try
    ConexaoDB.StartTransaction;
    Qry.ExecSQL;
    ConexaoDB.Commit;

    Except
    ConexaoDB.Rollback;
    Result:=False;
    End;

  Finally
  if Assigned(Qry) then
  FreeAndNil(Qry);

  End;
end;


function TUsuario.Inserir: Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO USUARIOS (nome, '+
                '                      senha) '+
                ' VALUES              (:nome, '+
                '                      :senha )' );

    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('senha').AsString            :=Self.F_senha;


    Try
    ConexaoDB.StartTransaction;
    Qry.ExecSQL;
    ConexaoDB.Commit;

    Except
    ConexaoDB.Rollback;
    Result:=False;
    End;

  Finally
  if Assigned(Qry) then
  FreeAndNil(Qry);

  End;

end;


function TUsuario.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT usuarioid, '+
                '                      nome, '+
                '                      senha '+
                ' FROM USUARIOS '+
                ' WHERE usuarioid = :usuarioid ');

  Qry.ParamByName('usuarioid').AsInteger:=id;

    try
    Qry.Open;
    Self.F_usuarioid:=Qry.FieldByName('usuarioid').AsInteger;
    Self.F_nome:=Qry.FieldByName('nome').AsString;
    Self.F_senha:=Qry.FieldByName('senha').AsString;

    Except
    Result:=False;
    end;

  Finally
  if Assigned(Qry) then
  FreeAndNil(Qry);
  End;
  End;

function TUsuario.UsuarioExiste(aUsuario: string): Boolean;
var Qry:TZQuery;
begin
  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(USUARIOID) AS QTDE '+
                ' FROM USUARIOS '+
                ' WHERE NOME = :NOME ');

    Qry.ParamByName('NOME').AsString:= aUsuario;

     try
        Qry.Open;

        if Qry.FieldByName('QTDE').AsInteger > 0 then
          Result:=True

        else
          Result:=False;

      Except
        Result:=False;
      end;

    finally
     if Assigned(Qry) then
      FreeandNil(Qry);
    end;
end;

  {$ENDREGION}


{$REGION 'GET E SET'}

function TUsuario.getSenha: string;
  begin
    Result:= Descriptografar(self.F_senha);
  end;

procedure TUsuario.setSenha(const Value: string);
  begin
    Self.F_senha := Criptografar(Value);
  end;

  {$ENDREGION}


 {$REGION 'LOGIN'}
 function TUsuario.Logar(aUsuario:String; aSenha:String) : Boolean;
 var Qry:TZQuery;
  begin
    try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT USUARIOID, '+
                ' NOME, '+
                ' SENHA '+
                ' FROM USUARIOS '+
                ' WHERE NOME = :NOME AND SENHA = :SENHA');

    Qry.ParamByName('NOME').AsString:=aUsuario;
    Qry.ParamByName('SENHA').AsString:=Criptografar(aSenha);

      try
        Qry.Open;

        if Qry.FieldByName('USUARIOID').AsInteger > 0 then
        begin
        F_usuarioid:= Qry.FieldByName('USUARIOID').AsInteger;
        F_nome:= Qry.FieldByName('NOME').AsString;
        F_senha:= Qry.FieldByName('SENHA').AsString;
        Result:=True
        end

        else
          Result:=False;
      Except
        Result:=False;
      end;

    finally
     if Assigned(Qry) then
      FreeandNil(Qry);
    end;
  end;

  {$ENDREGION}


{$region 'ALTERA��O DE SENHA'}
function TUsuario.AlterarSenha:Boolean;
var Qry:TZQuery;
begin
 try
   Result:=True;
   Qry:=TZQuery.Create(nil);
   Qry.Connection:=ConexaoDB;
   Qry.SQL.Clear;
   Qry.SQL.Add('UPDATE USUARIOS '+
               ' SET SENHA = :SENHA '+
               ' WHERE USUARIOID = :USUARIOID ');

 Qry.ParamByName('USUARIOID').AsInteger   :=Self.F_usuarioId;
 Qry.ParamByName('SENHA').AsString       :=Self.F_senha;

    Try
    ConexaoDB.StartTransaction;
    Qry.ExecSQL;
    ConexaoDB.Commit;

    Except
    ConexaoDB.Rollback;
    Result:=False;
    End;

 finally
 if Assigned(Qry) then
  FreeAndNil(Qry);

 end;

end;


{$ENDREGION}



end.
