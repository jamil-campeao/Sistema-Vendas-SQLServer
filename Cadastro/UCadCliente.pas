unit UCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Utelaheranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RxToolEdit, cCadCliente, uEnum;

type
  Tfrm_cliente = class(Tfrm_heranca)
    lbl_cep: TLabel;
    edt_endereco: TLabeledEdit;
    edt_bairro: TLabeledEdit;
    edt_cidade: TLabeledEdit;
    edt_cep: TMaskEdit;
    edt_telefone: TMaskEdit;
    lbl_telefone: TLabel;
    edt_email: TLabeledEdit;
    edt_datanascimento: TDateEdit;
    Label1: TLabel;
    qry_listagemclienteId: TIntegerField;
    qry_listagemnome: TWideStringField;
    qry_listagemendereco: TWideStringField;
    qry_listagemcidade: TWideStringField;
    qry_listagembairro: TWideStringField;
    qry_listagemestado: TWideStringField;
    qry_listagemcep: TWideStringField;
    qry_listagemtelefone: TWideStringField;
    qry_listagememail: TWideStringField;
    edt_clienteid: TLabeledEdit;
    edt_nome: TLabeledEdit;
    edt_estado: TLabeledEdit;
    qry_listagemdatanascimento: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
  private
    { Private declarations }
    oCliente:TCliente;
    function Apagar:Boolean; override;
    function Gravar(EstadodoCadastro:TEstadodoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frm_cliente: Tfrm_cliente;

implementation

{$R *.dfm}

uses UDtmConexao;
{$region 'Override'}

{ Tfrm_cliente }

function Tfrm_cliente.Apagar: Boolean;
begin
 if oCliente.Selecionar(Qry_listagem.FieldByName('clienteId').AsInteger) then
  begin
    Result:=oCliente.Apagar;
  end;
end;

function Tfrm_cliente.Gravar(EstadodoCadastro: TEstadodoCadastro): Boolean;
begin
  if edt_clienteid.Text<>EmptyStr then
  oCliente.codigo:=StrToInt(Edt_clienteid.Text)
  else
  oCliente.codigo:=0;

  oCliente.nome                 :=edt_nome.Text;
  oCliente.cep                  :=edt_cep.Text;
  oCliente.endereco             :=edt_endereco.Text;
  oCliente.bairro               :=edt_bairro.Text;
  oCliente.estado               :=edt_estado.Text;
  oCliente.cidade               :=edt_cidade.Text;
  oCliente.telefone             :=edt_telefone.Text;
  oCliente.email                :=edt_email.Text;
  oCliente.datanascimento       :=edt_datanascimento.Date;

if (EstadodoCadastro=EcInserir) then
  Result:=oCliente.Inserir

  else if (EstadodoCadastro=ecAlterar) then
    Result:=oCliente.Atualizar;
  end;
  {$Endregion}


  procedure Tfrm_cliente.btn_alterarClick(Sender: TObject);
begin
 if oCliente.Selecionar(Qry_listagem.FieldByName('clienteId').AsInteger) then
  begin
    edt_clienteid.Text       :=InttoStr(oCliente.codigo);
    edt_nome.Text            :=oCliente.nome;
    edt_cep.Text             :=oCliente.cep;
    edt_endereco.Text        :=oCliente.endereco;
    edt_bairro.Text          :=oCliente.bairro;
    edt_cidade.Text          :=oCliente.cidade;
    edt_telefone.Text        :=oCliente.telefone;
    edt_email.Text           :=oCliente.email;
    edt_datanascimento.Date  :=oCliente.datanascimento;
    edt_estado.Text          :=oCliente.estado;
end
  else
  begin
  MessageDlg('Erro ao executar select ', TMsgDlgType.mtError, [mbOK], 0);
    btn_cancelar.Click;
    Abort;
  end;

  inherited;

end;

procedure Tfrm_cliente.btn_novoClick(Sender: TObject);
begin
  inherited;
  edt_nome.SetFocus;

end;

procedure Tfrm_cliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
  FreeandNil(oCliente);

end;

procedure Tfrm_cliente.FormCreate(Sender: TObject);
begin
  inherited;
ocliente:=TCliente.Create(Dtmprincipal.ConexaoDB);
IndiceAtual:='nome';
end;




end.
