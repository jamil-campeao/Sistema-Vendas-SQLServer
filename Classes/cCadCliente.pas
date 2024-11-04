unit cCadCliente;

interface
uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs,
ZAbstractConnection, ZConnection,
ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils, DateUtils; //lista de units

 type
 TCliente = class
   private
   ConexaoDB:TZConnection;
   F_clienteId:Integer;
   F_nome:String;
   F_endereco:String;
   F_cidade:string;
   F_bairro:String;
   F_estado:String;
   F_cep:String;
   F_telefone:String;
   F_email:String;
   F_datanascimento: TDate;

   public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
   function Selecionar(id:Integer):Boolean;

   published
   property codigo :Integer read F_clienteId write F_clienteId;
   property nome   :String read F_nome write F_nome;
   property endereco:String read F_endereco write F_endereco;
   property cidade  :String read F_cidade write F_cidade;
   property bairro  :String read F_bairro write F_bairro;
   property estado  :String read F_estado write F_estado;
   property cep     :String read F_cep write F_cep;
   property telefone:String read F_telefone write F_telefone;
   property email   :String read F_email write F_email;
   property datanascimento: TDate read F_datanascimento write F_datanascimento;

 end;

implementation

{$region 'Constructor and Destructor'}
constructor TCliente.Create(aConexao: TZConnection);
  begin
    ConexaoDB:= aConexao;
  end;

destructor TCliente.Destroy;
  begin
    inherited;
  end;
{$endRegion}

{$Region 'Crud'}
function TCliente.Apagar: Boolean;
var Qry:TzQuery;
  begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+InttoStr(F_clienteid)+#13+
                'Descrição :'+F_nome,mtConfirmation,[mbYes, mbNo],0)=mrNo then

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
              ' WHERE clienteId= :clienteId ');
  Qry.ParamByName('clienteId').AsInteger:=F_clienteId;

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

function TCliente.Atualizar: Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE clientes'+
                ' SET nome              =:nome '+
                '    ,endereco          =:endereco '+
                '    ,cidade            =:cidade '+
                '    ,bairro            =:bairro '+
                '    ,estado            =:estado '+
                '    ,cep               =:cep '+
                '    ,telefone          =:telefone '+
                '    ,email             =:email '+
                '    ,datanascimento    =:datanascimento '+
                ' WHERE clienteId = :clienteId ');

    Qry.ParamByName('clienteId').AsInteger       :=Self.F_clienteId;
    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('endereco').AsString         :=Self.F_endereco;
    Qry.ParamByName('cidade').AsString           :=Self.F_cidade;
    Qry.ParamByName('bairro').AsString           :=Self.F_bairro;
    Qry.ParamByName('estado').AsString           :=Self.F_estado;
    Qry.ParamByName('cep').AsString              :=Self.F_cep;
    Qry.ParamByName('telefone').AsString         :=Self.F_telefone;
    Qry.ParamByName('email').AsString            :=Self.F_email;
    Qry.ParamByName('datanascimento').AsDatetime :=Self.F_datanascimento;

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

function TCliente.Inserir: Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO clientes (nome, '+
                '                      endereco, '+
                '                      cidade, '+
                '                      bairro, '+
                '                      estado, '+
                '                      cep, '+
                '                      telefone, '+
                '                      email, '+
                '                      datanascimento) '+
                ' VALUES              (:nome, '+
                '                      :endereco, '+
                '                      :cidade, '+
                '                      :bairro, '+
                '                      :estado, '+
                '                      :cep, '+
                '                      :telefone, '+
                '                      :email, '+
                '                      :datanascimento) ');

    Qry.ParamByName('nome').AsString             :=Self.F_nome;
    Qry.ParamByName('endereco').AsString         :=Self.F_endereco;
    Qry.ParamByName('cidade').AsString           :=Self.F_cidade;
    Qry.ParamByName('bairro').AsString           :=Self.F_bairro;
    Qry.ParamByName('estado').AsString           :=Self.F_estado;
    Qry.ParamByName('cep').AsString              :=Self.F_cep;
    Qry.ParamByName('telefone').AsString         :=Self.F_telefone;
    Qry.ParamByName('email').AsString            :=Self.F_email;
    Qry.ParamByName('datanascimento').AsDatetime :=Self.F_datanascimento;


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

function TCliente.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT clienteId, '+
                '                      nome, '+
                '                      endereco, '+
                '                      cidade, '+
                '                      bairro, '+
                '                      estado, '+
                '                      cep, '+
                '                      telefone, '+
                '                      email, '+
                '                      datanascimento '+
                ' FROM clientes '+
                ' WHERE clienteId = :clienteId ');

  Qry.ParamByName('clienteId').AsInteger:=id;

    try
    Qry.Open;
    Self.F_clienteId:=Qry.FieldByName('clienteId').AsInteger;
    Self.F_nome:=Qry.FieldByName('nome').AsString;
    Self.F_endereco:=Qry.FieldByName('endereco').AsString;
    Self.F_cidade:=Qry.FieldByName('cidade').AsString;
    Self.F_bairro:=Qry.FieldByName('bairro').AsString;
    Self.F_estado:=Qry.FieldByName('estado').AsString;
    Self.F_cep:=Qry.FieldByName('cep').AsString;
    Self.F_telefone:=Qry.FieldByName('telefone').AsString;
    Self.F_email:=Qry.FieldByName('email').AsString;
    Self.F_datanascimento := DateOf(Qry.FieldByName('datanascimento').AsDateTime);

    Except
    Result:=False;
    end;

  Finally
  if Assigned(Qry) then
  FreeAndNil(Qry);
  End;
  End;

end.
