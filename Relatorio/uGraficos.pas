unit uGraficos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.ExtCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.DBChart, VCLTee.TeeDBCrossTab, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart;

type
  Tfrm_graficos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    DBChart2: TDBChart;
    Series2: TPieSeries;
    DBChart3: TDBChart;
    PieSeries1: TPieSeries;
    DBChart4: TDBChart;
    Series3: TLineSeries;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
  procedure AtualizarDashboard;
    { Public declarations }
  end;

var
  frm_graficos: Tfrm_graficos;

implementation

{$R *.dfm}

uses UDtmConexao, UDTMGrafico;

procedure Tfrm_graficos.AtualizarDashboard;
begin
  try
    Screen.Cursor:=crSQLWait;

      if  DTMGrafico.qry_produtoestoque.Active then
    DTMGrafico.qry_produtoestoque.Close;

   if DTMGrafico.qry_valorvendaporcliente.Active then
  DTMGrafico.qry_valorvendaporcliente.Close;

  if DTMGrafico.qry_produtomaisvendidos.Active then
  DTMGrafico.qry_produtomaisvendidos.Close;

  if DTMGrafico.qry_vendasultimasemana.Active then
  DTMGrafico.qry_vendasultimasemana.Close;


  DTMGrafico.qry_produtoestoque.Open;
  DTMGrafico.qry_valorvendaporcliente.Open;
  DTMGrafico.qry_produtomaisvendidos.Open;
  DTMGrafico.qry_vendasultimasemana.Open;
  finally
  Screen.Cursor:=crDefault;

  end;


end;

procedure Tfrm_graficos.FormCreate(Sender: TObject);
begin
 DTMGrafico:=TDTMGrafico.Create(self);
  AtualizarDashboard;
end;

procedure Tfrm_graficos.Timer1Timer(Sender: TObject);
begin
AtualizarDashboard;
end;

end.
