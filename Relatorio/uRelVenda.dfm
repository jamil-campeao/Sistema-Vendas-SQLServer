object frm_relvenda: Tfrm_relvenda
  Left = 20
  Top = 187
  Align = alClient
  Caption = 'Listagem de Vendas'
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
    Left = 48
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
      Width = 211
      Height = 24
      Caption = 'Listagem de Vendas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Rodape: TRLBand
      Left = 38
      Top = 296
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
      Height = 134
      DataFields = 'VENDAID'
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
          Width = 49
          Height = 16
          Caption = 'Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 57
          Top = 1
          Width = 24
          Height = 16
          DataField = 'VENDAID'
          DataSource = dts_venda
          Text = ''
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 17
        Width = 718
        Height = 24
        object RLDBText1: TRLDBText
          Left = 60
          Top = 5
          Width = 21
          Height = 16
          DataField = 'CLIENTEID'
          DataSource = dts_venda
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 86
          Top = 5
          Width = 198
          Height = 16
          DataField = 'NOME'
          DataSource = dts_venda
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 563
          Top = -19
          Width = 35
          Height = 16
          Alignment = taRightJustify
          DataField = 'TOTALVENDA'
          DataSource = dts_venda
          Text = 'R$ '
        end
        object RLLabel9: TRLLabel
          Left = 3
          Top = 5
          Width = 53
          Height = 16
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 287
          Top = 5
          Width = 82
          Height = 16
          Alignment = taRightJustify
          Caption = 'Data Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 77
          Top = 5
          Width = 7
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
        object RLDBText3: TRLDBText
          Left = 370
          Top = 5
          Width = 58
          Height = 16
          DataField = 'DATAVENDA'
          DataSource = dts_venda
          Text = ''
        end
      end
      object RLSubDetail1: TRLSubDetail
        Left = 0
        Top = 41
        Width = 718
        Height = 72
        DataSource = dts_vendaitens
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 25
          BandType = btHeader
          Color = clInfoBk
          ParentColor = False
          Transparent = False
          object RLLabel10: TRLLabel
            Left = 1
            Top = 5
            Width = 123
            Height = 16
            Caption = 'Produtos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel11: TRLLabel
            Left = 175
            Top = 5
            Width = 93
            Height = 16
            Alignment = taRightJustify
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel12: TRLLabel
            Left = 305
            Top = 5
            Width = 92
            Height = 16
            Alignment = taRightJustify
            Caption = 'Valor Unit'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel13: TRLLabel
            Left = 418
            Top = 6
            Width = 74
            Height = 16
            Alignment = taJustify
            Caption = 'Valor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 25
          Width = 718
          Height = 22
          object RLDBText5: TRLDBText
            Left = 1
            Top = 0
            Width = 79
            Height = 16
            DataField = 'PRODUTOID'
            DataSource = dts_vendaitens
            Text = ''
          end
          object RLLabel7: TRLLabel
            Left = 19
            Top = 0
            Width = 7
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
          object RLDBText7: TRLDBText
            Left = 27
            Top = 0
            Width = 142
            Height = 16
            DataField = 'NOME'
            DataSource = dts_vendaitens
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 181
            Top = 3
            Width = 87
            Height = 16
            Alignment = taRightJustify
            DataField = 'QUANTIDADE'
            DataSource = dts_vendaitens
            Text = ''
          end
          object RLDBText9: TRLDBText
            Left = 305
            Top = 3
            Width = 92
            Height = 16
            Alignment = taJustify
            DataField = 'VALORUNITARIO'
            DataSource = dts_vendaitens
            Text = 'R$ '
          end
          object RLDBText10: TRLDBText
            Left = 418
            Top = 3
            Width = 74
            Height = 16
            Alignment = taJustify
            DataField = 'TOTALPRODUTO'
            DataSource = dts_vendaitens
            Text = 'R$ '
          end
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 255
      Width = 718
      Height = 41
      BandType = btSummary
      object RLDBResult2: TRLDBResult
        Left = 648
        Top = 19
        Width = 63
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
        Left = 537
        Top = 19
        Width = 105
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total da Venda:'
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
      'WHERE V.VENDAID = :VENDAID')
    Params = <
      item
        DataType = ftInteger
        Name = 'VENDAID'
        ParamType = ptInput
        Value = 1
      end>
    Left = 576
    Top = 464
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VENDAID'
        ParamType = ptInput
        Value = 1
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
  object qry_vendaitens: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      ' SELECT'
      ' VI.VENDAID,'
      ' VI.PRODUTOID,'
      ' P.NOME,'
      ' VI.QUANTIDADE,'
      ' VI.VALORUNITARIO,'
      ' VI.TOTALPRODUTO'
      ' FROM VENDASITENS VI'
      ' INNER JOIN PRODUTOS P ON P.PRODUTOID = VI.PRODUTOID'
      ' WHERE VI.VENDAID = :VENDAID'
      ' ORDER BY VI.PRODUTOID')
    Params = <
      item
        DataType = ftInteger
        Name = 'VENDAID'
        ParamType = ptInput
        Value = '1'
      end>
    Left = 680
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VENDAID'
        ParamType = ptInput
        Value = '1'
      end>
    object qry_vendaitensVENDAID: TIntegerField
      FieldName = 'VENDAID'
      Required = True
    end
    object qry_vendaitensPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Required = True
    end
    object qry_vendaitensNOME: TWideStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qry_vendaitensQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object qry_vendaitensVALORUNITARIO: TFloatField
      FieldName = 'VALORUNITARIO'
      DisplayFormat = '#0.00'
    end
    object qry_vendaitensTOTALPRODUTO: TFloatField
      FieldName = 'TOTALPRODUTO'
      DisplayFormat = '#0.00'
    end
  end
  object dts_vendaitens: TDataSource
    DataSet = qry_vendaitens
    Left = 520
    Top = 408
  end
end
