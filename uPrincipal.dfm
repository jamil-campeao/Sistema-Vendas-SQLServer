object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 439
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = main_principal
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object stb_principal: TStatusBar
    Left = 0
    Top = 416
    Width = 616
    Height = 23
    Panels = <
      item
        Width = 150
      end>
    ExplicitTop = 412
    ExplicitWidth = 614
  end
  object main_principal: TMainMenu
    Left = 184
    Top = 64
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        ShortCut = 16451
        OnClick = Cliente1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Usuario1: TMenuItem
        Caption = 'Usu'#225'rio'
        ShortCut = 16469
        OnClick = Usuario1Click
      end
      object AlterarSenha1: TMenuItem
        Caption = 'Alterar Senha'
        OnClick = AlterarSenha1Click
      end
      object N2: TMenuItem
        Caption = 'Categoria'
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = 'Produto'
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object menu_fechar: TMenuItem
        Caption = 'Fechar'
        OnClick = menu_fecharClick
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
    end
    object Relatorio1: TMenuItem
      Caption = 'Relat'#243'rio'
      object Categoria1: TMenuItem
        Caption = 'Categoria'
        OnClick = Categoria1Click
      end
      object Cliente2: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente2Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Produt1: TMenuItem
        Caption = 'Produto'
        OnClick = Produt1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Vendas2: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas2Click
      end
      object VendaPorData1: TMenuItem
        Caption = 'Venda Por Data'
        OnClick = VendaPorData1Click
      end
      object FichadeCliente1: TMenuItem
        Caption = 'Ficha de Cliente'
        OnClick = FichadeCliente1Click
      end
      object ProdutosPorCategoria1: TMenuItem
        Caption = 'Produtos Por Categoria'
        OnClick = ProdutosPorCategoria1Click
      end
      object Grficos1: TMenuItem
        Caption = 'Gr'#225'ficos'
        OnClick = Grficos1Click
      end
    end
    object Administrao1: TMenuItem
      Caption = 'Administra'#231#227'o'
      object AoAcesso1: TMenuItem
        Caption = 'A'#231#227'o Acesso'
        OnClick = AoAcesso1Click
      end
      object PermissaodeUsurios1: TMenuItem
        Caption = 'Permiss'#227'o de Usu'#225'rios'
        OnClick = PermissaodeUsurios1Click
      end
    end
  end
end
