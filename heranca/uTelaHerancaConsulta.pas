unit uTelaHerancaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Vcl.Buttons;

type
  Tfrm_herancaconsulta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    msk_pesquisar: TMaskEdit;
    lbl_indice: TLabel;
    qry_listagem: TZQuery;
    dts_listagem: TDataSource;
    grd_pesquisa: TDBGrid;
    btn_fechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_fecharClick(Sender: TObject);
    procedure grd_pesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grd_pesquisaTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure grd_pesquisaDblClick(Sender: TObject);
    procedure msk_pesquisarChange(Sender: TObject);
  private
    procedure ExibirLabelIndice(Campo: String; aLabel: Tlabel);
    function RetornarCampoTraduzido(Campo: String): string;
    { Private declarations }
  public
    aRetornarIdSelecionado:Variant;
    aIniciarPesquisaID:Variant;
    ACampoID:String;
    IndiceAtual:String;
  end;

var
  frm_herancaconsulta: Tfrm_herancaconsulta;

implementation

{$R *.dfm}

procedure Tfrm_herancaconsulta.btn_fecharClick(Sender: TObject);
begin
 Close;
end;

procedure Tfrm_herancaconsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Qry_listagem.Active then
  Qry_listagem.Close;
end;

procedure Tfrm_herancaconsulta.FormCreate(Sender: TObject);
begin
 if Qry_listagem.Active then
  Qry_listagem.Close;
  ExibirLabelIndice(IndiceAtual, lbl_indice);
  Qry_Listagem.Open;
end;

procedure Tfrm_herancaconsulta.FormShow(Sender: TObject);
begin
  if (aIniciarPesquisaID<>Unassigned) then
    begin
      Qry_listagem.Locate(aCampoId, aIniciarPesquisaID, [loPartialKey]);
    end;
end;

procedure Tfrm_herancaconsulta.grd_pesquisaDblClick(Sender: TObject);
begin
 aRetornarIdSelecionado := Qry_listagem.FieldByName(aCampoId).AsVariant;
 Close;
end;

procedure Tfrm_herancaconsulta.grd_pesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) then
    Key:= 0;
end;


procedure Tfrm_herancaconsulta.grd_pesquisaTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  Qry_listagem.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lbl_indice);
end;

procedure Tfrm_herancaconsulta.msk_pesquisarChange(Sender: TObject);
begin
  Qry_listagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
end;

procedure Tfrm_herancaconsulta.ExibirLabelIndice(Campo:String; aLabel:Tlabel);
  begin
   aLabel.Caption:=RetornarCampoTraduzido(Campo);
  end;

  function Tfrm_herancaconsulta.RetornarCampoTraduzido(Campo:String):string;
var i:Integer;
  begin
    for I := 0 to Qry_listagem.Fields.Count-1 do

      begin
        if lowercase(Qry_listagem.Fields[i].FieldName)=lowercase(campo) then
          begin
            Result:=Qry_listagem.Fields[i].DisplayLabel;
            Break;
          end;
      end;

  end;

end.
