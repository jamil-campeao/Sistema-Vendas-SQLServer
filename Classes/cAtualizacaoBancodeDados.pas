unit cAtualizacaoBancodeDados;

interface

uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs,
ZAbstractConnection, ZConnection,
ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils, DateUtils; //lista de units

type
TAtualizaBancoDados = class

private


public
  ConexaoDB:TZConnection;
  constructor Create(aConexao:TZConnection);
  procedure ExecutaDiretoBancodeDados(aScript: String);
end;

Type
  TAtualizaBancoDadosMSSQL = Class
    private
    ConexaoDB:TZConnection;

    public
    function AtualizarBancoDeDados:Boolean;
    constructor Create(aConexao:TZConnection);
  End;

implementation

uses cAtualizacaoTabelaMSSQL, cAtualizacaoCamposMSSQL;

{ TAtualizaBancoDados }

constructor TAtualizaBancoDados.Create(aConexao: TZConnection);
begin
 ConexaoDB:=aConexao;
end;

procedure TAtualizaBancoDados.ExecutaDiretoBancodeDados(aScript: String);
var Qry:TZQuery;
begin
  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(aScript);

      try
        ConexaoDB.StartTransaction;
        Qry.ExecSQL;
        ConexaoDB.Commit;
      Except
      ConexaoDB.Rollback;

      end;
  finally
  Qry.Close;

  if Assigned(Qry) then
    FreeandNil(Qry);

  end;

end;

{ TAtualizaBancoDadosMSSQL }

function TAtualizaBancoDadosMSSQL.AtualizarBancoDeDados: Boolean;
var oAtualizarDB:TAtualizaBancoDados;
    oTabela: TAtualizacaoTabelaMSSQL;
    oCampo: TAtualizacaoCampoMSSQL;
begin
  try
    //Classe principal de atualiza��o
    oAtualizarDB:=TAtualizaBancoDados.Create(ConexaoDB);

    //Classe Filha (heran�a) DE ATUALIZACAO
    oTabela:=TAtualizacaoTabelaMSSQL.Create(ConexaoDB);
    oCampo :=TAtualizacaoCampoMSSQL.Create(ConexaoDB);


  finally
    if Assigned(oAtualizarDB) then
    FreeAndNil(oAtualizarDB);


    if Assigned(oTabela) then
    FreeAndNil(oTabela);
  end;

end;

constructor TAtualizaBancoDadosMSSQL.Create(aConexao: TZConnection);
begin
 ConexaoDB:=aConexao;
end;

end.
