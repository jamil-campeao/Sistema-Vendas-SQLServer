unit UcadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Utelaheranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, uEnum, cUsuario, uDtmConexao;

type
  Tfrm_usuario = class(Tfrm_heranca)
    qry_listagemUSUARIOID: TIntegerField;
    qry_listagemNOME: TWideStringField;
    qry_listagemSENHA: TWideStringField;
    edt_nome: TLabeledEdit;
    edt_usuarioid: TLabeledEdit;
    edt_senha: TLabeledEdit;
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  oUsuario:TUsuario;
  function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; override;
  function Apagar:Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_usuario: Tfrm_usuario;

implementation

{$R *.dfm}

uses cAcaoAcesso, uUsuarioVsAcoes;

{ Tfrm_usuario }

function Tfrm_usuario.Apagar: Boolean;
begin
 if oUsuario.Selecionar(Qry_listagem.FieldByName('USUARIOID').AsInteger) then
  begin
    Result:= oUsuario.Apagar;
  end;
end;

procedure Tfrm_usuario.btn_alterarClick(Sender: TObject);
begin
  if oUsuario.Selecionar(Qry_listagem.FieldByName('USUARIOID').AsInteger) then
    begin
     edt_usuarioid.Text := InttoStr(oUsuario.codigo);
     edt_nome.Text      := oUsuario.nome;
     edt_senha.Text     := oUsuario.senha;
    end

    else
    begin
      btn_cancelar.Click;
      Abort;
    end;

inherited;

end;

procedure Tfrm_usuario.btn_gravarClick(Sender: TObject);
begin
  if oUsuario.UsuarioExiste(edt_nome.Text) then
    begin
      MessageDlg('Usu�rio j� cadastrado',mtinformation, [mbOK], 0);
      edt_nome.SetFocus;
      abort;
    end;


  if edt_usuarioid.Text <> EmptyStr then
    begin
      oUsuario.codigo:= StrToInt(edt_usuarioid.Text);
    end

    else
    begin
      oUsuario.codigo:= 0;
      oUsuario.nome  := edt_nome.Text;
      oUsuario.senha := edt_senha.Text;
    end;

  inherited;

end;

procedure Tfrm_usuario.btn_novoClick(Sender: TObject);
begin
  inherited;
  edt_nome.SetFocus;

end;

procedure Tfrm_usuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oUsuario) then
    FreeandNil(oUsuario);
end;

procedure Tfrm_usuario.FormCreate(Sender: TObject);
begin
  inherited;
  oUsuario := TUsuario.Create(DtmPrincipal.ConexaoDB);
  IndiceAtual:= 'nome';
end;

function Tfrm_usuario.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if EstadodoCadastro=ecInserir then
    Result:= oUsuario.Inserir

  else if EstadoDoCadastro=ecAlterar then
       Result:=oUsuario.Atualizar;

  TAcaoAcesso.PreencherUsuarioVsAcoes(DtmPrincipal.ConexaoDB);

end;

end.
