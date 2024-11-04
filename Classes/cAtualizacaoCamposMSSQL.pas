unit cAtualizacaoCamposMSSQL;

interface

uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs,
ZAbstractConnection, ZConnection,
ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils, DateUtils, cAtualizacaoBancodeDados; //lista de units

type TAtualizacaoCampoMSSQL = class(TAtualizaBancoDados)

private
  function CampoExisteNaTabela(aNomeTabela, aCampo: String): Boolean;
  procedure Versao1;

protected

public
  constructor Create(aConexao:TZConnection);
  destructor Destroy;override;

end;

implementation

{ TAtualizacaoCampoMSSQL }

function TAtualizacaoCampoMSSQL.CampoExisteNaTabela(aNomeTabela,
  aCampo: String): Boolean;
var Qry:TZQuery;
begin
  try
    Result:=False;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT COUNT(COLUMN_NAME) AS QTDE ');
    Qry.SQL.Add(' FROM INFORMATION_SCHEMA.COLUMNS ');
    Qry.SQL.Add(' WHERE TABLE_NAME = :TABELA ');
    Qry.SQL.Add(' AND COLUMN_NAME = :CAMPO ');

    Qry.ParamByName('TABELA').AsString:=aNomeTabela;
    Qry.ParamByName('CAMPO').AsString:=aCampo;
    Qry.Open;

    if Qry.FieldByName('QTDE').AsInteger > 0 then
      Result:=True;

  finally
  Qry.Close;
  if Assigned(Qry) then
    FreeAndNil(Qry);

  end;


end;

constructor TAtualizacaoCampoMSSQL.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
  Versao1;

end;

destructor TAtualizacaoCampoMSSQL.Destroy;
begin

  inherited;
end;

procedure TAtualizacaoCampoMSSQL.Versao1;
begin
 if CampoExisteNaTabela('CATEGORIAS','TESTE') then
  begin
    ExecutaDiretoBancodeDados(' ALTER TABLE CATEGORIAS DROP COLUMN TESTE ');
  end;

  if not CampoExisteNaTabela('PRODUTOS', 'FOTO') then
    BEGIN
      ExecutaDiretoBancodeDados('ALTER TABLE PRODUTOS ADD FOTO VARBINARY(MAX) ');
    END;
end;

end.
