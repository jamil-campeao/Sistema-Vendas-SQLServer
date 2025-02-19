unit uRelCadProdutoComGrupoCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset, UDtmConexao,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, RLXLSFilter;

type
  Tfrm_relcadprodutocomgrupocategoria = class(TForm)
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
    qry_produtoPRODUTOID: TIntegerField;
    qry_produtoNOME: TWideStringField;
    qry_produtoVALOR: TFloatField;
    qry_produtoQUANTIDADE: TFloatField;
    qry_produtoCATEGORIAID: TIntegerField;
    qry_produtoDESCRICAOCATEGORIA: TWideStringField;
    banda_grupo: TRLGroup;
    RLBand3: TRLBand;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel9: TRLLabel;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDraw3: TRLDraw;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel12: TRLLabel;
    RLDBResult3: TRLDBResult;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relcadprodutocomgrupocategoria: Tfrm_relcadprodutocomgrupocategoria;

implementation

{$R *.dfm}

procedure Tfrm_relcadprodutocomgrupocategoria.FormCreate(Sender: TObject);
begin
  Qry_produto.Open;
end;

procedure Tfrm_relcadprodutocomgrupocategoria.FormDestroy(Sender: TObject);
begin
  Qry_produto.Close;
end;

end.
