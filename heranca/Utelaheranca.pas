unit Utelaheranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset, ZDataset, UDtmConexao, UEnum,
  RxToolEdit, RxCurrEdit, ZAbstractConnection, ZConnection, cUsuarioLogado;

type
  Tfrm_heranca = class(TForm)
    pnl_rodape: TPanel;
    pgc_principal: TPageControl;
    tab_listagem: TTabSheet;
    tab_manutencao: TTabSheet;
    pnl_listagem: TPanel;
    msk_pesquisar: TMaskEdit;
    grd_listagem: TDBGrid;
    btn_pesquisar: TBitBtn;
    btn_novo: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_gravar: TBitBtn;
    btn_fechar: TBitBtn;
    btn_navigator: TDBNavigator;
    btn_apagar: TBitBtn;
    qry_listagem: TZQuery;
    dts_listagem: TDataSource;
    lbl_indice: TLabel;
    btn_atualizar: TBitBtn;
    btn_alterar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_apagarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grd_listagemTitleClick(Column: TColumn);
    procedure msk_pesquisarChange(Sender: TObject);
    procedure btn_atualizarClick(Sender: TObject);
    procedure grd_listagemDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_pesquisarClick(Sender: TObject);
  private
  SelectOriginal:String;
    { Private declarations }

procedure ControlarBotoes(btn_novo, btn_alterar, btn_gravar, btn_cancelar, btn_apagar:TBitBtn;
          Navegador:TDBNavigator; pgc_principal: TPageControl; Flag:Boolean);
    procedure ControlarIndiceTab(pgc_principal: TPageControl; indice: Integer);
    function RetornarCampoTraduzido(Campo: String): string;
    procedure ExibirLabelIndice(Campo: String; aLabel: Tlabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdits;
  public
    { Public declarations }
    EstadoDoCadastro:TEstadoDoCadastro;
    IndiceAtual:String;
    function Apagar:Boolean; virtual;
    function Gravar(EstadoDoCadastro:TEstadodoCadastro):Boolean; virtual;
    procedure BloqueiaCtrl_Del_DbGrid(var Key: Word; Shift: TShiftState);

  end;

var
  frm_heranca: Tfrm_heranca;

implementation
{$region 'OBSERVACOES'}
//TAG: 1 - CHAVE PRIMARIA - PK
//TAG: 2 - CAMPOS OBRIGATORIOS
{$endregion}

{$R *.dfm}
{$region 'FUNÇÕES E PROCEDURES'}

uses uPrincipal;


//procedimento de controle de tela

procedure Tfrm_heranca.ControlarBotoes(btn_novo, btn_alterar, btn_gravar, btn_cancelar, btn_apagar:TBitBtn;
Navegador:TDBNavigator; pgc_principal: TPageControl; Flag:Boolean);
  begin
     btn_novo.Enabled:= Flag;
     btn_apagar.Enabled:= Flag;
     btn_alterar.Enabled:= Flag;
     Navegador.Enabled:= Flag;
     pgc_principal.Pages[0].TabVisible:= Flag;
     btn_cancelar.Enabled:= not(Flag);
     btn_gravar.Enabled:= not(Flag);
  end;

  procedure Tfrm_heranca.ControlarIndiceTab(pgc_principal: TPageControl; indice: Integer);
    begin
    if (pgc_principal.Pages[indice].TabVisible) then

    pgc_principal.TabIndex:=indice;

    end;


function Tfrm_heranca.RetornarCampoTraduzido(Campo:String):string;
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

procedure Tfrm_heranca.ExibirLabelIndice(Campo:String; aLabel:Tlabel);
  begin
   aLabel.Caption:=RetornarCampoTraduzido(Campo);
  end;

  function Tfrm_heranca.ExisteCampoObrigatorio:Boolean;
  var i: Integer;
    begin
      Result:=False;
      for i := 0 to ComponentCount -1 do
        begin
         if (Components[i] is TLabeledEdit) then
         begin
           if (TLabeledEdit (Components[i]).Tag = 2) and
           (TLabeledEdit (Components[i]).Text=EmptyStr) then
            begin
              MessageDlg(TLabeledEdit (Components[i]).EditLabel.Caption +
               ' é um campo obrigatório', mtInformation, [mbOk],0);
              Result:=True;
              TLabeledEdit(Components[i]).SetFocus;
              break;
            end;

         end;
        end;

    end;

procedure Tfrm_heranca.DesabilitarEditPK;
  var i: Integer;
    begin
      for i := 0 to ComponentCount -1 do
        begin
         if (Components[i] is TLabeledEdit) then
         begin
           if (TLabeledEdit (Components[i]).Tag = 1) then
           begin
           (TLabeledEdit (Components[i])).Enabled:=False;
           break;

           end;

         end;
        end;
    end;


    procedure Tfrm_heranca.LimparEdits;
  var i: Integer;
    begin
      for i := 0 to ComponentCount -1 do
        begin
         if (Components[i] is TLabeledEdit) then
         begin
           (TLabeledEdit (Components[i])).Text:=''

           end
           else if (Components[i] is TEdit) then
            TEdit (Components[i]).Text:=''

           else if (Components[i] is TMaskEdit) then
            TMaskEdit (Components[i]).Text:=''

            else if (Components[i] is TDateEdit) then
            TDateEdit (Components[i]).Text:=''

            else if (Components[i] is TMemo) then
            TMemo (Components[i]).Text:=''

            else if (Components[i] is TDBLookupComboBox) then
            TDBLookupComboBox (Components[i]).KeyValue:=Null

            else if (Components[i] is TCurrencyEdit) then
            TCurrencyEdit (Components[i]).Value:=0;

         end;
    end;

  {$endregion}


  {$region 'MÉTODOS VIRTUAIS'}

  function Tfrm_heranca.Apagar: Boolean;
begin
    ShowMessage('Deletado');
    Result:=True;
end;

function Tfrm_heranca.Gravar(EstadoDoCadastro: TEstadodoCadastro): Boolean;
begin
  if (EstadodoCadastro=ecInserir) then
        showMessage('Inserir')
  else if (EstadoDoCadastro=ecAlterar) then
         showMessage('Alterado');

  Result:=True;
end;

  {$endregion}

procedure Tfrm_heranca.btn_novoClick(Sender: TObject);
begin
   if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, DtmPrincipal.ConexaoDB) then
    begin
      MessageDlg('Usuário: '+oUsuarioLogado.nome +', não tem permissão de acesso',mtWarning,[mbOK],0);
      Abort;
    end;

   ControlarBotoes(btn_novo, btn_alterar, btn_gravar, btn_cancelar, btn_apagar, btn_navigator, pgc_principal, false);
   EstadodoCadastro:=ecinserir;
   LimparEdits;
end;

procedure Tfrm_heranca.btn_pesquisarClick(Sender: TObject);
var I : Integer;
    TipoCampo: TFieldType;
    NomeCampo: String;
    WhereOrAnd:String;
    CondicaoSQL:String;
begin
if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, DtmPrincipal.ConexaoDB) then
    begin
      MessageDlg('Usuário: '+oUsuarioLogado.nome +', não tem permissão de acesso',mtWarning,[mbOK],0);
      Abort;
    end;

    if msk_pesquisar.Text='' then
    begin
      Qry_listagem.Close;
      Qry_Listagem.SQL.Clear;
      Qry_listagem.SQl.Add(SelectOriginal);
      Qry_listagem.Open;
      Abort;
    end;

    for I := 0 to Qry_Listagem.FieldCount-1 do
      begin
        if Qry_Listagem.Fields[i].FieldName=IndiceAtual then
          begin
            TipoCampo := Qry_Listagem.Fields[i].DataType;
            if Qry_listagem.Fields[i].Origin<>'' then
              begin
                if Pos('.', Qry_listagem.Fields[i].Origin) > 0 then
                  begin
                    NomeCampo := Qry_listagem.Fields[i].Origin;
                  end
                  else
                  begin
                    NomeCampo := Qry_listagem.Fields[i].Origin+'.'+Qry_Listagem.Fields[i].FieldName;
                  end;
              end
                else
                  begin
                    NomeCampo := Qry_listagem.Fields[i].FieldName;
                    break;
                  end;
          end;
      end;


      if Pos('WHERE',LowerCase(SelectOriginal)) > 1 then
        begin
          WhereorAnd := ' AND ';
        end
          else
            begin
              WhereorAnd := ' WHERE ';
            end;

    if (TipoCampo=ftString) or (TipoCampo=ftWideString) then
      begin
        CondicaoSQL := WhereorAnd+' '+ NomeCampo + ' LIKE ' + QuotedStr('%'+msk_pesquisar.Text+'%');
      end
      else if (TipoCampo = ftInteger) or (TipoCampo = ftSmallint) then
        begin
         CondicaoSQL := WhereorAnd+' '+ NomeCampo + '='+msk_pesquisar.Text;
        end

      else if (TipoCampo = ftDate) or (TipoCampo = ftDateTime) then
        begin
          CondicaoSQL := WhereOrAnd+' '+ NomeCampo + '=' + QuotedStr(msk_pesquisar.Text);
        end

      else if (TipoCampo = ftFloat) or (TipoCampo=ftCurrency) then
        begin
          CondicaoSQL := WhereOrAnd+' '+ NomeCampo + '=' +StringReplace(msk_pesquisar.Text,',','.',[rfReplaceAll]);
        end;

      Qry_Listagem.Close;
      Qry_Listagem.SQL.Clear;
      Qry_Listagem.SQL.Add(SelectOriginal);
      Qry_Listagem.SQL.Add(CondicaoSQL);
      Qry_Listagem.Open;

      msk_pesquisar.Text:='';
      msk_pesquisar.SetFocus;


end;

procedure Tfrm_heranca.btn_alterarClick(Sender: TObject);
begin
if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, DtmPrincipal.ConexaoDB) then
    begin
      MessageDlg('Usuário: '+oUsuarioLogado.nome +', não tem permissão de acesso',mtWarning,[mbOK],0);
      Abort;
    end;

   ControlarBotoes(btn_novo, btn_alterar, btn_gravar, btn_cancelar, btn_apagar, btn_navigator, pgc_principal, false);
    EstadodoCadastro:=ecalterar;
end;


procedure Tfrm_heranca.btn_apagarClick(Sender: TObject);
begin
     if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, DtmPrincipal.ConexaoDB) then
    begin
      MessageDlg('Usuário: '+oUsuarioLogado.nome +', não tem permissão de acesso',mtWarning,[mbOK],0);
      Abort;
    end;
  try
  if (Apagar) then
  begin
    ControlarBotoes(btn_novo, btn_alterar, btn_gravar, btn_cancelar, btn_apagar, btn_navigator,
    pgc_principal, true);
      ControlarIndiceTab(pgc_principal, 0);
      LimparEdits;
      Qry_listagem.Refresh;

  end

else
    begin
    MessageDlg('Erro na Exclusao', TMsgDlgType.mtError, [mbok], 0);
    end;
finally
EstadodoCadastro:=ecnenhum;
end;
  end;

procedure Tfrm_heranca.btn_atualizarClick(Sender: TObject);
begin
 Qry_listagem.Refresh;
end;

procedure Tfrm_heranca.btn_cancelarClick(Sender: TObject);
begin

   ControlarBotoes(btn_novo, btn_alterar, btn_gravar, btn_cancelar, btn_apagar, btn_navigator, pgc_principal, true);

   ControlarIndiceTab(pgc_principal, 0);
   LimparEdits;
end;


procedure Tfrm_heranca.btn_fecharClick(Sender: TObject);
begin
 Close;
end;

procedure Tfrm_heranca.btn_gravarClick(Sender: TObject);
begin
    if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, DtmPrincipal.ConexaoDB) then
    begin
      MessageDlg('Usuário: '+oUsuarioLogado.nome +', não tem permissão de acesso',mtWarning,[mbOK],0);
      Abort;
    end;

  if (ExisteCampoObrigatorio) then
    abort;
    Try
      if Gravar(EstadoDoCadastro) then
        begin
          ControlarBotoes(btn_novo, btn_alterar, btn_gravar, btn_cancelar, btn_apagar, btn_navigator, pgc_principal, true);
          ControlarIndiceTab(pgc_principal, 0);
           EstadodoCadastro:=ecnenhum;
           LimparEdits;
           qry_listagem.Refresh;
        end
        else
          begin
            MessageDlg('Erro na Gravaçao', TMsgDlgType.mtError, [mbok], 0);
          end;
    Finally
    End;

end;


procedure Tfrm_heranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if assigned(Qry_listagem) then
  FreeandNil(Qry_listagem);
end;

procedure Tfrm_heranca.FormCreate(Sender: TObject);
begin
  // Definindo a tecla ESC como a tecla de cancelamento para o formulário
  KeyPreview := True;
Qry_listagem.Connection:=dtmprincipal.ConexaoDB;
dts_listagem.DataSet:=Qry_listagem;
grd_listagem.DataSource:=dts_listagem;
grd_listagem.Options:=[dgTitles,dgIndicator,dgColumnResize,dgColLines,
dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgCancelOnExit,dgTitleClick,dgTitleHotTrack];

btn_gravar.Enabled:=False;
end;

procedure Tfrm_heranca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 BloqueiaCtrl_DEL_DbGrid(Key,Shift);
 if Key = VK_ESCAPE then
  begin
    Exit;
  end;
end;

procedure Tfrm_heranca.FormShow(Sender: TObject);
begin
  if (Qry_listagem.SQL.Text <>EmptyStr) then
    begin
      Qry_listagem.IndexFieldNames:=IndiceAtual;
      ExibirLabelIndice(IndiceAtual, lbl_indice);
      SelectOriginal:=Qry_listagem.SQL.Text;
      Qry_listagem.Open;
    end;
    DesabilitarEditPK;
     ControlarBotoes(btn_novo, btn_alterar, btn_gravar, btn_cancelar, btn_apagar, btn_navigator, pgc_principal, true);
     ControlarIndiceTab(pgc_principal, 0);


    
end;


procedure Tfrm_heranca.grd_listagemDblClick(Sender: TObject);
begin
  btn_alterar.Click;
end;

procedure Tfrm_heranca.grd_listagemTitleClick(Column: TColumn);
begin
  IndiceAtual:= Column.FieldName;
  Qry_listagem.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lbl_indice);
end;

procedure Tfrm_heranca.msk_pesquisarChange(Sender: TObject);
begin
  Qry_listagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
  // outra forma de implementacao: Qry_listagem.Locate(IndiceAtual, msk_pesquisar.Text, [loPartialKey]);
end;

procedure Tfrm_Heranca.BloqueiaCtrl_Del_DbGrid(var Key: Word; Shift: TShiftState);
  begin
    if (Shift = [ssCtrl]) and (Key = 46) then
    Key:= 0;
  end;

end.
