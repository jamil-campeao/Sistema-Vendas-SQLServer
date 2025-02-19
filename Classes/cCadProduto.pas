unit cCadProduto;

interface
uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs,
ZAbstractConnection, ZConnection,
ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils, DateUtils,
System.StrUtils, Vcl.Imaging.jpeg, Vcl.Graphics; //lista de units

type TProduto = class

private
  ConexaoDB:TZConnection;
  F_produtoId:Integer;
  F_nome:String;
  F_descricao:string;
  F_valor:double;
  F_quantidade:double;
  F_categoriaid:Integer;
  F_Foto:TBitmap;

  public
  constructor Create (aConexao:TZConnection);
  destructor Destroy; Override;
  function Inserir:Boolean;
  function Atualizar:Boolean;
  function Apagar:Boolean;
  function Selecionar(id:Integer) :Boolean;

  published
  property codigo      :Integer          read F_produtoId           write F_produtoId;
  property nome        :string           read F_nome                write F_nome;
  property descricao   :string           read F_descricao           write F_descricao;
  property valor       :double           read F_valor               write F_valor;
  property quantidade  :double           read F_quantidade          write F_quantidade;
  property categoriaid :Integer          read F_categoriaid         write F_categoriaid;
  property foto        :TBitMap          read F_foto                write F_foto;
end;

implementation
{$region 'Constructor and Destructor'}
constructor TProduto.Create(aConexao: TZConnection);
  begin
    ConexaoDB:= aConexao;
    F_Foto := TBitmap.Create;
    F_Foto.Assign(nil);
  end;

destructor TProduto.Destroy;
  begin
    if Assigned(F_foto) then
      begin
        F_Foto.Assign(nil);
        F_foto.Free;
      end;

    inherited;

  end;
{$endRegion}


{$Region 'Crud'}
function TProduto.Apagar: Boolean;
var Qry:TzQuery;
  begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'C�digo: '+InttoStr(F_produtoid)+#13+
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
  Qry.SQL.Add('DELETE FROM PRODUTOS '+
              ' WHERE PRODUTOID= :PRODUTOID ');
  Qry.ParamByName('PRODUTOID').AsInteger:=F_produtoid;

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


function TProduto.Atualizar: Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' UPDATE PRODUTOS '+
                '     SET NOME              =:NOME, '+
                '    DESCRICAO              =:DESCRICAO, '+
                '    VALOR                  =:VALOR, '+
                '    QUANTIDADE             =:QUANTIDADE, '+
                '    CATEGORIAID            =:CATEGORIAID, '+
                '    FOTO                   =:FOTO '+
                ' WHERE PRODUTOID = :PRODUTOID ');

    Qry.ParamByName('PRODUTOID').AsInteger       :=Self.F_PRODUTOID;
    Qry.ParamByName('NOME').AsString             :=Self.F_NOME;
    Qry.ParamByName('DESCRICAO').AsString        :=Self.F_DESCRICAO;
    Qry.ParamByName('VALOR').AsFloat             :=Self.F_VALOR;
    Qry.ParamByName('QUANTIDADE').AsFloat        :=Self.F_QUANTIDADE;
    Qry.ParamByName('CATEGORIAID').AsInteger     :=Self.F_CATEGORIAID;

      if Self.F_Foto.Empty then
        Qry.ParamByName('FOTO').Clear
      else
      Qry.ParamByName('FOTO').Assign(Self.F_Foto);
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


function TProduto.Inserir: Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO PRODUTOS (NOME, '+
                '                      DESCRICAO, '+
                '                      VALOR, '+
                '                      QUANTIDADE, '+
                '                      CATEGORIAID, '+
                '                      FOTO ) '+
                ' VALUES              (:NOME, '+
                '                      :DESCRICAO, '+
                '                      :VALOR, '+
                '                      :QUANTIDADE, '+
                '                      :CATEGORIAID, '+
                '                      :FOTO) ');

    Qry.ParamByName('NOME').AsString             :=Self.F_NOME;
    Qry.ParamByName('DESCRICAO').AsString        :=Self.F_DESCRICAO;
    Qry.ParamByName('VALOR').AsFloat             :=Self.F_VALOR;
    Qry.ParamByName('QUANTIDADE').AsFloat        :=Self.F_QUANTIDADE;
    Qry.ParamByName('CATEGORIAID').AsInteger     :=Self.F_CATEGORIAID;

    if Self.F_Foto.Empty then
    Qry.ParamByName('FOTO').Clear
    else
    Qry.ParamByName('FOTO').Assign(Self.F_Foto);

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


function TProduto.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  Try
    Result:=True;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT PRODUTOID, '+
                '                      NOME, '+
                '                      DESCRICAO, '+
                '                      VALOR, '+
                '                      QUANTIDADE, '+
                '                      CATEGORIAID, '+
                '                      FOTO '+
                ' FROM PRODUTOS '+
                ' WHERE PRODUTOID = :PRODUTOID ');

  Qry.ParamByName('PRODUTOID').AsInteger:=id;

    try
    Qry.Open;

    Self.F_PRODUTOID     :=Qry.FieldByName('PRODUTOID').AsInteger;
    Self.F_NOME          :=Qry.FieldByName('NOME').AsString;
    Self.F_DESCRICAO     :=Qry.FieldByName('DESCRICAO').AsString;
    Self.F_VALOR         :=Qry.FieldByName('VALOR').AsFloat;
    Self.F_QUANTIDADE    :=Qry.FieldByName('QUANTIDADE').AsFloat;
    Self.F_CATEGORIAID   :=Qry.FieldByName('CATEGORIAID').AsInteger;
    Self.F_FOTO.Assign(Qry.FieldByName('FOTO'));

    Except
    Result:=False;
    end;

  Finally
  if Assigned(Qry) then
  FreeAndNil(Qry);
  End;
  End;


end.
