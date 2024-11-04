unit uCadAcaoAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Utelaheranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, cAcaoAcesso, uEnum,
  UDtmConexao;

type
  Tfrm_cadacaoacesso = class(Tfrm_heranca)
    qry_listagemACAOACESSOID: TIntegerField;
    qry_listagemDESCRICAO: TWideStringField;
    qry_listagemCHAVE: TWideStringField;
    edt_descricao: TLabeledEdit;
    edt_acaoacessoid: TLabeledEdit;
    edt_chave: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oAcaoAcesso:TAcaoAcesso;
    function Gravar(EstadodoCadastro:TEstadodoCadastro):Boolean; override;
    function Apagar:Boolean; override;
  end;

  var
  frm_cadacaoacesso: Tfrm_cadacaoacesso;

implementation

{$R *.dfm}

function Tfrm_cadacaoacesso.Apagar: Boolean;
begin
 if oAcaoAcesso.Selecionar(Qry_Listagem.FieldByName('ACAOACESSOID').AsInteger) then
  begin
    Result:=oAcaoAcesso.Apagar;
  end;

end;

procedure Tfrm_cadacaoacesso.btn_alterarClick(Sender: TObject);
begin
 if oAcaoAcesso.Selecionar(Qry_listagem.FieldByName('ACAOACESSOID').AsInteger) then
  begin
    edt_acaoacessoid.Text:= InttoStr(oAcaoAcesso.codigo);
    edt_descricao.Text   := oAcaoacesso.descricao;
    edt_chave.Text       := oAcaoacesso.chave;
  end

  else
  begin
    btn_cancelar.Click;
    Abort;
  end;


  inherited;

end;

procedure Tfrm_cadacaoacesso.btn_gravarClick(Sender: TObject);
begin

  if edt_acaoacessoid.Text <> EmptyStr then
    begin
      oAcaoacesso.codigo:= StrToInt(edt_acaoacessoid.Text);
    end

  else
  begin
    oAcaoAcesso.codigo:=0;

    oAcaoacesso.descricao := edt_descricao.Text;
    oAcaoacesso.chave     := edt_chave.Text;
  end;

    if oAcaoAcesso.ChaveExiste(edt_chave.Text) then
    begin
      MessageDlg('Chave j� cadastrada',TMsgDlgType.mtInformation, [mbOK],0);
      edt_chave.SetFocus;
      abort;
    end;
  inherited;

  end;



procedure Tfrm_cadacaoacesso.btn_novoClick(Sender: TObject);
begin
  inherited;
   edt_descricao.SetFocus;
end;

procedure Tfrm_cadacaoacesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(oAcaoacesso) then
  FreeAndNil(oAcaoAcesso);
end;

procedure Tfrm_cadacaoacesso.FormCreate(Sender: TObject);
begin
  inherited;
  oAcaoacesso:= TAcaoacesso.Create(DTMPrincipal.ConexaoDB);
  IndiceAtual:='DESCRICAO';
end;

function Tfrm_cadacaoacesso.Gravar(
  EstadodoCadastro: TEstadodoCadastro): Boolean;
begin
  if EstadodoCadastro=EcInserir then
  Result:= oAcaoAcesso.Inserir
  else if EstadodoCadastro=ecAlterar then
       Result:= oAcaoacesso.Atualizar;
end;

end.
