unit uRelCadClienteFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset, UDtmConexao,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, RLXLSFilter,
  Vcl.Imaging.pngimage;

type
  Tfrm_relcadclienteficha = class(TForm)
    RLPDFFilter1: TRLPDFFilter;
    qry_cliente: TZQuery;
    dts_cliente: TDataSource;
    Relatorio: TRLReport;
    cabecalho: TRLBand;
    RLDraw1: TRLDraw;
    RLLabel1: TRLLabel;
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
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel13: TRLLabel;
    RLDBText10: TRLDBText;
    RLDraw3: TRLDraw;
    qry_clienteCLIENTEID: TIntegerField;
    qry_clienteNOME: TWideStringField;
    qry_clienteENDERECO: TWideStringField;
    qry_clienteCIDADE: TWideStringField;
    qry_clienteBAIRRO: TWideStringField;
    qry_clienteESTADO: TWideStringField;
    qry_clienteCEP: TWideStringField;
    qry_clienteTELEFONE: TWideStringField;
    qry_clienteEMAIL: TWideStringField;
    qry_clienteDATANASCIMENTO: TDateTimeField;
    RLImage2: TRLImage;
    RLImage1: TRLImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relcadclienteficha: Tfrm_relcadclienteficha;

implementation

{$R *.dfm}

procedure Tfrm_relcadclienteficha.FormCreate(Sender: TObject);
begin
  Qry_cliente.Open;
end;

procedure Tfrm_relcadclienteficha.FormDestroy(Sender: TObject);
begin
  Qry_cliente.Close;
end;

end.
