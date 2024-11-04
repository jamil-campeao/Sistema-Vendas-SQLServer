program Projeto_sistema;

uses
  Vcl.Forms,
  uEnum in 'heranca\uEnum.pas',
  Utelaheranca in 'heranca\Utelaheranca.pas' {frm_heranca},
  UDtmConexao in 'DataModule\UDtmConexao.pas' {DtmPrincipal: TDataModule},
  UCadCategoria in 'Cadastro\UCadCategoria.pas' {frm_cadcategoria},
  UCadCliente in 'Cadastro\UCadCliente.pas' {frm_cliente},
  cCadCategoria in 'Classes\cCadCategoria.pas',
  cCadCliente in 'Classes\cCadCliente.pas',
  Enter in 'terceiros\Enter.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  UCadProduto in 'Cadastro\UCadProduto.pas' {frm_produto},
  cCadProduto in 'Classes\cCadProduto.pas',
  UFrmAtualizaDB in 'DataModule\UFrmAtualizaDB.pas' {frm_atualizadb},
  UDtmVenda in 'DataModule\UDtmVenda.pas' {dtm_venda: TDataModule},
  uProVenda in 'Processo\uProVenda.pas' {frm_provenda},
  cProVenda in 'Classes\cProVenda.pas',
  cControleEstoque in 'Classes\cControleEstoque.pas',
  uRelCadClienteFicha in 'Relatorio\uRelCadClienteFicha.pas' {frm_relcadclienteficha},
  uRelVenda in 'Relatorio\uRelVenda.pas' {frm_relvenda},
  uRelCadCliente in 'Relatorio\uRelCadCliente.pas' {frm_relcadcliente},
  uRelCategoria in 'Relatorio\uRelCategoria.pas' {frm_relcategoria},
  uRelCadProduto in 'Relatorio\uRelCadProduto.pas' {frm_relcadproduto},
  USelecionarData in 'Relatorio\USelecionarData.pas' {frm_selecionardata},
  uRelCadProdutoComGrupoCategoria in 'Relatorio\uRelCadProdutoComGrupoCategoria.pas' {frm_relcadprodutocomgrupocategoria},
  uRelVendaPorData in 'Relatorio\uRelVendaPorData.pas' {frm_relvendapordata},
  uFuncaoCriptografia in 'heranca\uFuncaoCriptografia.pas',
  UcadUsuario in 'Cadastro\UcadUsuario.pas' {frm_usuario},
  cUsuario in 'Classes\cUsuario.pas',
  uLogin in 'Login\uLogin.pas' {frm_login},
  uAlterarSenha in 'Login\uAlterarSenha.pas' {frm_alterarsenha},
  cUsuarioLogado in 'Classes\cUsuarioLogado.pas',
  cAtualizacaoBancodeDados in 'Classes\cAtualizacaoBancodeDados.pas',
  cAtualizacaoTabelaMSSQL in 'Classes\cAtualizacaoTabelaMSSQL.pas',
  cAtualizacaoCamposMSSQL in 'Classes\cAtualizacaoCamposMSSQL.pas',
  cArquivoIni in 'Classes\cArquivoIni.pas',
  cAcaoAcesso in 'Classes\cAcaoAcesso.pas',
  uCadAcaoAcesso in 'Cadastro\uCadAcaoAcesso.pas' {frm_cadacaoacesso},
  uUsuarioVsAcoes in 'Login\uUsuarioVsAcoes.pas' {frm_usuario_acoes},
  uGraficos in 'Relatorio\uGraficos.pas' {frm_graficos},
  UDTMGrafico in 'DataModule\UDTMGrafico.pas' {dtmgrafico: TDataModule},
  cFuncao in 'Classes\cFuncao.pas',
  uTelaHerancaConsulta in 'heranca\uTelaHerancaConsulta.pas' {frm_herancaconsulta},
  uConCategoria in 'Consulta\uConCategoria.pas' {frm_concategoria},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Emerald Light Slate');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
