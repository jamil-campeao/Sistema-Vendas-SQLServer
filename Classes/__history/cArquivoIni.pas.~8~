unit cArquivoIni;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.IniFiles;

  type TArquivoINI = class

  private

  public
  class function ArquivoIni:string; static;
  class function LerIni(aSecao:string; aEntrada:string):string; static;
  class procedure AtualizarINI(aSecao, aEntrada, aValor: string); static;
  end;

implementation

{ TArquivoINI }

class function TArquivoINI.ArquivoIni: string;
begin
 result:= ChangeFileExt(Application.ExeName, '.INI' );
end;

class procedure TArquivoINI.AtualizarINI(aSecao, aEntrada, aValor: string);
var Ini: TIniFile;
begin
   TRY
  INI := TIniFile.Create(Arquivoini);
  Ini.WriteString(aSecao, aEntrada, aValor );

  FINALLY

  Ini.Free;

  END;


end;

class function TArquivoINI.LerIni(aSecao, aEntrada: string): string;
var INI: TIniFile;
begin
  TRY
  INI := TIniFile.Create(Arquivoini);
  Result:= Ini.ReadString(aSecao, aEntrada, 'NAO ENCONTRADO' );
  FINALLY

  Ini.Free;

  END;


end;

end.
