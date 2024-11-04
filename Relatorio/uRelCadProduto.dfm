object frm_relcadproduto: Tfrm_relcadproduto
  Left = 20
  Top = 187
  Align = alClient
  Caption = 'Listagem de Produtos'
  ClientHeight = 687
  ClientWidth = 757
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
    DataSource = dts_produto
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
      Width = 229
      Height = 24
      Caption = 'Listagem de Produtos'
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
        Width = 49
        Height = 16
        DataField = 'PRODUTOID'
        DataSource = dts_produto
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 59
        Top = -2
        Width = 227
        Height = 16
        DataField = 'NOME'
        DataSource = dts_produto
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 292
        Top = 0
        Width = 87
        Height = 16
        Alignment = taRightJustify
        DataField = 'QUANTIDADE'
        DataSource = dts_produto
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 385
        Top = -1
        Width = 103
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = dts_produto
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
          Left = 58
          Top = 6
          Width = 228
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 3
          Top = 6
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
        object RLLabel6: TRLLabel
          Left = 294
          Top = 6
          Width = 85
          Height = 16
          Alignment = taRightJustify
          Caption = 'Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 385
          Top = 6
          Width = 103
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor de Venda'
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
  object qry_produto: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT'
      'P.PRODUTOID,'
      'P.NOME,'
      'P.VALOR,'
      'P.QUANTIDADE'
      ''
      'FROM PRODUTOS P'
      'ORDER BY P.PRODUTOID')
    Params = <>
    Left = 536
    Top = 352
    object qry_produtoPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      ReadOnly = True
    end
    object qry_produtoNOME: TWideStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qry_produtoVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = 'R$ #0.00'
    end
    object qry_produtoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
  end
  object dts_produto: TDataSource
    DataSet = qry_produto
    Left = 456
    Top = 312
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 608
    Top = 264
  end
end
