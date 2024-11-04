unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  Tfrm_alterarsenha = class(TForm)
    Label1: TLabel;
    edt_senhaatual: TEdit;
    Label2: TLabel;
    edt_novasenha: TEdit;
    btn_fechar: TBitBtn;
    btn_alterar: TBitBtn;
    edt_repetirnovasenha: TEdit;
    Label3: TLabel;
    lbl_usuario: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
  private
    procedure LimparEdits;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_alterarsenha: Tfrm_alterarsenha;

implementation
uses cUsuario, uPrincipal, UDtmConexao;

{$R *.dfm}

procedure Tfrm_alterarsenha.btn_alterarClick(Sender: TObject);
var oUsuario:TUsuario;
begin
  if (edt_senhaatual.Text=oUsuarioLogado.senha) then
    begin
      if (edt_novasenha.Text=edt_repetirnovasenha.Text) then
        begin
          try
           oUsuario:=TUsuario.Create(DtmPrincipal.ConexaoDB);
           oUsuario.codigo := oUsuarioLogado.codigo;
           oUsuario.senha  := edt_novasenha.Text;
           oUsuario.AlterarSenha;
           OUsuarioLogado.senha:=edt_novasenha.Text;
           MessageDlg('Senha Alterada',mtInformation,[mbOK],0);
           LimparEdits;
          finally
            FreeandNil(oUsuario);

          end;
        end

        else
        begin
          MessageDlg('Senhas digitadas não coincidem',mtInformation,[mbOK],0);
          edt_novasenha.SetFocus;
        end;

    end
    else
    begin
      MessageDlg('Senha Atual está inválida',mtInformation,[mbOK],0);
    end;

end;

procedure Tfrm_alterarsenha.btn_fecharClick(Sender: TObject);
begin
 Close;
end;

procedure Tfrm_alterarsenha.FormShow(Sender: TObject);
begin
 LimparEdits;
end;

procedure Tfrm_alterarsenha.LimparEdits;
  begin
  edt_senhaatual.Clear;
  edt_novasenha.Clear;
  edt_repetirnovasenha.Clear;
  lbl_usuario.Caption:='Usuário Logado: ' + oUsuariologado.nome;
  end;

end.
