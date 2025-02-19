unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Threading;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

// Fun��o que ser� executada pela primeira thread
procedure contar_pessoa1;
var
  i: Integer;
begin
  for i := 1 to 5 do
  begin
    Form1.Memo1.Lines.Add('Pessoa 1: ' + IntToStr(i));
    Sleep(500); // Espera 500 milissegundos
  end;
end;

// Fun��o que ser� executada pela segunda thread
procedure contar_pessoa2;
var
  i: Integer;
begin
  for i := 1 to 5 do
  begin
    Form1.Memo1.Lines.Add('Pessoa 2: ' + IntToStr(i));
    Sleep(700); // Espera 700 milissegundos
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // Cria��o das threads
  TThread.CreateAnonymousThread(contar_pessoa1).Start;
  TThread.CreateAnonymousThread(contar_pessoa2).Start;
end;

end.

