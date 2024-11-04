unit uRelCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset, UDtmConexao,
  ZAbstractDataset, ZDataset, RLReport, RLFilters, RLPDFFilter, RLXLSFilter;

type
  Tfrm_relcadcliente = class(TForm)
    qry_cliente: TZQuery;
    dts_cliente: TDataSource;
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
    qry_clienteCLIENTEID: TIntegerField;
    qry_clienteNOME: TWideStringField;
    qry_clienteEMAIL: TWideStringField;
    qry_clienteTELEFONE: TWideStringField;
    qry_clienteDATANASCIMENTO: TDateTimeField;
    RLLabel6: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relcadcliente: Tfrm_relcadcliente;

implementation

{$R *.dfm}

procedure Tfrm_relcadcliente.FormCreate(Sender: TObject);
begin
  Qry_cliente.Open;
end;

procedure Tfrm_relcadcliente.FormDestroy(Sender: TObject);
begin
  Qry_cliente.Close;
end;

end.
