inherited frm_cadcategoria: Tfrm_cadcategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 453
  ClientWidth = 972
  ExplicitWidth = 984
  ExplicitHeight = 491
  TextHeight = 15
  inherited pnl_rodape: TPanel
    Top = 412
    Width = 972
    ExplicitTop = 411
    ExplicitWidth = 968
    DesignSize = (
      972
      41)
    inherited btn_fechar: TBitBtn
      Left = 782
      Top = 6
      Layout = blGlyphRight
      TabStop = False
      ExplicitLeft = 778
      ExplicitTop = 6
    end
    inherited btn_navigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btn_alterar: TBitBtn
      Left = 103
      WordWrap = True
      ExplicitLeft = 103
    end
  end
  inherited pgc_principal: TPageControl
    Width = 972
    Height = 412
    ExplicitWidth = 968
    ExplicitHeight = 411
    inherited tab_listagem: TTabSheet
      ExplicitWidth = 964
      ExplicitHeight = 382
      inherited pnl_listagem: TPanel
        Width = 964
        ExplicitWidth = 960
      end
      inherited grd_listagem: TDBGrid
        Width = 964
        Height = 309
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaid'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = True
          end>
      end
    end
    inherited tab_manutencao: TTabSheet
      OnContextPopup = tab_manutencaoContextPopup
      ExplicitWidth = 964
      ExplicitHeight = 382
      object edt_categoriaid: TLabeledEdit
        Left = 63
        Top = 56
        Width = 121
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        TabOrder = 0
        Text = ''
      end
      object edt_descricao: TLabeledEdit
        Left = 63
        Top = 120
        Width = 310
        Height = 23
        EditLabel.Width = 51
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
        Text = ''
      end
    end
  end
  inherited qry_listagem: TZQuery
    SQL.Strings = (
      'select'
      'categoriaid,'
      'descricao'
      'from categorias')
    object qry_listagemcategoriaid: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaid'
      ReadOnly = True
    end
    object qry_listagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
end
