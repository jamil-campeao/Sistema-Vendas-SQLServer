object frm_relvendapordata: Tfrm_relvendapordata
  Left = 20
  Top = 187
  Align = alClient
  Caption = 'Listagem de Vendas por Data'
  ClientHeight = 687
  ClientWidth = 781
  Color = clBtnFace
  Enabled = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnDestroy = FormDestroy
  TextHeight = 15
  object Relatorio: TRLReport
    Left = 32
    Top = 32
    Width = 794
    Height = 1123
    DataSource = dts_venda
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
      Width = 303
      Height = 24
      Caption = 'Listagem de Vendas por Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Rodape: TRLBand
      Left = 38
      Top = 282
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
      Height = 120
      DataFields = 'DATAVENDA'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLLabel8: TRLLabel
          Left = 2
          Top = 1
          Width = 37
          Height = 16
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 44
          Top = 1
          Width = 84
          Height = 16
          DataField = 'DATAVENDA'
          DataSource = dts_venda
          Text = ''
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
          object RLLabel7: TRLLabel
            Left = 292
            Top = 6
            Width = 119
            Height = 16
            Alignment = taRightJustify
            Caption = 'Valor Total Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel5: TRLLabel
            Left = 58
            Top = 6
            Width = 90
            Height = 16
            Caption = 'Nome Cliente'
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
          Top = 2
          Width = 69
          Height = 16
          DataField = 'CLIENTEID'
          DataSource = dts_venda
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 59
          Top = 2
          Width = 227
          Height = 16
          DataField = 'NOME'
          DataSource = dts_venda
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 292
          Top = 2
          Width = 119
          Height = 16
          Alignment = taRightJustify
          DataField = 'TOTALVENDA'
          DataSource = dts_venda
          DisplayMask = '#0.00'
          Text = 'R$ '
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 66
        Width = 718
        Height = 47
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 648
          Top = 23
          Width = 63
          Height = 16
          Alignment = taRightJustify
          DataField = 'TOTALVENDA'
          DataSource = dts_venda
          DisplayMask = '#0.00'
          Info = riSum
          Text = 'R$ '
        end
        object RLDraw3: TRLDraw
          Left = 395
          Top = 6
          Width = 320
          Height = 11
          DrawKind = dkLine
        end
        object RLLabel10: TRLLabel
          Left = 446
          Top = 23
          Width = 196
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor Total de Venda na Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 241
      Width = 718
      Height = 41
      BandType = btSummary
      object RLDBResult2: TRLDBResult
        Left = 636
        Top = 19
        Width = 75
        Height = 16
        Alignment = taRightJustify
        DataField = 'TOTALVENDA'
        DataSource = dts_venda
        DisplayMask = '#0.00'
        Info = riSum
        Text = 'R$ '
      end
      object RLDraw4: TRLDraw
        Left = 395
        Top = 6
        Width = 320
        Height = 11
        DrawKind = dkLine
      end
      object RLLabel6: TRLLabel
        Left = 551
        Top = 19
        Width = 79
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object qry_venda: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      'SELECT'
      'V.VENDAID,'
      'V.CLIENTEID,'
      'C.NOME,'
      'V.DATAVENDA,'
      'V.TOTALVENDA'
      'FROM VENDAS V'
      'INNER JOIN CLIENTES C ON C.CLIENTEID = V.CLIENTEID'
      'WHERE V.DATAVENDA BETWEEN :DATAINICIO AND :DATAFIM'
      'ORDER BY V.DATAVENDA, V.CLIENTEID')
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptInput
        Value = '01/05/2024'
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptInput
        Value = '30/05/2024'
      end>
    Left = 576
    Top = 464
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAINICIO'
        ParamType = ptInput
        Value = '01/05/2024'
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptInput
        Value = '30/05/2024'
      end>
    object qry_vendaVENDAID: TIntegerField
      FieldName = 'VENDAID'
      ReadOnly = True
    end
    object qry_vendaCLIENTEID: TIntegerField
      FieldName = 'CLIENTEID'
      Required = True
    end
    object qry_vendaNOME: TWideStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qry_vendaDATAVENDA: TDateTimeField
      FieldName = 'DATAVENDA'
    end
    object qry_vendaTOTALVENDA: TFloatField
      FieldName = 'TOTALVENDA'
    end
  end
  object dts_venda: TDataSource
    DataSet = qry_venda
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
