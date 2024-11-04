unit UDTMGrafico;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tdtmgrafico = class(TDataModule)
    qry_produtoestoque: TZQuery;
    qry_produtoestoqueLABEL: TWideStringField;
    qry_produtoestoqueVALUE: TFloatField;
    qry_valorvendaporcliente: TZQuery;
    qry_valorvendaporclienteLABEL: TWideStringField;
    qry_valorvendaporclienteVALUE: TFloatField;
    qry_produtomaisvendidos: TZQuery;
    qry_vendasultimasemana: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmgrafico: Tdtmgrafico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDtmConexao;

{$R *.dfm}

end.
