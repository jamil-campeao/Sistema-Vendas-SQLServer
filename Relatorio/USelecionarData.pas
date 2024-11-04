unit USelecionarData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit,
  Vcl.Buttons, System.DateUtils;

type
  Tfrm_selecionardata = class(TForm)
    edt_datainicio: TDateEdit;
    edt_datafinal: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_selecionardata: Tfrm_selecionardata;

implementation

{$R *.dfm}

procedure Tfrm_selecionardata.BitBtn1Click(Sender: TObject);
begin
 if (Edt_datafinal.Date) < (edt_datainicio.Date) then
  begin
    MessageDlg('Data inicial n�o pode ser maior que a data final',mtinformation,[mbok],0);
    edt_datafinal.SetFocus;
    abort;
  end;

  if (edt_datafinal.Date=0) Or (edt_datainicio.Date=0) then
    begin
    MessageDlg('Data inicial ou data final s�o campos obrigat�rios',mtinformation,[mbok],0);
    edt_datainicio.SetFocus;
    abort;
    end;

{  if (edt_datainicio.Date > Date ) then
    begin
    MessageDlg('Data inicial n�o pode ser maior que hoje',mtinformation,[mbok],0);
    edt_datainicio.SetFocus;
    abort;
    end;
    }

    Close;

end;

procedure Tfrm_selecionardata.FormShow(Sender: TObject);
begin
  edt_datainicio.Date:= StartOftheMonth(Date);
  edt_datafinal.Date:= EndOfTheMonth(Date);
end;

end.
