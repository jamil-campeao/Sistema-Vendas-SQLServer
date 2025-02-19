unit cControleEstoque;

interface
uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs,
ZAbstractConnection, ZConnection,
ZAbstractRODataset, ZAbstractDataset,
ZDataset, System.SysUtils, DateUtils,
Data.DB, Datasnap.DBClient; //lista de units

type TControleEstoque = class
  private
  ConexaoDB:TZConnection;
  F_produtoid:Integer;
  F_quantidade:Double;

  public
  constructor Create (aConexao:TZConnection);
  destructor Destroy; Override;
  function BaixarEstoque:Boolean;
  function RetornarEstoque:Boolean;
  published
  property ProdutoId:Integer        read F_ProdutoId     write F_ProdutoId;
  property Quantidade:Double        read F_Quantidade    write F_Quantidade;
  end;

implementation

{$region 'Constructor and Destructor'}
constructor TControleEstoque.Create(aConexao: TZConnection);
  begin
    ConexaoDB:= aConexao;
  end;

destructor TControleEstoque.Destroy;
  begin
    inherited;
  end;
{$endRegion}

function TControleEstoque.BaixarEstoque: Boolean;
var Qry:TZQuery;
  begin
    try
      Result:=True;
      Qry:=TZQuery.Create(nil);
      Qry.Connection:=ConexaoDB;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE PRODUTOS '+
                  ' SET QUANTIDADE = QUANTIDADE - :QTDEBAIXA '+
                  ' WHERE PRODUTOID = :PRODUTOID ');

    Qry.ParamByName('PRODUTOID').AsInteger :=Produtoid;
    Qry.ParamByName('QTDEBAIXA').AsFloat   :=Quantidade;

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


function TControleEstoque.RetornarEstoque: Boolean;
var Qry:TZQuery;
  begin
    try
      Result:=True;
      Qry:=TZQuery.Create(nil);
      Qry.Connection:=ConexaoDB;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE PRODUTOS '+
                  ' SET QUANTIDADE = QUANTIDADE + :QTDERETORNO '+
                  ' WHERE PRODUTOID = :PRODUTOID ');

    Qry.ParamByName('PRODUTOID').AsInteger   :=Produtoid;
    Qry.ParamByName('QTDERETORNO').AsFloat   :=Quantidade;

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

end.
