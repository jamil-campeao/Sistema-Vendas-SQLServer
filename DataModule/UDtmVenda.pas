unit UDtmVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Datasnap.DBClient;

type
  Tdtm_venda = class(TDataModule)
    qry_cliente: TZQuery;
    qry_clienteCLIENTEID: TIntegerField;
    qry_clienteNOME: TWideStringField;
    qry_produto: TZQuery;
    qry_produtoPRODUTOID: TIntegerField;
    qry_produtoNOME: TWideStringField;
    qry_produtoVALOR: TFloatField;
    qry_produtoQUANTIDADE: TFloatField;
    dts_cliente: TDataSource;
    dts_produto: TDataSource;
    dts_itensvenda: TDataSource;
    cds_itensvenda: TClientDataSet;
    cds_itensvendaprodutoid: TIntegerField;
    cds_itensvendanomeproduto: TStringField;
    cds_itensvendaquantidade: TFloatField;
    cds_itensvendavalorunitario: TFloatField;
    cds_itensvendavalortotalproduto: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtm_venda: Tdtm_venda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDtmConexao;

{$R *.dfm}

procedure Tdtm_venda.DataModuleCreate(Sender: TObject);
begin
  cds_itensvenda.CreateDataSet;
  Qry_cliente.Open;
  Qry_produto.Open;
end;

procedure Tdtm_venda.DataModuleDestroy(Sender: TObject);
begin
cds_itensvenda.Close;
  Qry_cliente.Close;
  Qry_produto.Close;
end;

end.
