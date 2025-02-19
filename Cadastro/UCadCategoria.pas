unit UCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Utelaheranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, cCadCategoria, udtmConexao, UEnum;

type
  Tfrm_cadcategoria = class(Tfrm_heranca)
    qry_listagemcategoriaid: TIntegerField;
    qry_listagemdescricao: TWideStringField;
    edt_categoriaid: TLabeledEdit;
    edt_descricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_alterarClick(Sender: TObject);
    procedure tab_manutencaoContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
  oCategoria:TCategoria;
      function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadodoCadastro):Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadcategoria: Tfrm_cadcategoria;

implementation

{$R *.dfm}

{$region 'override'}

function Tfrm_cadcategoria.Apagar: Boolean;
begin
   if oCategoria.Selecionar(Qry_listagem.FieldByName('categoriaid').AsInteger) then
   begin
   Result:= oCategoria.Apagar;
   end;

end;

function Tfrm_cadcategoria.Gravar(
  EstadoDoCadastro:TEstadodoCadastro): Boolean;
begin
if edt_categoriaid.Text<>EmptyStr then
  begin
    oCategoria.codigo:= StrtoInt(edt_categoriaid.Text)
  end

  else
  oCategoria.codigo:=0;
  oCategoria.descricao:= edt_descricao.Text;

 if  (EstadoDoCadastro=ecInserir) then
    Result:= oCategoria.Inserir

else if (EstadoDoCadastro=ecAlterar) then
    Result:= oCategoria.Atualizar;

end;

procedure Tfrm_cadcategoria.tab_manutencaoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  inherited;

end;

{$endregion}

procedure Tfrm_cadcategoria.btn_alterarClick(Sender: TObject);
begin
  if oCategoria.Selecionar(Qry_listagem.FieldByName('categoriaid').AsInteger) then
    begin
      edt_categoriaid.Text:= InttoStr(oCategoria.codigo);
      edt_descricao.Text:= oCategoria.descricao;
    end

    else
    begin
    MessageDlg('Erro ao executar select ', TMsgDlgType.mtError, [mbOK], 0);
      btn_cancelar.Click;
      Abort;
    end;

inherited;

end;

procedure Tfrm_cadcategoria.btn_gravarClick(Sender: TObject);
begin
{if (edt_descricao.Text=EmptyStr) then
  begin
    ShowMessage('Campo Obrigatório');
    edt_descricao.SetFocus;
    abort;
  end;}
  inherited;
end;

procedure Tfrm_cadcategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
    FreeandNil(oCategoria);
end;

procedure Tfrm_cadcategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria:=TCategoria.Create(dtmprincipal.ConexaoDB);
  IndiceAtual:='descricao';
end;



end.
