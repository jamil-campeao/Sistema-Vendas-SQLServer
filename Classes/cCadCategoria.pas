unit cCadCategoria;

interface
uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs,
ZAbstractConnection, ZConnection,
ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils; //lista de units

type
  TCategoria = class //declaracao da classe
  private
  ConexaoDB:TZConnection;
  F_categoriaId:Integer; //int
  F_descricao:string;
    function Getcodigo: Integer;
    function getdescricao: string;
    procedure setcodigo(const Value: Integer);
    procedure setdescricao(const Value: string);    //varchar

  public
  constructor Create(aConexao:TZConnection); //construtor da classe
  destructor Destroy; override; //destroi a classe usar o override por causa de sobrever variaveis
  function Inserir:Boolean;
  function Atualizar:Boolean;
  function Apagar:Boolean;
  function Selecionar(id:Integer):Boolean;

  published
  //variaveis publicas utilizadas para propriedades da classe
  property codigo:Integer read Getcodigo write setcodigo;
  property descricao:string read getdescricao write setdescricao;
  end;

implementation

{ TCategoria }


{$region 'Constructor e Destructor'}
constructor TCategoria.Create(aConexao:TZConnection);
begin
  ConexaoDB:= aConexao;
end;

destructor TCategoria.Destroy;
begin
  inherited;
end;
{$endregion}

{$region 'CRUD'}

function TCategoria.Apagar: Boolean;
var Qry:TZQuery;
  begin
    if MessageDlg('Apagar Registro: '+#13+#13+
    'Codigo: '+IntToStr(F_categoriaId)+#13+
    'Descricao: '+F_descricao,mtconfirmation,[mbYes, MbNo],0)=mrNo
    then
    begin
      Result:=False;
      abort;
    end;

  try
  Result:=True;
  Qry:= TZQuery.Create(nil);
  Qry.Connection:=ConexaoDB;
  Qry.SQL.Clear;
  Qry.SQL.Add(
  'DELETE FROM CATEGORIAS '+
           ' WHERE CATEGORIAID = :CATEGORIAID ');
  Qry.ParamByName('CATEGORIAID').AsInteger := F_categoriaid;

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
  FreeandNil(Qry);
  end;
end;

function TCategoria.Atualizar: Boolean;
var Qry:TZQuery;
  begin
  try
  Result:=true;
  Qry:= TZQuery.Create(nil);
  Qry.Connection:=ConexaoDB;
  Qry.SQL.Clear;
  Qry.SQL.Add(
  'UPDATE CATEGORIAS '+
           ' set descricao = :descricao '+
           ' WHERE CATEGORIAID = :CATEGORIAID ');
  Qry.ParamByName('CATEGORIAID').AsInteger := Self.F_categoriaId;
  Qry.ParamByName('descricao').AsString := Self.F_descricao;

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
  FreeandNil(Qry);
  end;
end;

function TCategoria.Inserir: Boolean;
var Qry:TZQuery;
begin
  Qry:= TZQuery.Create(nil);
  Qry.Connection:=ConexaoDB;
  Qry.SQL.Clear;
  Qry.SQL.Add(
  'INSERT INTO categorias (descricao) values (:descricao)');
  Qry.ParamByName('descricao').AsString:=Self.F_descricao;

    Try
    ConexaoDB.StartTransaction;
    Qry.ExecSQL;
    ConexaoDB.Commit;

    Except
    ConexaoDB.Rollback;
    Result:=False;
    End;

end;

function TCategoria.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
  begin
  try
  Result:=True;
  Qry:= TZQuery.Create(nil);
  Qry.Connection:=ConexaoDB;
  Qry.SQL.Clear;
  Qry.SQL.Add(
  'SELECT CATEGORIAID, '+
           'descricao  '+
           'FROM CATEGORIAS '+
           'WHERE CATEGORIAID = :CATEGORIAID ');
  Qry.ParamByName('CATEGORIAID').AsInteger := id;


    try
    Qry.Open;
      if not Qry.IsEmpty then
      begin

      Self.F_categoriaId:= Qry.FieldByName('CATEGORIAID').AsInteger;
      Self.F_descricao:= Qry.FieldByName('descricao').AsString;
      Result:=True;
      end;
    Except
    Result:=False;
    end;
  finally
  if Assigned(Qry) then
  FreeandNil(Qry);
  end;
end;

{$endregion}


{$region 'gets'}

function TCategoria.Getcodigo: Integer;
begin
  Result:= Self.F_categoriaId;
end;

function TCategoria.getdescricao: string;
begin
  Result:= Self.F_descricao;
end;

{$endregion}



{$region 'Sets'}

procedure TCategoria.setcodigo(const Value: Integer);
begin
     Self.F_categoriaId := Value;
end;

procedure TCategoria.setdescricao(const Value: string);
begin
  Self.F_descricao := Value;

end;

{$endregion}

end.
