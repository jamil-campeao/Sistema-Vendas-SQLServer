unit uUsuarioVsAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids, UDtmConexao,
  Vcl.StdCtrls, Vcl.Buttons;

type
  Tfrm_usuario_acoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qry_usuario: TZQuery;
    qry_acoes: TZQuery;
    dts_acoes: TDataSource;
    dts_usuario: TDataSource;
    qry_usuarioUSUARIOID: TIntegerField;
    qry_usuarioNOME: TWideStringField;
    grd_usuario: TDBGrid;
    grd_acoes: TDBGrid;
    Splitter1: TSplitter;
    qry_acoesUSUARIOID: TIntegerField;
    qry_acoesACAOACESSOID: TIntegerField;
    qry_acoesDESCRICAO: TWideStringField;
    qry_acoesATIVO: TBooleanField;
    btn_fechar: TBitBtn;
    procedure btn_fecharClick(Sender: TObject);
    procedure qry_usuarioAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure grd_acoesDblClick(Sender: TObject);
    procedure grd_acoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure SelecionarAcoesAcessoPorUsuario;
  public
    { Public declarations }
  end;

var
  frm_usuario_acoes: Tfrm_usuario_acoes;

implementation

{$R *.dfm}

procedure Tfrm_usuario_acoes.btn_fecharClick(Sender: TObject);
begin
 Close;
end;

procedure Tfrm_usuario_acoes.grd_acoesDblClick(Sender: TObject);
var Qry:TZQuery;
  bmRegistroAtual:TBookmark;
begin
  try
    bmRegistroAtual := Qry_acoes.GetBookmark;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=DtmPrincipal.ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE USUARIOSACAOACESSO '+
                ' SET ATIVO = :ATIVO '+
                ' WHERE USUARIOID = :USUARIOID '+
                ' AND ACAOACESSOID = :ACAOACESSOID ');

  Qry.ParamByName('USUARIOID').AsInteger     := Qry_acoes.FieldByName('USUARIOID').AsInteger;
  Qry.ParamByName('ACAOACESSOID').AsInteger  := Qry_acoes.FieldByName('ACAOACESSOID').AsInteger;
  Qry.ParamByName('ATIVO').AsBoolean         := NOT Qry_acoes.FieldByName('ATIVO').AsBoolean;

    try
      DtmPrincipal.ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      DtmPrincipal.ConexaoDB.Commit;
    Except
      DtmPrincipal.ConexaoDB.Rollback;

    end;

  finally
    qry_acoes.Refresh;
    qry_usuario.Refresh;
    SelecionarAcoesAcessoPorUsuario;
    Qry_acoes.GotoBookmark(bmRegistroAtual);
    if Assigned(Qry) then
      FreeAndNil(Qry);

  end;

end;

procedure Tfrm_usuario_acoes.grd_acoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not Qry_acoes.FieldByName('ATIVO').AsBoolean then
    begin
      TDBgrid(Sender).Canvas.Font.Color:= clWhite;
      TDBgrid(Sender).Canvas.Font.Color:= clRed;
    end;
    TDBgrid(Sender).DefaultDrawDataCell(Rect, TDBgrid(Sender).Columns[datacol].Field, State);

end;

procedure Tfrm_usuario_acoes.FormShow(Sender: TObject);
begin
 try
   Qry_usuario.DisableControls;
   Qry_usuario.Open;
   SelecionarAcoesAcessoPorUsuario;
 finally
  Qry_usuario.EnableControls;

 end;
end;

procedure Tfrm_usuario_acoes.qry_usuarioAfterScroll(DataSet: TDataSet);
begin
 SelecionarAcoesAcessoPorUsuario;
end;

procedure Tfrm_usuario_acoes.SelecionarAcoesAcessoPorUsuario;
begin
  Qry_acoes.Close;
  Qry_acoes.ParamByName('USUARIOID').AsInteger := Qry_usuario.FieldByName('USUARIOID').AsInteger;
  Qry_acoes.open;

end;

end.
