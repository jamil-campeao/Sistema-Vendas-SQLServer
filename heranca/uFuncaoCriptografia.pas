unit uFuncaoCriptografia;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

  {$region 'DECLARACAO DAS FUNÇÕES'}
function Criptografar(const aEntrada:string) : string;
function Descriptografar(const aEntrada:string) : string;
  {$ENDREGION}

implementation

{$region 'CRIPTOGRAFAR'}

function Criptografar(const aEntrada:string) : string;
Var i, iQtdeEnt, iIntervalo:Integer;
sSaida:String;
sProximoCaracter : String;

  begin
    iIntervalo:= 6;
    i         := 0;
    iQtdeEnt  := 0;

    if (aEntrada <> EmptyStr) then
      begin
        iQtdeEnt := Length(aEntrada);

        for i := iQtdeEnt downto 1 do
          begin
            sProximoCaracter := Copy(aEntrada, i, 1);
            sSaida := sSaida + (char(ord(sProximoCaracter[1]) + iIntervalo));
          end;
      end;

      Result:= sSaida;
  end;

  {$ENDREGION}

  {$region 'CRIPTOGRAFAR'}

function Descriptografar(const aEntrada:string) : string;
var i, iQtdeEnt, iIntervalo:Integer;
sSaida:String;
sProximoCaracter:String;

  begin
    iIntervalo:= 6;
    i         := 0;
    iQtdeEnt  := 0;

    if (aEntrada <> EmptyStr) then
      begin
        iQtdeEnt := Length(aEntrada);

        for i := iQtdeEnt downto 1 do
          begin
            sProximoCaracter := Copy(aEntrada, i, 1);
            sSaida := sSaida + (char(ord(sProximoCaracter[1]) - iIntervalo));
          end;
      end;

      Result:= sSaida;
  end;

    {$ENDREGION}


end.
