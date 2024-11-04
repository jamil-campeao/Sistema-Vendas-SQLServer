object frm_relcategoria: Tfrm_relcategoria
  Left = 0
  Top = 228
  Caption = 'Listagem de Categorias'
  ClientHeight = 687
  ClientWidth = 1037
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Relatorio: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dts_categoria
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 83
      BandType = btHeader
      object RLDraw1: TRLDraw
        Left = 0
        Top = 72
        Width = 718
        Height = 11
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object RLLabel1: TRLLabel
      Left = 41
      Top = 54
      Width = 245
      Height = 24
      Caption = 'Listagem de Categorias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Rodape: TRLBand
      Left = 38
      Top = 163
      Width = 718
      Height = 40
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 11
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 6
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 656
        Top = 6
        Width = 14
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 679
        Top = 6
        Width = 18
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 672
        Top = 6
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLLabel3: TRLLabel
        Left = 606
        Top = 6
        Width = 44
        Height = 16
        Caption = 'P'#225'gina'
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 147
      Width = 718
      Height = 16
      object RLDBText1: TRLDBText
        Left = 3
        Top = -3
        Width = 91
        Height = 16
        DataField = 'CATEGORIAID'
        DataSource = dts_categoria
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 98
        Top = -3
        Width = 80
        Height = 16
        DataField = 'DESCRICAO'
        DataSource = dts_categoria
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 26
      BandType = btColumnHeader
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 26
        Align = faClient
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel5: TRLLabel
          Left = 98
          Top = 4
          Width = 66
          Height = 16
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 3
          Top = 4
          Width = 49
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object qry_categoria: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT CATEGORIAID, DESCRICAO FROM CATEGORIAS'
      'ORDER BY CATEGORIAID')
    Params = <>
    Left = 520
    Top = 328
    object qry_categoriaCATEGORIAID: TIntegerField
      FieldName = 'CATEGORIAID'
      ReadOnly = True
    end
    object qry_categoriaDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dts_categoria: TDataSource
    DataSet = qry_categoria
    Left = 328
    Top = 336
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 488
    Top = 264
  end
end
