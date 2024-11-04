unit cAtualizacaoTabelaMSSQL;

interface

uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs,
ZAbstractConnection, ZConnection,
ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils, DateUtils,
cAtualizacaoBancodeDados, cUsuario; //lista de units

type
  TAtualizacaoTabelaMSSQL = class(TAtualizaBancoDados)

  private
  function TabelaExiste(aNomeTabela:string):boolean;
    procedure Categoria;
    procedure Clientes;
    procedure Usuario;
    procedure Produtos;
    procedure VENDAS;
    procedure VENDASITENS;
    procedure AcaoAcesso;
    procedure UsuariosAcaoacesso;

  protected

  public
  constructor Create(aConexao:TZConnection);
  destructor Destroy;override;

  end;

implementation

{ TAtualizacaoTabelaMSSQL }

constructor TAtualizacaoTabelaMSSQL.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
  Categoria;
  Clientes;
  Usuario;
  Produtos;
  Vendas;
  VENDASITENS;
  ACAOACESSO;
  USUARIOSACAOACESSO;

end;

destructor TAtualizacaoTabelaMSSQL.Destroy;
begin

  inherited;
end;

function TAtualizacaoTabelaMSSQL.TabelaExiste(aNomeTabela: string): boolean;
var Qry:TZQuery;
begin
  try
    Result:=False;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT OBJECT_ID (:NOMETABELA) AS ID ');
    Qry.ParamByName('NOMETABELA').AsString:=aNomeTabela;
    Qry.Open;

    if Qry.FieldByName('ID').AsInteger > 0 then
      Result:=True;

  finally
  Qry.Close;
  if Assigned(Qry) then
    FreeAndNil(Qry);

  end;


end;

procedure TAtualizacaoTabelaMSSQL.AcaoAcesso;
begin
 if not TabelaExiste('ACAOACESSO') then
  begin
    ExecutaDiretoBancodeDados(
    ' CREATE TABLE ACAOACESSO ( '+
    ' ACAOACESSOID INT IDENTITY(1,1) NOT NULL, '+
    ' DESCRICAO VARCHAR(100) NOT NULL, '+
    ' CHAVE VARCHAR(60) NOT NULL, '+
    ' PRIMARY KEY (ACAOACESSOID) '+
    ' ) '
    );
  end;
end;

procedure TAtualizacaoTabelaMSSQL.Categoria;
begin
 if not TabelaExiste('categorias') then
  begin
   ExecutaDiretoBancodeDados(

    ' CREATE TABLE CATEGORIAS( '+
    ' CATEGORIAID INT iDENTITY(1,1) NOT NULL, '+
    ' DESCRICAO VARCHAR(30) NULL, '+
    ' PRIMARY KEY(CATEGORIAID) '+
    ' ) '
  );
  END;

  end;

  procedure TAtualizacaoTabelaMSSQL.Clientes;
begin
 if not TabelaExiste('clientes') then
  begin
   ExecutaDiretoBancodeDados(

  ' CREATE TABLE CLIENTES( '+
  ' CLIENTEID INT IDENTITY(1,1) NOT NULL, '+
  ' NOME VARCHAR(60) NULL, '+
  ' ENDERECO VARCHAR(60) NULL, '+
  ' CIDADE VARCHAR(50) NULL, '+
  ' BAIRRO VARCHAR(40) NULL, '+
  ' ESTADO VARCHAR(2) NULL, '+
  ' CEP VARCHAR(2) NULL, '+
  ' TELEFONE VARCHAR(14) NULL, '+
  ' EMAIL VARCHAR(100) NULL, '+
  ' DATANASCIMENTO DATETIME NULL '+
  ' PRIMARY KEY (CLIENTEID) '+
  ' ) '

  );
  END;

  end;

   procedure TAtualizacaoTabelaMSSQL.Usuario;
   var oUsuario:TUsuario;
begin
 if not TabelaExiste('Usuarios') then
  begin
   ExecutaDiretoBancodeDados(

	' CREATE TABLE USUARIOS ( '+
  ' USUARIOID INT IDENTITY(1,1) NOT NULL, '+
	' NOME VARCHAR(50) NOT NULL, '+
	' SENHA VARCHAR(40) NOT NULL, '+
  ' PRIMARY KEY (USUARIOID) '+
	' ) '
  );

      Try
    oUsuario:=TUsuario.Create(ConexaoDB);
    oUsuario.nome:='ADMIN';
    oUsuario.senha:='ADMIN';

      if not oUsuario.UsuarioExiste(oUsuario.nome) then
        oUsuario.Inserir;

    Finally
      if Assigned(oUsuario) then
      FreeandNil(oUsuario);

    End;

  END;
  end;


   procedure TAtualizacaoTabelaMSSQL.UsuariosAcaoacesso;
begin
  if not TabelaExiste('USUARIOSACAOACESSO') then
    BEGIN
      ExecutaDiretoBancodeDados(
        'CREATE TABLE USUARIOSACAOACESSO( '+
        ' USUARIOID INT NOT NULL, '+
        ' ACAOACESSOID INT NOT NULL, '+
        ' ATIVO BIT NOT NULL, '+
        ' PRIMARY KEY (USUARIOID, ACAOACESSOID), '+
        ' CONSTRAINT FK_USUARIOACAOACESSOUSUARIO '+
        ' FOREIGN KEY (USUARIOID) REFERENCES USUARIOS(USUARIOID), '+
        ' CONSTRAINT FK_USUARIOACAOACESSOACAOACESSO '+
        ' FOREIGN KEY (ACAOACESSOID) REFERENCES ACAOACESSO(ACAOACESSOID), '+
        ' ) '
        );
    END;

end;

procedure TAtualizacaoTabelaMSSQL.Produtos;
begin
 if not TabelaExiste('PRODUTOS') then
  begin
   ExecutaDiretoBancodeDados(

  ' CREATE TABLE PRODUTOS( '+
  ' PRODUTOID INT IDENTITY(1,1) NOT NULL, '+
  ' NOME VARCHAR(60) NULL, '+
  ' DESCRICAO VARCHAR(255) NULL, '+
  ' VALOR DECIMAL(18,5) DEFAULT 0.00000 NULL, '+
  ' QUANTIDADE DECIMAL(18,5) DEFAULT 0.00000 NULL, '+
  ' CATEGORIAID INT NULL, '+
  ' PRIMARY KEY (PRODUTOID), '+
  ' CONSTRAINT FK_PRODUTOSCATEGORIAS '+
  ' FOREIGN KEY (CATEGORIAID) REFERENCES CATEGORIAS(CATEGORIAID) '+
  ' ) '
  );
  END;

  end;


   procedure TAtualizacaoTabelaMSSQL.VENDAS;
begin
 if not TabelaExiste('VENDAS') then
  begin
   ExecutaDiretoBancodeDados(

  ' CREATE TABLE VENDAS ( '+
  ' VENDAID INT IDENTITY(1,1) NOT NULL, '+
  ' CLIENTEID INT NOT NULL, '+
  ' DATAVENDA datetime default getdate(), '+
  ' TOTALVENDA decimal(18,5) default 0.00000, '+
  ' PRIMARY KEY (VENDAID), '+
  ' CONSTRAINT FK_VENDASCLIENTES FOREIGN KEY (CLIENTEID) '+
  ' REFERENCES CLIENTES (CLIENTEID) '+
  ' ) '
  );
  end;

  end;


   procedure TAtualizacaoTabelaMSSQL.VENDASITENS;
begin
 if not TabelaExiste('VENDASITENS') then
  begin
   ExecutaDiretoBancodeDados(

  ' CREATE TABLE VENDASITENS ( '+
  ' VENDAID INT NOT NULL, '+
  ' PRODUTOID INT NOT NULL, '+
  ' VALORUNITARIO DECIMAL (18,5) DEFAULT 0.00000, '+
  ' QUANTIDADE DECIMAL (18,5) DEFAULT 0.00000, '+
  ' TOTALPRODUTO DECIMAL (18,5) DEFAULT 0.00000, '+
  ' PRIMARY KEY (VENDAID,PRODUTOID), '+
  ' CONSTRAINT FK_VENDASITENSPRODUTOS FOREIGN KEY (PRODUTOID) '+
  ' REFERENCES PRODUTOS (PRODUTOID) '+
  ' ) '
  );
  end;




  end;

end.
