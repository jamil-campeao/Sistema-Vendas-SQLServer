object frm_relcadprodutocomgrupocategoria: Tfrm_relcadprodutocomgrupocategoria
  Left = 20
  Top = 187
  Align = alClient
  Caption = 'Listagem de Produtos Agrupados Por Categoria'
  ClientHeight = 687
  ClientWidth = 784
  Color = clBtnFace
  Enabled = False
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
    Left = 8
    Top = 24
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
      Width = 491
      Height = 24
      Caption = 'Listagem de Produtos Agrupados Por Categoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Rodape: TRLBand
      Left = 38
      Top = 275
      Width = 718
      Height = 48
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 21
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 656
        Top = 21
        Width = 14
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 679
        Top = 21
        Width = 18
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 672
        Top = 21
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLLabel3: TRLLabel
        Left = 606
        Top = 21
        Width = 44
        Height = 16
        Caption = 'P'#225'gina'
      end
    end
    object banda_grupo: TRLGroup
      Left = 38
      Top = 121
      Width = 718
      Height = 154
      DataFields = 'CATEGORIAID'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLDBText5: TRLDBText
          Left = 105
          Top = 1
          Width = 155
          Height = 16
          DataField = 'DESCRICAOCATEGORIA'
          DataSource = dts_produto
          Text = ''
        end
        object RLLabel8: TRLLabel
          Left = 2
          Top = 1
          Width = 70
          Height = 16
          Caption = 'Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 72
          Top = 1
          Width = 27
          Height = 16
          Alignment = taCenter
          DataField = 'CATEGORIAID'
          DataSource = dts_produto
          Text = ''
        end
        object RLLabel9: TRLLabel
          Left = 94
          Top = 1
          Width = 10
          Height = 16
          Alignment = taCenter
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 17
        Width = 718
        Height = 25
        BandType = btColumnHeader
        object RLPanel1: TRLPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 25
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
      object RLBand1: TRLBand
        Left = 0
        Top = 42
        Width = 718
        Height = 24
        object RLDBText1: TRLDBText
          Left = 3
          Top = -2
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
      object RLBand4: TRLBand
        Left = 0
        Top = 66
        Width = 718
        Height = 79
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 624
          Top = 17
          Width = 91
          Height = 16
          DataField = 'QUANTIDADE'
          DataSource = dts_produto
          Info = riSum
          Text = ''
        end
        object RLDraw3: TRLDraw
          Left = 385
          Top = 6
          Width = 320
          Height = 11
          DrawKind = dkLine
        end
        object RLLabel10: TRLLabel
          Left = 390
          Top = 17
          Width = 228
          Height = 16
          Alignment = taRightJustify
          Caption = 'Quantidade Estoque Por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel11: TRLLabel
          Left = 386
          Top = 39
          Width = 232
          Height = 16
          Alignment = taRightJustify
          Caption = 'Quantidade de Valor Por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult2: TRLDBResult
          Left = 624
          Top = 39
          Width = 107
          Height = 16
          DataField = 'VALOR'
          DataSource = dts_produto
          DisplayMask = '#.00'
          Info = riSum
          Text = 'R$ #'
        end
        object RLLabel12: TRLLabel
          Left = 421
          Top = 61
          Width = 197
          Height = 16
          Alignment = taRightJustify
          Caption = 'M'#233'dia de Valor Por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult3: TRLDBResult
          Left = 624
          Top = 61
          Width = 91
          Height = 16
          DataField = 'VALOR'
          DataSource = dts_produto
          DisplayMask = '#.00'
          Info = riAverage
          Text = 'R$ #'
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
      'P.QUANTIDADE,'
      'P.CATEGORIAID,'
      'C.DESCRICAO AS DESCRICAOCATEGORIA'
      ''
      'FROM PRODUTOS P'
      'LEFT JOIN CATEGORIAS C ON C.CATEGORIAID = P.CATEGORIAID'
      'ORDER BY P.PRODUTOID, C.CATEGORIAID')
    Params = <>
    Left = 576
    Top = 464
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
    end
    object qry_produtoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object qry_produtoCATEGORIAID: TIntegerField
      FieldName = 'CATEGORIAID'
    end
    object qry_produtoDESCRICAOCATEGORIA: TWideStringField
      FieldName = 'DESCRICAOCATEGORIA'
      Size = 30
    end
  end
  object dts_produto: TDataSource
    DataSet = qry_produto
    Left = 480
    Top = 464
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 536
    Top = 528
  end
end
