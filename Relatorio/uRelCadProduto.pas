unit uRelCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset, UDtmConexao,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, RLXLSFilter;

type
  Tfrm_relcadproduto = class(TForm)
    qry_produto: TZQuery;
    dts_produto: TDataSource;
    Relatorio: TRLReport;
    cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    Rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabel4: TRLLabel;
    qry_produtoPRODUTOID: TIntegerField;
    qry_produtoNOME: TWideStringField;
    qry_produtoVALOR: TFloatField;
    qry_produtoQUANTIDADE: TFloatField;
    RLLabel6: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText4: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relcadproduto: Tfrm_relcadproduto;

implementation

{$R *.dfm}

procedure Tfrm_relcadproduto.FormCreate(Sender: TObject);
begin
  Qry_produto.Open;
end;

procedure Tfrm_relcadproduto.FormDestroy(Sender: TObject);
begin
  Qry_produto.Close;
end;

end.
