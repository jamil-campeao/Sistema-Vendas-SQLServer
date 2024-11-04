unit uRelVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset, UDtmConexao,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, RLXLSFilter;

type
  Tfrm_relvenda = class(TForm)
    qry_venda: TZQuery;
    dts_venda: TDataSource;
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
    banda_grupo: TRLGroup;
    RLBand3: TRLBand;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText6: TRLDBText;
    RLBand5: TRLBand;
    RLDBResult2: TRLDBResult;
    RLDraw4: TRLDraw;
    RLLabel6: TRLLabel;
    qry_vendaitens: TZQuery;
    dts_vendaitens: TDataSource;
    qry_vendaitensVENDAID: TIntegerField;
    qry_vendaitensPRODUTOID: TIntegerField;
    qry_vendaitensNOME: TWideStringField;
    qry_vendaitensQUANTIDADE: TFloatField;
    qry_vendaitensVALORUNITARIO: TFloatField;
    qry_vendaitensTOTALPRODUTO: TFloatField;
    RLLabel9: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    qry_vendaVENDAID: TIntegerField;
    qry_vendaCLIENTEID: TIntegerField;
    qry_vendaNOME: TWideStringField;
    qry_vendaDATAVENDA: TDateTimeField;
    qry_vendaTOTALVENDA: TFloatField;
    RLSubDetail1: TRLSubDetail;
    RLBand2: TRLBand;
    RLBand4: TRLBand;
    RLDBText5: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relvenda: Tfrm_relvenda;

implementation

{$R *.dfm}

procedure Tfrm_relvenda.FormDestroy(Sender: TObject);
begin
  Qry_venda.Close;
  Qry_vendaitens.Close;
end;

end.
