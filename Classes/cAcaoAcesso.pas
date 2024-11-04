unit cAcaoAcesso;

interface
uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs,
ZAbstractConnection, ZConnection,
ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils, DateUtils, VCL.Forms,
Vcl.Buttons; //lista de units

type TAcaoAcesso = class

private
ConexaoDB:TZConnection;
F_acaoacessoID:Integer;
F_Descricao:String;
F_chave:string;
class procedure PreencherAcoes(aForm: TForm; aConexao:TZConnection);static;
class procedure VerificarUsuarioAcao(aUsuarioId, aAcaoAcessoId: Integer; aConexao : TZConnection); static;


public
constructor Create(aConexao:TZConnection);
destructor  Destroy; override;
function Inserir:Boolean;
function Atualizar:Boolean;
function Apagar:Boolean;
function Selecionar(id:integer):Boolean;
function ChaveExiste(aChave:String):Boolean;
class procedure CriarAcoes(aNomeForm: TFormClass; aConexao: TZConnection); static;
class procedure PreencherUsuarioVsAcoes(aConexao: TZConnection); static;

published

property codigo       :Integer          read F_acaoacessoid           write F_acaoacessoid;
property descricao    :String           read F_descricao              write F_descricao;
property chave        :String           read F_chave                  write F_chave;

end;
implementation

{ TAcaoAcesso }

function TAcaoAcesso.Apagar: Boolean;
var Qry:TzQuery;
  begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+InttoStr(F_acaoacessoid)+#13+
                'Descrição :'+F_descricao,mtConfirmation,[mbYes, mbNo],0)=mrNo then

                begin
                  Result:=False;
                  abort;
                end;

  try
  Result:=True;
  Qry:=TZQuery.Create(nil);
  Qry.Connection:=ConexaoDB;
  Qry.SQL.Clear;
  Qry.SQL.Add('DELETE FROM ACAOACESSO '+
              ' WHERE acaoacessoid= :acaoacessoid ');
  Qry.ParamByName('acaoacessoid').AsInteger:=F_acaoacessoid;

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

function TAcaoAcesso.Atualizar: Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' UPDATE ACAOACESSO '+
                ' SET descricao              =:descricao, '+
                '    chave                   =:chave '+
                ' WHERE acaoacessoid = :acaoacessoid ');

    Qry.ParamByName('acaoacessoid').AsInteger       :=Self.F_acaoacessoid;
    Qry.ParamByName('descricao').AsString           :=Self.F_descricao;
    Qry.ParamByName('chave').AsString               :=Self.F_chave;

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

function TAcaoAcesso.ChaveExiste(aChave: String): Boolean;
var Qry:TZQuery;
begin
  Try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT COUNT(acaoacessoid) AS QTDE '+
                ' FROM ACAOACESSO '+
                ' WHERE CHAVE = :CHAVE ');

  Qry.ParamByName('CHAVE').AsString:=aChave;

    try
    Qry.Open;
    if Qry.FieldByName('QTDE').AsInteger > 0 then
      Result:=True

      else
      Result:=False;

    Except
    Result:=False;
    end;

    Finally
    if Assigned(Qry) then
    FreeAndNil(Qry);
  End;

end;

constructor TAcaoAcesso.Create(aConexao: TZConnection);
begin
  ConexaoDB:= aConexao;
end;



destructor TAcaoAcesso.Destroy;
begin

  inherited;
end;

function TAcaoAcesso.Inserir: Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO ACAOACESSO (descricao, '+
                '                      chave) '+
                ' VALUES              (:descricao, '+
                '                      :chave )' );

    Qry.ParamByName('descricao').AsString             :=Self.F_descricao;
    Qry.ParamByName('chave').AsString                 :=Self.F_chave;


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

{$REGION 'FORM ACOESACESSO'}

class procedure TAcaoAcesso.PreencherAcoes(aForm: TForm;
  aConexao: TZConnection);
  var i:Integer;
  oAcaoAcesso:TAcaoAcesso;
begin
  try
    oAcaoAcesso:= TAcaoAcesso.Create(aConexao);
    oAcaoAcesso.descricao := aForm.Caption;
    oAcaoAcesso.chave     := aForm.Name;
    if not oAcaoAcesso.ChaveExiste(oAcaoAcesso.chave) then
      oAcaoAcesso.Inserir;

  for I := 0 to aForm.ComponentCount -1 do
    begin
      if (aForm.Components[i] is TBitBtn) then
      begin
      if TBitBtn(aForm.Components[i]).Tag=99 then
        begin
        oAcaoAcesso.descricao := '    - BOTÃO '+TBitBtn(aForm.Components[i]).Caption;
        oAcaoAcesso.chave     := aForm.Name+'_'+TBitBtn(aForm.Components[i]).Name;

        if not oAcaoAcesso.ChaveExiste(oAcaoAcesso.chave) then
          oAcaoAcesso.Inserir;

        end;

      end;
    end;

  finally
    if Assigned(oAcaoAcesso) then
    FreeAndNil(oAcaoAcesso);

  end;

end;

class procedure TAcaoAcesso.CriarAcoes(aNomeForm: TFormClass;
  aConexao: TZConnection);
  var form: TForm;
begin
  try
    form := aNomeForm.Create(Application);
    PreencherAcoes(form,aConexao);
  finally
    if Assigned(form) then
      form.Release;

  end;

end;

{$ENDREGION}

function TAcaoAcesso.Selecionar(id: integer): Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT acaoacessoid, '+
                '                      descricao, '+
                '                      chave '+
                ' FROM ACAOACESSO '+
                ' WHERE acaoacessoid = :acaoacessoid ');

  Qry.ParamByName('acaoacessoid').AsInteger:=id;

    try
    Qry.Open;
    Self.F_acaoacessoid:=Qry.FieldByName('acaoacessoid').AsInteger;
    Self.F_descricao:=Qry.FieldByName('descricao').AsString;
    Self.F_chave:=Qry.FieldByName('chave').AsString;

    Except
    Result:=False;
    end;

    Finally
    if Assigned(Qry) then
    FreeAndNil(Qry);
  End;
  End;

class procedure TAcaoAcesso.VerificarUsuarioAcao(aUsuarioId,
  aAcaoAcessoId: Integer; aConexao: TZConnection);
var Qry:TZQuery;
begin
  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=aConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT USUARIOID '+
                ' FROM USUARIOSACAOACESSO '+
                ' WHERE USUARIOID = :USUARIOID '+
                ' AND ACAOACESSOID = :ACAOACESSOID ');

    Qry.ParamByName('USUARIOID').AsInteger:=aUsuarioId;
    Qry.ParamByName('ACAOACESSOID').AsInteger:=aAcaoAcessoId;
    Qry.Open;

    if Qry.IsEmpty then
      begin
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add('INSERT INTO USUARIOSACAOACESSO (USUARIOID, ACAOACESSOID, ATIVO) '+
                    ' VALUES (:USUARIOID, :ACAOACESSOID, :ATIVO) ');

      Qry.ParamByName('USUARIOID').AsInteger:=aUsuarioId;
      Qry.ParamByName('ACAOACESSOID').AsInteger:=aAcaoAcessoId;
      Qry.ParamByName('ATIVO').AsBoolean:=True;

        try
         aConexao.StartTransaction;
         Qry.ExecSQL;
         aConexao.Commit;
        Except
          aConexao.Rollback;
          end;

      end;

  finally
  if Assigned(Qry) then
    FreeAndNil(Qry);

  end;

end;

 class procedure TAcaoAcesso.PreencherUsuarioVsAcoes(aConexao: TZConnection);
 var Qry:TZQuery;
 QryAcaoAcesso:TZQuery;
begin
  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=aConexao;
    Qry.SQL.Clear;

    QryAcaoAcesso:=TZQuery.Create(nil);
    QryAcaoAcesso.Connection:=aConexao;
    QryAcaoAcesso.SQL.Clear;

    Qry.SQL.Add('SELECT USUARIOID FROM USUARIOS ' );
    Qry.Open;

    QryAcaoAcesso.SQL.Add('SELECT ACAOACESSOID FROM ACAOACESSO ');
    QryAcaoAcesso.Open;

    Qry.First;
    while not Qry.Eof do //usuarios
    begin
    QryAcaoAcesso.First;


    while not QryAcaoAcesso.Eof do  //acaoacesso
      begin
        VerificarUsuarioAcao(Qry.FieldByName('USUARIOID').AsInteger,
        QryAcaoAcesso.FieldByName('ACAOACESSOID').AsInteger, aConexao);
        QryAcaoAcesso.Next;
      end;

      Qry.Next;

    end;


  finally
    if Assigned(Qry) then
      FreeandNil(Qry);

    if Assigned(QryAcaoAcesso) then
    FreeandNil(QryAcaoAcesso);

  end;


end;


end.
