inherited frm_cadacaoacesso: Tfrm_cadacaoacesso
  Caption = 'Cadastro de A'#231#245'es'
  TextHeight = 15
  inherited pnl_rodape: TPanel
    inherited btn_fechar: TBitBtn
      Left = 737
      Top = 8
      ExplicitLeft = 733
      ExplicitTop = 8
    end
    inherited btn_navigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgc_principal: TPageControl
    inherited tab_listagem: TTabSheet
      inherited grd_listagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ACAOACESSOID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 337
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAVE'
            Visible = True
          end>
      end
    end
    inherited tab_manutencao: TTabSheet
      object edt_descricao: TLabeledEdit
        Left = 63
        Top = 120
        Width = 458
        Height = 23
        EditLabel.Width = 51
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 100
        TabOrder = 0
        Text = ''
      end
      object edt_acaoacessoid: TLabeledEdit
        Left = 63
        Top = 56
        Width = 50
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        TabOrder = 1
        Text = ''
      end
      object edt_chave: TLabeledEdit
        Left = 63
        Top = 184
        Width = 402
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Chave'
        EditLabel.Transparent = True
        MaxLength = 60
        TabOrder = 2
        Text = ''
      end
    end
  end
  inherited qry_listagem: TZQuery
    SQL.Strings = (
      'SELECT ACAOACESSOID,'
      'DESCRICAO,'
      'CHAVE'
      'FROM ACAOACESSO')
    object qry_listagemACAOACESSOID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ACAOACESSOID'
      ReadOnly = True
    end
    object qry_listagemDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object qry_listagemCHAVE: TWideStringField
      DisplayLabel = 'Chave'
      FieldName = 'CHAVE'
      Required = True
      Size = 60
    end
  end
end
