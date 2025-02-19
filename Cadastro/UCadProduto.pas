unit UCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Utelaheranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  RxToolEdit, RxCurrEdit, cCadProduto, uEnum, uDtmConexao, uCadCategoria, cFuncao, uConCategoria,
  Vcl.Menus;

type
  Tfrm_produto = class(Tfrm_heranca)
    qry_listagemprodutoId: TIntegerField;
    qry_listagemnome: TWideStringField;
    qry_listagemdescricao: TWideStringField;
    qry_listagemquantidade: TFloatField;
    qry_listagemcategoriaId: TIntegerField;
    qry_listagemDescricaoCategoria: TWideStringField;
    qry_listagemvalor: TFloatField;
    memo_descricao: TMemo;
    Label1: TLabel;
    edt_valor: TCurrencyEdit;
    edt_quantidade: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    lkp_categoria: TDBLookupComboBox;
    qry_categoria: TZQuery;
    dts_categoria: TDataSource;
    qry_categoriaCATEGORIAID: TIntegerField;
    qry_categoriadescricao: TWideStringField;
    Label4: TLabel;
    edt_produtoid: TLabeledEdit;
    edt_descricao: TLabeledEdit;
    btn_incluircategoria: TSpeedButton;
    btn_pesquisarcategoria: TSpeedButton;
    pnl_imagem: TPanel;
    img_imagem: TImage;
    ppm_imagem: TPopupMenu;
    CarregarImagem1: TMenuItem;
    LimparImagem1: TMenuItem;
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluircategoriaClick(Sender: TObject);
    procedure btn_pesquisarcategoriaClick(Sender: TObject);
    procedure LimparImagem1Click(Sender: TObject);
    procedure CarregarImagem1Click(Sender: TObject);
  private
    { Private declarations }
    oProduto:TProduto;
    function Apagar:Boolean; override;
    function Gravar (EstadodoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frm_produto: Tfrm_produto;

implementation

uses uPrincipal;

{$R *.dfm}
{$region 'Override'}

{ Tfrm_produto }

//BOTAO APAGAR

function Tfrm_produto.Apagar: Boolean;
begin
 if oProduto.Selecionar(Qry_listagem.FieldByName('PRODUTOID').AsInteger) then
  begin
    Result:=oProduto.Apagar;
  end;
end;

//BOTAO GRAVAR

function Tfrm_produto.Gravar(EstadodoCadastro: TEstadodoCadastro): Boolean;
begin
  if edt_produtoid.Text <>EmptyStr then
  oProduto.codigo:=StrToInt(Edt_produtoid.Text)
  else
  oProduto.codigo:=0;

  oProduto.nome                 :=edt_descricao.Text;
  oProduto.descricao            :=memo_descricao.Text;
  oProduto.categoriaid          :=lkp_categoria.KeyValue;
  oProduto.valor                :=edt_valor.Value;
  oProduto.quantidade           :=edt_quantidade.Value;
  if img_imagem.Picture.BitMap.Empty then
    oProduto.foto.Assign(nil)
    else
  oProduto.foto.Assign(img_imagem.Picture);

if (EstadodoCadastro=EcInserir) then
  Result:=oProduto.Inserir

  else if (EstadodoCadastro=ecAlterar) then
    Result:=oProduto.Atualizar;
  end;

  procedure Tfrm_produto.LimparImagem1Click(Sender: TObject);
begin
  inherited;
   TFuncao.LimparImagem(img_imagem);
end;

procedure Tfrm_produto.btn_incluircategoriaClick(Sender: TObject);
begin
  TFuncao.CriarForm(Tfrm_cadcategoria, oUsuarioLogado, DtmPrincipal.ConexaoDB);
  Qry_categoria.Refresh;
  inherited;

end;

{$Endregion}


//BOTAO ALTERAR

procedure Tfrm_produto.btn_alterarClick(Sender: TObject);
begin
 if oProduto.Selecionar(Qry_listagem.FieldByName('PRODUTOID').AsInteger) then
  begin
    edt_produtoid.Text       :=InttoStr(oProduto.codigo);
    edt_descricao.Text       :=oProduto.nome;
    memo_descricao.Text      :=oProduto.descricao;
    lkp_categoria.KeyValue   :=oProduto.categoriaid;
    edt_valor.Value          :=oProduto.valor;
    edt_quantidade.Value     :=oProduto.quantidade;
    img_imagem.Picture.Assign(oProduto.foto);
  end
  else
  begin
  MessageDlg('Erro ao executar select ', TMsgDlgType.mtError, [mbOK], 0);
    btn_cancelar.Click;
    Abort;
  end;
  inherited;

end;

procedure Tfrm_produto.btn_novoClick(Sender: TObject);
begin
  inherited;
 edt_descricao.SetFocus;


end;

procedure Tfrm_produto.btn_pesquisarcategoriaClick(Sender: TObject);
begin
   inherited;
   try
   frm_concategoria := Tfrm_ConCategoria.Create(self);

   if lkp_categoria.KeyValue<>Null then
    frm_concategoria.aIniciarPesquisaID:=lkp_categoria.KeyValue;

    frm_concategoria.ShowModal;

    if frm_concategoria.aRetornarIdSelecionado<>Unassigned then
      lkp_categoria.KeyValue:=frm_concategoria.aRetornarIdSelecionado;
   finally
     frm_concategoria.Release;
   end;

end;

procedure Tfrm_produto.CarregarImagem1Click(Sender: TObject);
begin
  inherited;
  TFuncao.CarregarImagem(img_imagem);
end;

procedure Tfrm_produto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Qry_categoria.Close;
  if assigned(oProduto) then
    FreeandNil (oProduto);

end;

procedure Tfrm_produto.FormCreate(Sender: TObject);
begin
  inherited;
  oProduto:=TProduto.Create(dtmprincipal.ConexaoDB);

  IndiceAtual:='nome';

end;

procedure Tfrm_produto.FormShow(Sender: TObject);
begin
  inherited;

  Qry_categoria.Open;
end;

end.
