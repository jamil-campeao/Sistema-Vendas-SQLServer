unit uConCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHerancaConsulta, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls;

type
  Tfrm_concategoria = class(Tfrm_herancaconsulta)
    qry_listagemCATEGORIAID: TIntegerField;
    qry_listagemDESCRICAO: TWideStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_concategoria: Tfrm_concategoria;

implementation

{$R *.dfm}

procedure Tfrm_concategoria.FormCreate(Sender: TObject);
begin
  aCampoId := 'categoriaid';
  IndiceAtual := 'descricao';
  inherited;

end;

end.
