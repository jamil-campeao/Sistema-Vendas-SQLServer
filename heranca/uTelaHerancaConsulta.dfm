object frm_herancaconsulta: Tfrm_herancaconsulta
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'DIGITE O TITULO'
  ClientHeight = 384
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 890
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 927
    object lbl_indice: TLabel
      Left = 8
      Top = 15
      Width = 51
      Height = 15
      Caption = 'lbl_indice'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object msk_pesquisar: TMaskEdit
      Left = 8
      Top = 36
      Width = 441
      Height = 23
      TabOrder = 0
      Text = ''
      TextHint = 'Digite sua Pesquisa'
      OnChange = msk_pesquisarChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 343
    Width = 890
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 376
    ExplicitTop = 320
    ExplicitWidth = 185
    DesignSize = (
      890
      41)
    object btn_fechar: TBitBtn
      Left = 787
      Top = 6
      Width = 80
      Height = 26
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
      ExplicitLeft = 941
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 890
    Height = 278
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 392
    ExplicitTop = 200
    ExplicitWidth = 185
    ExplicitHeight = 41
    object grd_pesquisa: TDBGrid
      Left = 1
      Top = 1
      Width = 888
      Height = 276
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = grd_pesquisaDblClick
      OnKeyDown = grd_pesquisaKeyDown
      OnTitleClick = grd_pesquisaTitleClick
    end
  end
  object qry_listagem: TZQuery
    Params = <>
    Left = 648
    Top = 8
  end
  object dts_listagem: TDataSource
    DataSet = qry_listagem
    Left = 736
    Top = 16
  end
end
