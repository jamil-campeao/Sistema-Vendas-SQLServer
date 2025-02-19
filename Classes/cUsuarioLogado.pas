unit cUsuarioLogado;

interface

uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs,
System.SysUtils, DateUtils,
UDtmConexao, ZAbstractConnection, ZConnection, Data.DB,
ZAbstractRODataset, ZAbstractDataset, ZDataset; //lista de units

type
  TUsuarioLogado = class

  private
    F_usuarioId:Integer;
    F_nome:String;
    F_senha: string;

public
class function TenhoAcesso(aUsuarioId: Integer; aChave:String; aConexao:TZConnection):Boolean; static;

published
  property codigo : Integer          read F_usuarioid          write F_usuarioid;
  property nome   :string            read F_nome               write F_nome;
  property senha  :string            read F_senha              write F_senha;
  end;

implementation

class function TUsuarioLogado.TenhoAcesso(aUsuarioId: Integer; aChave: String;
  aConexao: TZConnection): Boolean;
  var Qry:TZQuery;
begin
 try
   Result:=True;
   Qry:=TZQuery.Create(nil);
   Qry.Connection:=aConexao;
   Qry.SQL.Clear;
   Qry.SQL.Add('SELECT USUARIOID '+
              ' FROM USUARIOSACAOACESSO '+
              ' WHERE USUARIOID = :USUARIOID '+
              ' AND ACAOACESSOID = (SELECT TOP 1 ACAOACESSOID FROM ACAOACESSO WHERE CHAVE = :CHAVE) '+
              ' AND ATIVO = 1 ');

   Qry.ParamByName('USUARIOID').AsInteger    :=aUsuarioid;
   Qry.ParamByName('CHAVE').AsString         :=aChave;

   Qry.Open;

    if Qry.IsEmpty then
      Result:=False;

 finally
  if Assigned(Qry) then
  FreeandNil(Qry);

 end;
end;

end.
