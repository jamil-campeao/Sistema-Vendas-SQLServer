inherited frm_produto: Tfrm_produto
  Caption = 'Cadastro de produto'
  ClientHeight = 552
  ClientWidth = 951
  TextHeight = 15
  inherited pnl_rodape: TPanel
    Top = 511
    Width = 951
    inherited btn_fechar: TBitBtn
      Left = 755
      ExplicitLeft = 753
    end
    inherited btn_navigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgc_principal: TPageControl
    Width = 951
    Height = 511
    ActivePage = tab_manutencao
    ExplicitWidth = 949
    ExplicitHeight = 507
    inherited tab_listagem: TTabSheet
      inherited pnl_listagem: TPanel
        ExplicitWidth = 943
      end
      inherited grd_listagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 265
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'categoriaId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Visible = True
          end>
      end
    end
    inherited tab_manutencao: TTabSheet
      object Label1: TLabel
        Left = 42
        Top = 200
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 42
        Top = 410
        Width = 26
        Height = 15
        Caption = 'Valor'
      end
      object Label3: TLabel
        Left = 167
        Top = 410
        Width = 62
        Height = 15
        Caption = 'Quantidade'
      end
      object Label4: TLabel
        Left = 438
        Top = 150
        Width = 51
        Height = 15
        Caption = 'Categoria'
      end
      object btn_incluircategoria: TSpeedButton
        Left = 778
        Top = 171
        Width = 31
        Height = 22
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
        OnClick = btn_incluircategoriaClick
      end
      object btn_pesquisarcategoria: TSpeedButton
        Left = 815
        Top = 171
        Width = 26
        Height = 22
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF9B3B0A9B3B0A9B3B0A993B0DFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B3B0AFA
          EAC2E9B171953B11FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF9B3B0AFAE9C0EAB474953B11FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B3B0AF9
          E7BFEBB677953B11FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFC3B6B09B3B0AA54D1E9B3B0A983B0EC3B8B4FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA86441C58355FA
          DEB1F7D6A5B3724AAC6C4CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFB89787A54E20F6D4A8FBE2B7F6D19DDBAB799A461FBDA79BFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5BEBBA0491DDDA876F9E3C2F9
          DBADF4CB96E9B97FB17047A3542CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFAE7559B86F40F6D6ACFBE9CDF7D5A4F2C68FEBB879CA905A984D28B68E
          7AFF00FFFF00FFFF00FFFF00FFFF00FFBDA79B9F4516EBBC84FAE9D1FBE8CBF6
          D09CEFC187E9B272D49758A7653C9B4419C5BEBBFF00FFFF00FFFF00FFC7C4C3
          A4532BCD8E5BF5D5AAFBF5E9FAE2BEF3CB95EDBC80E7AD6ADF9C55B8743D924D
          2BAE7254FF00FFFF00FFFF00FFB3856FAC5E30EFC187FAEEDEFCF9F5F7D6A9F1
          C58DEBB778E4A862DF994EC179399B582E93411BC0ADA4FF00FFFF00FF9D3E0F
          9B3B0A9B3B0A9B3B0A9B3B0A9B3B0A9B3B0A9B3B0A9B3B0A9B3B0A9A3B0B983B
          0E973B0FA65B36FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = btn_pesquisarcategoriaClick
      end
      object edt_produtoid: TLabeledEdit
        Tag = 1
        Left = 42
        Top = 115
        Width = 79
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        TabOrder = 0
        Text = ''
      end
      object memo_descricao: TMemo
        Left = 42
        Top = 221
        Width = 865
        Height = 185
        MaxLength = 255
        TabOrder = 3
      end
      object edt_valor: TCurrencyEdit
        Left = 40
        Top = 431
        Width = 121
        Height = 23
        TabOrder = 4
      end
      object edt_quantidade: TCurrencyEdit
        Left = 167
        Top = 431
        Width = 121
        Height = 23
        DisplayFormat = ',0.00;- ,0.00'
        TabOrder = 5
      end
      object lkp_categoria: TDBLookupComboBox
        Left = 438
        Top = 171
        Width = 334
        Height = 23
        KeyField = 'CATEGORIAID'
        ListField = 'descricao'
        ListSource = dts_categoria
        TabOrder = 2
      end
      object edt_descricao: TLabeledEdit
        Left = 42
        Top = 171
        Width = 319
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
        Text = ''
      end
      object pnl_imagem: TPanel
        Left = 751
        Top = 8
        Width = 167
        Height = 137
        BorderStyle = bsSingle
        TabOrder = 6
        object img_imagem: TImage
          Left = 1
          Top = 1
          Width = 161
          Height = 131
          Align = alClient
          PopupMenu = ppm_imagem
          ExplicitWidth = 120
          ExplicitHeight = 135
        end
      end
    end
  end
  inherited qry_listagem: TZQuery
    SQL.Strings = (
      'SELECT'
      'p.produtoId,'
      'p.nome,'
      'p.descricao,'
      'p.valor,'
      'p.quantidade,'
      'p.categoriaId,'
      'c.descricao as DescricaoCategoria'
      'FROM PRODUTOS P'
      'LEFT JOIN CATEGORIAS AS C ON C.CATEGORIAID = P.CATEGORIAID')
    Left = 60
    object qry_listagemprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo Prod'
      FieldName = 'produtoId'
      Origin = 'P'
      ReadOnly = True
    end
    object qry_listagemnome: TWideStringField
      DisplayLabel = 'Nome Prod'
      FieldName = 'nome'
      Origin = 'P'
      Size = 60
    end
    object qry_listagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o Prod'
      FieldName = 'descricao'
      Origin = 'P'
      Size = 255
    end
    object qry_listagemvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'P'
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    end
    object qry_listagemquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Origin = 'P'
    end
    object qry_listagemcategoriaId: TIntegerField
      DisplayLabel = 'Cod Categoria'
      FieldName = 'categoriaId'
      Origin = 'P'
    end
    object qry_listagemDescricaoCategoria: TWideStringField
      DisplayLabel = 'Descri'#231#227'o Categoria'
      FieldName = 'DescricaoCategoria'
      Origin = 'c.descricao'
      Size = 30
    end
  end
  inherited dts_listagem: TDataSource
    Left = 124
  end
  object qry_categoria: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT CATEGORIAID, descricao from CATEGORIAS')
    Params = <>
    Left = 196
    Top = 42
    object qry_categoriaCATEGORIAID: TIntegerField
      FieldName = 'CATEGORIAID'
      ReadOnly = True
    end
    object qry_categoriadescricao: TWideStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dts_categoria: TDataSource
    DataSet = qry_categoria
    Left = 276
    Top = 42
  end
  object ppm_imagem: TPopupMenu
    Left = 859
    Top = 50
    object CarregarImagem1: TMenuItem
      Caption = 'Carregar Imagem'
      OnClick = CarregarImagem1Click
    end
    object LimparImagem1: TMenuItem
      Caption = 'Limpar Imagem'
      OnClick = LimparImagem1Click
    end
  end
end
