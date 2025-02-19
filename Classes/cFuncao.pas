unit cFuncao;

interface
uses System.Classes,
Vcl.Controls,
Vcl.ExtCtrls,
Vcl.Dialogs, Vcl.Forms, Vcl.Buttons, cAcaoacesso, cUsuarioLogado, RLReport,
System.SysUtils, DateUtils,
UDtmConexao, ZAbstractConnection, ZConnection, Data.DB,
ZAbstractRODataset, ZAbstractDataset, ZDataset,
Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, vcl.Graphics, vcl.ExtDlgs; //lista de units

type
  TFuncao = class
    private


    public
      class procedure CriarForm(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao:TZConnection); static;
      class procedure CriarRelatorio(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao:TZConnection); static;
      class procedure CarregarImagem(aImagem:TImage); static;
      class procedure LimparImagem(var aImage:TImage); static;
  end;

implementation

{ TFuncao }

class procedure TFuncao.CarregarImagem(aImagem: TImage);
var
  Bmp, BmpTrans:TBitmap;
  Jpg: TJPEGImage;
  Pic: TPicture;
  Png: TPngImage;
  opdSelecionar:TOpenPictureDialog;
  iWidth:Integer;
  iHeight:Integer;
begin
  try
    iWidth:= 160;
    iHeight:=130;
    opdSelecionar:=TOpenPictureDialog.Create(nil);
    opdSelecionar.Filter:='All (*.bmp;*.jpg; *.jpeg;*.png)|*.jpg; *.jpeg; *.bpm; *.png|Bitmaps '+
                          '(*.bmp)|*.bmp|JPEG Image File (*.jpg;*.jpeg)|*.jpg; *.jpeg| '+
                          'PNG(*.png)|*.png';
    opdSelecionar.Title:='Selecione a Imagem';
    opdSelecionar.Execute;

    if opdSelecionar.FileName<>EmptyStr then
      begin
        if (Pos('.JPG',UpperCase(opdSelecionar.FileName))>0) or ( Pos('.JPEG',UpperCase(opdSelecionar.FileName))>0) then
          begin
            Bmp := TBitmap.Create;
            Jpg := TJPEGImage.Create;
            Pic := TPicture.Create;
            try
              Pic.LoadFromFile(opdSelecionar.FileName);
              Jpg.Assign(Pic);
              Jpg.CompressionQuality:=7;
              Bmp.Width := iWidth;
              Bmp.Height:= iHeight;
              Bmp.Canvas.StretchDraw(Rect(0,0, Bmp.Width, Bmp.Height), Jpg);
              aImagem.Picture.Bitmap:=Bmp;
            finally
            Pic.Free;
            Jpg.Free;
            Bmp.Free;
            end
          end
            else if Pos('.PNG', UpperCase(opdSelecionar.FileName))>0 then
                begin
                Bmp := TBitmap.Create;
                Jpg := TJPEGImage.Create;
                Pic := TPicture.Create;
                  try
                    Pic.LoadFromFile(opdSelecionar.FileName);
                    png.Assign(Pic);
                    Bmp.Width := iWidth;
                    Bmp.Height:= iHeight;
                    Bmp.Canvas.StretchDraw(Rect(0,0, Bmp.Width, Bmp.Height), png);
                    aImagem.Picture.Bitmap:=Bmp;
                  finally
                  Pic.Free;
                  Png.Free;
                  Bmp.Free;
                  end
                end

                else
                    begin
                    Bmp := TBitmap.Create;
                    BmpTrans := TBitMap.Create;
                    Pic := TPicture.Create;
                      try
                        Pic.LoadFromFile(opdSelecionar.FileName);
                        BmpTrans.Assign(Pic.Bitmap);
                        Bmp.Width := iWidth;
                        Bmp.Height:= iHeight;
                        Bmp.Canvas.StretchDraw(Rect(0,0, Bmp.Width, Bmp.Height), BmpTrans);
                        aImagem.Picture.Bitmap:=Bmp;
                      finally
                      Pic.Free;
                      BmpTrans.Free;
                      Bmp.Free;
                      end
                 end;
      end;
  finally
     FreeAndNil(opdSelecionar);

  end;

end;

class procedure TFuncao.LimparImagem(var aImage: TImage);
begin
  aImage.Picture.Assign(nil);
end;

class procedure TFuncao.CriarForm(aNomeForm: TFormClass;
  oUsuarioLogado: TUsuarioLogado; aConexao: TZConnection);
  var form:TForm;
begin
   try
     form := aNomeForm.Create(Application);
     if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, form.Name, aConexao) then
      begin
        form.ShowModal;
      end
        else
          begin
            MessageDlg('Usu�rio: '+oUsuarioLogado.nome + ' N�o tem permiss�o de acesso', mtWarning,[mbOK],0);
          end;

   finally
    if Assigned(form) then
      form.Release;
   end;
end;

class procedure TFuncao.CriarRelatorio(aNomeForm: TFormClass;
  oUsuarioLogado: TUsuarioLogado; aConexao: TZConnection);
  var form: TForm;
  aRelatorio:TRLReport;
  i:Integer;
begin
  try
    form := aNomeForm.Create(Application);
    if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, form.Name, aConexao) then
      begin
        for I := 0 to form.ComponentCount-1 do
          begin
            if form.Components[i] is TRLReport then
              begin
                TRLReport(form.Components[i]).PreviewModal;
              end;
          end;

      end
        else
          begin
            MessageDlg('Usu�rio: '+oUsuarioLogado.nome+', n�o tem permiss�o de acesso',mtWarning,[mbOK],0);
          end;
  finally
    if Assigned(form) then
      form.Release;

  end;

end;



end.
