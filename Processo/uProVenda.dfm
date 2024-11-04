inherited frm_provenda: Tfrm_provenda
  Caption = 'Vendas'
  ClientHeight = 552
  ClientWidth = 949
  ExplicitHeight = 587
  TextHeight = 15
  inherited pnl_rodape: TPanel
    Top = 511
    Width = 949
    ExplicitWidth = 947
    inherited btn_novo: TBitBtn
      Left = 21
      Top = 6
      ExplicitLeft = 21
      ExplicitTop = 6
    end
    inherited btn_fechar: TBitBtn
      Left = 764
      Top = 6
      ExplicitLeft = 762
      ExplicitTop = 6
    end
    inherited btn_navigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btn_apagar: TBitBtn
      Left = 396
      ExplicitLeft = 396
    end
    inherited btn_alterar: TBitBtn
      Left = 111
      ExplicitLeft = 111
    end
  end
  inherited pgc_principal: TPageControl
    Width = 949
    Height = 511
    ActivePage = tab_manutencao
    ExplicitWidth = 947
    inherited tab_listagem: TTabSheet
      ExplicitHeight = 481
      inherited pnl_listagem: TPanel
        ExplicitWidth = 939
      end
      inherited grd_listagem: TDBGrid
        Height = 408
        ImeName = 'grd_itensvenda'
        OnKeyDown = grd_listagemKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'VENDAID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTEID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAVENDA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALVENDA'
            Visible = True
          end>
      end
    end
    inherited tab_manutencao: TTabSheet
      ExplicitHeight = 481
      object Label4: TLabel
        Left = 168
        Top = 35
        Width = 37
        Height = 15
        Caption = 'Cliente'
      end
      object Label1: TLabel
        Left = 535
        Top = 35
        Width = 59
        Height = 15
        Caption = 'Data Venda'
      end
      object Label2: TLabel
        Left = 707
        Top = 452
        Width = 81
        Height = 15
        Caption = 'Valor da Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 24
        Top = 114
        Width = 43
        Height = 15
        Caption = 'Produto'
      end
      object Label5: TLabel
        Left = 335
        Top = 114
        Width = 71
        Height = 15
        Caption = 'Valor Unit'#225'rio'
      end
      object Label6: TLabel
        Left = 433
        Top = 115
        Width = 62
        Height = 15
        Caption = 'Quantidade'
      end
      object Label7: TLabel
        Left = 519
        Top = 114
        Width = 88
        Height = 15
        Caption = 'Total do Produto'
      end
      object edt_vendaid: TLabeledEdit
        Tag = 1
        Left = 24
        Top = 56
        Width = 121
        Height = 23
        EditLabel.Width = 74
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo Venda'
        Enabled = False
        ImeName = 'edt_clienteid'
        TabOrder = 0
        Text = ''
      end
      object lkp_cliente: TDBLookupComboBox
        Left = 168
        Top = 56
        Width = 334
        Height = 23
        KeyField = 'CLIENTEID'
        ListField = 'NOME'
        ListSource = dtm_venda.dts_cliente
        TabOrder = 1
        OnExit = lkp_clienteExit
      end
      object edt_datavenda: TDateEdit
        Left = 535
        Top = 56
        Width = 121
        Height = 23
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        TabOrder = 2
        OnExit = edt_datavendaExit
      end
      object Panel1: TPanel
        Left = 0
        Top = 165
        Width = 941
        Height = 316
        Align = alBottom
        TabOrder = 7
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 939
          Height = 41
          Align = alTop
          TabOrder = 0
        end
        object Panel3: TPanel
          Left = 1
          Top = 274
          Width = 939
          Height = 41
          Align = alBottom
          TabOrder = 1
          object edt_valortotal: TCurrencyEdit
            Left = 800
            Top = 9
            Width = 121
            Height = 23
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 0
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 42
          Width = 939
          Height = 232
          Align = alClient
          TabOrder = 2
          object dbgrid_itensvenda: TDBGrid
            Left = 1
            Top = 1
            Width = 937
            Height = 230
            Align = alClient
            DataSource = dtm_venda.dts_itensvenda
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDblClick = dbgrid_itensvendaDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'produtoid'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nomeproduto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorunitario'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valortotalproduto'
                Width = 101
                Visible = True
              end>
          end
        end
      end
      object lkp_produto: TDBLookupComboBox
        Left = 24
        Top = 135
        Width = 289
        Height = 23
        KeyField = 'PRODUTOID'
        ListField = 'NOME'
        ListSource = dtm_venda.dts_produto
        TabOrder = 3
        OnExit = lkp_produtoExit
      end
      object edt_valorunitario: TCurrencyEdit
        Left = 335
        Top = 135
        Width = 82
        Height = 23
        DisplayFormat = ',0.00;- ,0.00'
        TabOrder = 4
        OnExit = edt_valorunitarioExit
      end
      object edt_quantidade: TCurrencyEdit
        Left = 433
        Top = 136
        Width = 69
        Height = 23
        DisplayFormat = ',0.00;- ,0.00'
        TabOrder = 5
        OnExit = edt_quantidadeExit
      end
      object edt_totalproduto: TCurrencyEdit
        Left = 519
        Top = 135
        Width = 88
        Height = 23
        TabStop = False
        DisplayFormat = ',0.00;- ,0.00'
        ParentColor = True
        ReadOnly = True
        TabOrder = 8
      end
      object btn_adicionaritem: TBitBtn
        Left = 627
        Top = 135
        Width = 81
        Height = 24
        Caption = 'Adicionar'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FF0A6B0A0A6B0A0A6B0A0A6B0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFB25D130A6B0A42D37331B85A0A6B0AA8
          4E0FA54A0EA4480DA1440DA0420C9F3F0C9D3E0BFF00FFFF00FFFF00FFFF00FF
          B561140A6B0A78F3A440D1710A6B0AFBF0DEFBEFDAFBEDD5FBEBD1FBE9CDFBE7
          C89E400BFF00FFFF00FF0A6B0A0A6B0A0A6B0A0A6B0A78F3A444D5740A6B0A0A
          6B0A0A6B0A0A6B0AFCEDD6FBEBD1FBEACEA1430CFF00FFFF00FF0A6B0A78F3A4
          53E4844FE1804CDD7C48D97845D67541D27231B85A0A6B0AFBEFDBFCEDD6FBEB
          D1A3470DFF00FFFF00FF0A6B0A78F3A478F3A478F3A478F3A44DDE7D78F3A478
          F3A442D3730A6B0AFCF1E0FBEFDBFBEDD7A64B0EFF00FFFF00FF0A6B0A0A6B0A
          0A6B0A0A6B0A78F3A450E2810A6B0A0A6B0A0A6B0A0A6B0AFCF4E4FBF1E1FCEF
          DCA94F0FFF00FFFF00FFFF00FFFF00FFC375190A6B0A78F3A454E5850A6B0AFC
          F9F5FCF7F1FCF7EEFCF5E9FBF3E4FCF2E2AC5110FF00FFFF00FFFF00FFFF00FF
          C579190A6B0A78F3A478F3A40A6B0AFCFAF7FCF9F5FCF7F2FCF7EEFBF6E9FBF3
          E5AD5611FF00FFFF00FFFF00FFFF00FFC77C1A0A6B0A0A6B0A0A6B0A0A6B0AFC
          FBFBFCFAF8FCF9F5FBF8F2FCF7EEFBF6EAB05A12FF00FFFF00FFFF00FFFF00FF
          C97F1CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFCFBF8FCF9F6FCF8F2FCF7
          EFB35E13FF00FFFF00FFFF00FFFF00FFCC821CFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFAFCFBF9FCFAF6FCF8F3B66214FF00FFFF00FFFF00FFFF00FF
          CE851DFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFCFBF9FCFA
          F7B96615FF00FFFF00FFFF00FFFF00FFCF861DFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFCFBFCFBF8BC6A16FF00FFFF00FFFF00FFFF00FF
          CF871DCF871DCE861DCC831CCC821CCA801BC87D1BC67A1AC47719C37419C172
          17BF6F17FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 6
        OnClick = btn_adicionaritemClick
      end
      object btn_apagaritem: TBitBtn
        Left = 714
        Top = 134
        Width = 81
        Height = 24
        Caption = 'Remover'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
          FF00FFBDA79BB17B5BA95C2FA44B199B3B0A9B3B0A9D400FA8592DB17B5EBEA8
          9EFF00FFFF00FFFF00FFFF00FFFF00FFAB6945A44A12BF6E21D89D5AE6BF8BEE
          CC97EFCB91EDC486E1AE71C6844AA65020AF7556FF00FFFF00FFFF00FFFF00FF
          A14818E9BA7CF6DCBBF7E4CCF7ECDBF7E6CBF8E0BAF9DAAAF9D9A9F9D7A8F0C8
          95A44E22FF00FFFF00FFFF00FFFF00FFA3491AF4D1A6F5DAB6F6E3C7F7E9D4F7
          E4C6F7DEB5F8D9A7F8D8A7F9D6A7F9D4A5A34818FF00FFFF00FFFF00FFC3B8B2
          AE5E2DF3D0A1F4D8B1F5E1C2F6E6CFF7E2C0F7DCB0F7D7A5F8D7A5F8D6A6F9D4
          A5B36132C3BBB6FF00FFFF00FFBEA89EBB723EF2CE9DF3D6AEF4DEBFF5E4C8F6
          DFBBF7D9ACF7D6A3F7D5A3F8D5A4F8D4A4C27B4DBEAAA0FF00FFFF00FFB89787
          C7824BF1CC99F2D4AAF3DCBAF4E1C2F5DCB6F6D8A9F7D4A0F7D4A2F7D4A3F8D4
          A4CF9163B99A89FF00FFFF00FFB48973CF9054F0CA96F2D2A6F2DAB6F3DEBDF4
          DAB1F5D6A6F6D39EF7D3A0F7D3A1F7D2A2DDA877B58A73FF00FFFF00FFAF7658
          D89C5DEFC891F1D0A2F2D8B1F3DBB8F4D8ADF5D4A2F6D29CF6D29EF7D2A0F7D2
          A2E6B485B1795BFF00FFFF00FFAA643CE0A768EFC68EF0CE9EF1D6AEF2D9B3F3
          D6A9F4D29FF5D19AF6D19DF7D29FF7D2A1EDC091AC6844FF00FFFF00FFA55426
          E5B172F0D0A2F2D8B3F5E3C7F5E4CBF6E5CBF6E5CBF7E6CDF7E7D0F7E1C0F8DD
          B9F3CA9AAA5A2FFF00FFFF00FFBE805FEBCB9CE4B162E1A64ADD9A34DFA141E1
          A84FE3AE5CE5B569E7BB76ECCA95F1D8B2F4E3CDC79073FF00FFFF00FF9E4211
          B45D0FC57315CF8322D79431DFA242E1A84FE4AE5DE5B56AE1B16FDAA76CCF97
          62B97344A24B1FFF00FFFF00FFC3B8B2B2836AAB6238A653239F44139B3B0A9B
          3B0A9B3B0A9B3B0AA14415A7562AAE6C48B48A75C5BEBBFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 9
        TabStop = False
        OnClick = btn_apagaritemClick
      end
    end
  end
  inherited qry_listagem: TZQuery
    SQL.Strings = (
      'SELECT'
      'V.VENDAID,'
      'V.CLIENTEID,'
      'C.NOME,'
      'V.DATAVENDA,'
      'V.TOTALVENDA'
      'FROM VENDAS V'
      'INNER JOIN CLIENTES C ON C.CLIENTEID = V.CLIENTEID')
    Left = 820
    Top = 34
    object qry_listagemVENDAID: TIntegerField
      DisplayLabel = 'C'#243'd Venda'
      FieldName = 'VENDAID'
      Origin = 'V'
      ReadOnly = True
    end
    object qry_listagemCLIENTEID: TIntegerField
      DisplayLabel = 'C'#243'd Cliente'
      FieldName = 'CLIENTEID'
      Origin = 'V'
      Required = True
    end
    object qry_listagemNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'C'
      Size = 60
    end
    object qry_listagemDATAVENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATAVENDA'
      Origin = 'V'
    end
    object qry_listagemTOTALVENDA: TFloatField
      DisplayLabel = 'Total Venda'
      FieldName = 'TOTALVENDA'
      Origin = 'V'
    end
  end
  inherited dts_listagem: TDataSource
    Left = 908
    Top = 34
  end
end
