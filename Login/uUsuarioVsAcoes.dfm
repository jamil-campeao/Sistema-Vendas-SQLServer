object frm_usuario_acoes: Tfrm_usuario_acoes
  Left = 0
  Top = 0
  Caption = 'Permiss'#227'o de Usu'#225'rios'
  ClientHeight = 506
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 260
    Height = 465
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 464
    object grd_usuario: TDBGrid
      Left = 1
      Top = 1
      Width = 258
      Height = 463
      Align = alClient
      DataSource = dts_usuario
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'USUARIOID'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 180
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 260
    Top = 0
    Width = 588
    Height = 465
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 1
      Top = 1
      Height = 463
      ExplicitLeft = 48
      ExplicitTop = 304
      ExplicitHeight = 100
    end
    object grd_acoes: TDBGrid
      Left = 4
      Top = 1
      Width = 583
      Height = 463
      Align = alClient
      DataSource = dts_acoes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = grd_acoesDrawColumnCell
      OnDblClick = grd_acoesDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'USUARIOID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ACAOACESSOID'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 406
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATIVO'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 465
    Width = 848
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 464
    ExplicitWidth = 844
    DesignSize = (
      848
      41)
    object btn_fechar: TBitBtn
      Tag = 99
      Left = 746
      Top = 6
      Width = 81
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF244E6E
        0A6B9BA6B2F19FA4DAA29CBFAD9BAAB69E9EB69E9EB69F9FB69F9FB69F9FB69F
        9F3C9DBE244E6EFF00FFFF00FF244E6E0A6B9B95AAFC8199FC6F8BFC5D7DFC56
        72F06272D47A79B899879CAB9090AB90903FA0BF244E6EFF00FFFF00FF244E6E
        0A6B9B849CFC728DFC607FFC4E71FC3C62FC2A54FC1745FC0A3AFAA08181A081
        8142A3C1244E6EFF00FFFF00FF244E6E0D6E9D7490FC6282FC5074FC3E64FC2C
        56FC1A48FC0A3BFC0A34F095727295727245A6C2244E6EFF00FFFF00FF244E6E
        10719F6684FC5475FC4267FC3059FC1E4AFC0C3CFC0A36F20A2FE58963638963
        6348A9C4244E6EFF00FFFF00FF244E6E1374A15778FC4569FC335BFC214DFC0F
        3EFC0A37F40A2FE60A2ADA7E54547E54544BACC6244E6EFF00FFFF00FF244E6E
        1575A3486CFC365EFC244FFC1240FC0A37F50A31E80A2ADC0A24D07446467446
        464EAEC8244E6EFF00FFFF00FF244E6E1778A53960FC2751FC1543FC0A38F70A
        32EA0A2BDE0A7ED80AA0E16A3C3C6B3B3B50B1CA244E6EFF00FFFF00FF244E6E
        1A7BA72A54FC1744FC0A39F90A33ED0A2CE00A27D30B91EA4DC9F3693D3E6B3B
        3B53B4CC244E6EFF00FFFF00FF244E6E1D7EA91947FC0A3AFB0A34EF0A2DE30A
        28D50A21C90A1BBD0A15B06B3B3B6B3B3B56B7CE244E6EFF00FFFF00FF244E6E
        2081AB0A3BFC0A35F10A2EE40A29D80A22CB0A1CBF0A16B20A0EA56B3B3B6B3B
        3B59BAD0244E6EFF00FFFF00FF244E6E2384AC0A36F30A2FE60A2ADA0A23CE0A
        1DC00A15B10A0FA40A0A9B6B3B3B6B3B3B5CBDD1244E6EFF00FFFF00FF244E6E
        2687AE0A31E80A2ADC0A24D00A1BBE0A13AD0A0EA30A0A9C0A0A9B6B3B3B6B3B
        3B5EBFD3244E6EFF00FFFF00FF244E6E2989B00A2BDE0A21C90A17B40A11AA0A
        0EA20A0B9C0A0A9B0A0A9B6B3B3B6B3B3B61C1D5244E6EFF00FFFF00FF244E6E
        2B8CB23192B53697B93C9CBC3FA0BF45A6C24AABC64FB0C954B5CD59BAD15FBF
        D363C4D7244E6EFF00FFFF00FF244E6E244E6E244E6E244E6E244E6E244E6E24
        4E6E244E6E244E6E244E6E244E6E244E6E244E6E244E6EFF00FF}
      TabOrder = 0
      OnClick = btn_fecharClick
      ExplicitLeft = 742
    end
  end
  object qry_usuario: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    AfterScroll = qry_usuarioAfterScroll
    SQL.Strings = (
      'SELECT '
      'USUARIOID,'
      'NOME'
      'FROM USUARIOS')
    Params = <>
    Left = 32
    Top = 136
    object qry_usuarioUSUARIOID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USUARIOID'
      ReadOnly = True
    end
    object qry_usuarioNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object qry_acoes: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT'
      'UA.USUARIOID,'
      'UA.ACAOACESSOID,'
      'A.DESCRICAO,'
      'UA.ATIVO'
      ''
      'FROM USUARIOSACAOACESSO UA'
      'INNER JOIN ACAOACESSO A ON A.ACAOACESSOID = UA.ACAOACESSOID'
      'WHERE UA.USUARIOID = :USUARIOID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'USUARIOID'
        ParamType = ptUnknown
      end>
    Left = 368
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'USUARIOID'
        ParamType = ptUnknown
      end>
    object qry_acoesUSUARIOID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USUARIOID'
      Required = True
    end
    object qry_acoesACAOACESSOID: TIntegerField
      DisplayLabel = 'C'#243'digo Permiss'#227'o'
      FieldName = 'ACAOACESSOID'
      Required = True
    end
    object qry_acoesDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object qry_acoesATIVO: TBooleanField
      DisplayLabel = 'Status'
      FieldName = 'ATIVO'
      Required = True
    end
  end
  object dts_acoes: TDataSource
    DataSet = qry_acoes
    Left = 490
    Top = 208
  end
  object dts_usuario: TDataSource
    DataSet = qry_usuario
    Left = 74
    Top = 72
  end
end
