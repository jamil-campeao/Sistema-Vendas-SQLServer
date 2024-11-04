unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UDtmConexao, Enter, UFrmAtualizaDB, cUsuarioLogado,
  Vcl.ComCtrls, ZDbcIntfs, cAtualizacaoBancodeDados, uGraficos, cFuncao;

type
  TfrmPrincipal = class(TForm)
    main_principal: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentao1: TMenuItem;
    Relatorio1: TMenuItem;
    Cliente1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    menu_fechar: TMenuItem;
    Vendas1: TMenuItem;
    Cliente2: TMenuItem;
    N5: TMenuItem;
    Produt1: TMenuItem;
    N6: TMenuItem;
    VendaPorData1: TMenuItem;
    Categoria1: TMenuItem;
    FichadeCliente1: TMenuItem;
    ProdutosPorCategoria1: TMenuItem;
    Usuario1: TMenuItem;
    AlterarSenha1: TMenuItem;
    stb_principal: TStatusBar;
    Administrao1: TMenuItem;
    AoAcesso1: TMenuItem;
    PermissaodeUsurios1: TMenuItem;
    Vendas2: TMenuItem;
    Grficos1: TMenuItem;
    procedure menu_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Cliente1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure FichadeCliente1Click(Sender: TObject);
    procedure ProdutosPorCategoria1Click(Sender: TObject);
    procedure Produt1Click(Sender: TObject);
    procedure VendaPorData1Click(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AlterarSenha1Click(Sender: TObject);
    procedure AoAcesso1Click(Sender: TObject);
    procedure PermissaodeUsurios1Click(Sender: TObject);
    procedure Vendas2Click(Sender: TObject);
    procedure Grficos1Click(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm:Tfrm_atualizadb);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  oUsuarioLogado:TUsuarioLogado;

implementation

{$R *.dfm}

uses UCadCategoria, UCadCliente, UCadProduto, uProVenda, uRelCategoria,
  uRelCadCliente, uRelCadClienteFicha, uRelCadProduto,
  uRelCadProdutoComGrupoCategoria, USelecionarData, uRelVendaPorData,
  UcadUsuario, uLogin, uAlterarSenha, cArquivoIni, uCadAcaoAcesso, cAcaoAcesso, URelVenda, RLReport,
  uUsuarioVsAcoes, Utelaheranca;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
 TFuncao.CriarRelatorio(Tfrm_RelCategoria, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
 TFuncao.CriarForm(TFrm_cliente, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.Cliente2Click(Sender: TObject);
begin
 TFuncao.CriarRelatorio(Tfrm_relcadcliente, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.FichadeCliente1Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(Tfrm_relcadclienteficha, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FreeAndNil(TeclaEnter);
 FreeAndNil(dtmprincipal);

  if Assigned(oUsuarioLogado) then
    FreeAndNil(oUsuarioLogado);

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  if not FileExists(TArquivoIni.ArquivoIni) then
    begin
     TArquivoIni.AtualizarINI('SERVER', 'TIPODATABASE', 'MSSQL');
     TArquivoIni.AtualizarINI('SERVER', 'HOSTNAME', '.\');
     TArquivoIni.AtualizarINI('SERVER', 'PORT', '1433');
     TArquivoIni.AtualizarINI('SERVER', 'USER', 'SA');
     TArquivoIni.AtualizarINI('SERVER', 'PASSWORD', 'Admin100%');
     TArquivoIni.AtualizarINI('SERVER', 'DATABASE', 'VENDAS');

     MessageDlg('Arquivo '+ TArquivoini.ArquivoIni +' Criado com sucesso'+#13+
                'Configure o arquivo antes de inicializar a aplicação',MtInformation,[mbOK],0);

    Application.Terminate;
    end

    else begin

  frm_atualizadb:=Tfrm_atualizadb.Create(self);
  frm_atualizadb.Show;
  frm_atualizadb.Refresh;

    // Definindo a tecla ESC como a tecla de cancelamento para o formulário
    KeyPreview := True;
  {
  DtmPrincipal := TdtmPrincipal.create(self);
  DtmPrincipal.ConexaoDB.SQLHourGlass:=True;
  dtmprincipal.ConexaoDB.Protocol:= 'mssql';
  dtmprincipal.ConexaoDB.LibraryLocation:='C:\ProjetoDelphi\ntwdblib.dll';
  dtmprincipal.ConexaoDB.HostName:= '.\SERVERCURSO';
  dtmprincipal.ConexaoDB.Port:= 1433;
  dtmprincipal.ConexaoDB.user:= 'sa';
  dtmprincipal.ConexaoDB.Password:= 'Admin100%';
  dtmprincipal.ConexaoDB.database:= 'VENDAS';
  dtmPrincipal.ConexaoDB.Connected:=True;
  }

  DtmPrincipal := TdtmPrincipal.create(self);
   with dtmPrincipal.ConexaoDB do
   begin
    Connected:=True;
    SQLHourGlass:=False;
    if TArquivoINI.LerIni('SERVER', 'TIPODATABASE')='MSSQL' then

    Protocol:= 'mssql';
    LibraryLocation:='C:\ProjetoDelphi\ntwdblib.dll';
    HostName:= TArquivoIni.LerIni('.\SERVERCURSO','HostName');
    Port:= StrToInt(TArquivoINI.LerIni('SERVER', 'PORT'));
    user:= TArquivoINI.LerIni('SERVER', 'USER');
    Password:= TArquivoINI.LerIni('SERVER', 'PASSWORD');
    database:= TArquivoINI.LerIni('SERVER', 'DATABASE');
    AutoCommit := True;
    TransactIsolationLevel:=tiReadCommitted;
   end;
   AtualizacaoBancoDados(frm_atualizadb);

   //CRIA AÇÕES DE ACESSO

  TAcaoAcesso.CriarAcoes(Tfrm_cadcategoria, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_cliente, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_produto, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_usuario, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_provenda, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_relcadcliente, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_relcategoria, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_relcadproduto, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_relvenda, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_relvendapordata, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_relcadprodutocomgrupocategoria, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_selecionardata, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_relcadprodutocomgrupocategoria, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_alterarsenha, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_cadacaoacesso, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_usuario_acoes, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_graficos, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.CriarAcoes(Tfrm_relcadclienteficha, dtmPrincipal.ConexaoDB);
  TAcaoAcesso.PreencherUsuarioVsAcoes(DtmPrincipal.ConexaoDB);

   frm_atualizadb.Free;
   TeclaEnter:=TMREnter.Create(Self);
   TeclaEnter.FocusEnabled:=True;
   TeclaEnter.FocusColor:=clinfobk;
  end;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Verifica se a tecla pressionada é a tecla ESC (código 27)
  if Key = VK_ESCAPE then
    Close; // Fecha o formulário
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 try
   oUsuarioLogado:= TUsuarioLogado.Create;
   frm_login:= TFrm_login.Create(self);
   frm_login.ShowModal;


 finally

 end;
 frm_login.Release;
 Stb_principal.Panels[0].Text:='USUÁRIO: '+oUsuarioLogado.nome;
end;

procedure TfrmPrincipal.Grficos1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TFrm_graficos, oUsuarioLogado, dtmPrincipal.ConexaoDB);

end;

procedure TfrmPrincipal.menu_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.N2Click(Sender: TObject);
begin
  TFuncao.CriarForm(TFrm_cadcategoria, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.N3Click(Sender: TObject);
begin
  TFuncao.CriarForm(TFrm_produto, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.PermissaodeUsurios1Click(Sender: TObject);
begin
  TFuncao.CriarForm(Tfrm_usuario_acoes, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.Produt1Click(Sender: TObject);
begin
 TFuncao.CriarRelatorio(Tfrm_relcadproduto, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.ProdutosPorCategoria1Click(Sender: TObject);
begin
 TFuncao.CriarRelatorio(Tfrm_relcadprodutocomgrupocategoria, oUsuarioLogado, dtmPrincipal.ConexaoDB);
  end;

procedure TfrmPrincipal.Usuario1Click(Sender: TObject);
  begin
   TFuncao.CriarForm(TFrm_usuario, oUsuarioLogado, dtmPrincipal.ConexaoDB);
  end;

procedure TfrmPrincipal.VendaPorData1Click(Sender: TObject);
begin

    try
      frm_selecionardata:=Tfrm_selecionardata.Create(self);
        if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, frm_selecionardata.Name ,DtmPrincipal.ConexaoDB) then
        begin
        frm_selecionardata.ShowModal;

        frm_relvendapordata:=Tfrm_relvendapordata.Create(self);
        frm_relvendapordata.qry_venda.Close;
        frm_relvendapordata.qry_venda.ParamByName('DATAINICIO').AsDate:= frm_selecionardata.edt_datainicio.Date;
        frm_relvendapordata.qry_venda.ParamByName('DATAFIM').AsDate:= frm_selecionardata.edt_datafinal.Date;
        frm_relvendapordata.qry_venda.Open;
        frm_relvendapordata.Relatorio.PreviewModal;
        end
          else
            begin
            MessageDlg('Usuário: '+oUsuarioLogado.nome +' Não tem permissão de acesso',mtWarning,[mbOK],0);
            end;

    finally
      if Assigned(frm_selecionardata) then
       frm_selecionardata.Release;

      if Assigned(frm_relvendapordata) then
     frm_relvendapordata.Release;

    end;
end;

procedure TfrmPrincipal.Vendas1Click(Sender: TObject);
begin
 TFuncao.CriarForm(TFrm_provenda, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.Vendas2Click(Sender: TObject);
begin
 TFuncao.CriarRelatorio(Tfrm_relvenda, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.AlterarSenha1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TFrm_alterarsenha, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.AoAcesso1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TFrm_cadacaoacesso, oUsuarioLogado, dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm:Tfrm_atualizadb);
var oAtualizarMSSQL:TAtualizaBancoDadosMSSQL;
begin
aForm.Refresh;

    try
     oAtualizarMSSQL:=TAtualizaBancoDadosMSSQL.Create(DtmPrincipal.ConexaoDB);
     oAtualizarMSSQL.AtualizarBancoDeDados;
    finally
      if Assigned(oAtualizarMSSQL) then
        FreeandNil(oAtualizarMSSQL);
    end;

end;

{
  aForm.chk_Conexao.Checked := true;
  Sleep(100);

  DtmPrincipal.qry_scriptcategoria.ExecSQL;
  aForm.chk_Categoria.Checked := true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.qry_scriptclientes.ExecSQL;
  aForm.chk_cliente.Checked := true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.qry_scriptprodutos.ExecSQL;
  aForm.chk_produto.Checked := true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.qry_scriptitensvendas.ExecSQL;
  aForm.chk_itemvenda.Checked := true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.qry_scriptvendas.ExecSQL;
  aForm.chk_venda.Checked := true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.qry_usuario.ExecSQL;
  aForm.chk_usuario.Checked := true;
  aForm.Refresh;
  Sleep(100);
end;
}



end.
