inherited frm_cliente: Tfrm_cliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 520
  ClientWidth = 1113
  ExplicitWidth = 1125
  ExplicitHeight = 558
  TextHeight = 15
  inherited pnl_rodape: TPanel
    Top = 479
    Width = 1113
    ExplicitTop = 478
    ExplicitWidth = 1109
    inherited btn_novo: TBitBtn
      Top = 8
      ExplicitTop = 8
    end
    inherited btn_cancelar: TBitBtn
      Left = 199
      TabOrder = 2
      ExplicitLeft = 199
    end
    inherited btn_gravar: TBitBtn
      Left = 297
      TabOrder = 1
      ExplicitLeft = 297
    end
    inherited btn_fechar: TBitBtn
      Left = 885
      ExplicitLeft = 881
    end
    inherited btn_navigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btn_alterar: TBitBtn
      Top = 8
      ExplicitTop = 8
    end
  end
  inherited pgc_principal: TPageControl
    Width = 1113
    Height = 479
    ExplicitWidth = 1109
    ExplicitHeight = 478
    inherited tab_listagem: TTabSheet
      ExplicitWidth = 1105
      ExplicitHeight = 449
      inherited pnl_listagem: TPanel
        Width = 1105
        ExplicitWidth = 1105
      end
      inherited grd_listagem: TDBGrid
        Width = 1105
        Height = 376
        Columns = <
          item
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 293
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'estado'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Visible = True
          end>
      end
    end
    inherited tab_manutencao: TTabSheet
      ExplicitWidth = 1105
      ExplicitHeight = 449
      object lbl_cep: TLabel
        Left = 519
        Top = 139
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object lbl_telefone: TLabel
        Left = 519
        Top = 259
        Width = 44
        Height = 15
        Caption = 'Telefone'
      end
      object Label1: TLabel
        Left = 40
        Top = 371
        Width = 91
        Height = 15
        Caption = 'Data Nascimento'
      end
      object edt_clienteid: TLabeledEdit
        Tag = 1
        Left = 40
        Top = 112
        Width = 121
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        ImeName = 'edt_clienteid'
        TabOrder = 0
        Text = ''
      end
      object edt_nome: TLabeledEdit
        Left = 40
        Top = 160
        Width = 281
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        ImeName = 'edt_nome'
        MaxLength = 60
        TabOrder = 1
        Text = ''
      end
      object edt_endereco: TLabeledEdit
        Left = 40
        Top = 224
        Width = 437
        Height = 23
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 60
        TabOrder = 3
        Text = ''
      end
      object edt_bairro: TLabeledEdit
        Left = 519
        Top = 224
        Width = 193
        Height = 23
        EditLabel.Width = 31
        EditLabel.Height = 15
        EditLabel.Caption = 'Bairro'
        MaxLength = 40
        TabOrder = 4
        Text = ''
      end
      object edt_cidade: TLabeledEdit
        Left = 40
        Top = 280
        Width = 437
        Height = 23
        EditLabel.Width = 37
        EditLabel.Height = 15
        EditLabel.Caption = 'Cidade'
        MaxLength = 50
        TabOrder = 6
        Text = ''
      end
      object edt_cep: TMaskEdit
        Left = 519
        Top = 160
        Width = 82
        Height = 23
        EditMask = '99.999-999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  .   -   '
      end
      object edt_telefone: TMaskEdit
        Left = 519
        Top = 280
        Width = 110
        Height = 23
        EditMask = '(99)99999-9999;1;_'
        MaxLength = 14
        TabOrder = 7
        Text = '(  )     -    '
      end
      object edt_email: TLabeledEdit
        Left = 40
        Top = 336
        Width = 437
        Height = 23
        EditLabel.Width = 29
        EditLabel.Height = 15
        EditLabel.Caption = 'Email'
        MaxLength = 100
        TabOrder = 8
        Text = ''
      end
      object edt_datanascimento: TDateEdit
        Left = 40
        Top = 392
        Width = 121
        Height = 23
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        TabOrder = 9
      end
      object edt_estado: TLabeledEdit
        Left = 735
        Top = 224
        Width = 34
        Height = 23
        EditLabel.Width = 14
        EditLabel.Height = 15
        EditLabel.Caption = 'UF'
        MaxLength = 2
        TabOrder = 5
        Text = ''
      end
    end
  end
  inherited qry_listagem: TZQuery
    SQL.Strings = (
      'SELECT clienteId'
      '      ,nome'
      '      ,endereco'
      '      ,cidade'
      '      ,bairro'
      '      ,estado'
      '      ,cep'
      '      ,telefone'
      '      ,email'
      '      ,datanascimento'
      '  FROM clientes')
    object qry_listagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object qry_listagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object qry_listagemendereco: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 60
    end
    object qry_listagemcidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
    object qry_listagembairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 40
    end
    object qry_listagemestado: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'estado'
      Size = 2
    end
    object qry_listagemcep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 10
    end
    object qry_listagemtelefone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 14
    end
    object qry_listagememail: TWideStringField
      DisplayLabel = 'Email'
      FieldName = 'email'
      Size = 100
    end
    object qry_listagemdatanascimento: TDateTimeField
      FieldName = 'datanascimento'
    end
  end
end
