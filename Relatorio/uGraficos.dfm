object frm_graficos: Tfrm_graficos
  Left = 0
  Top = 0
  Caption = 'Gr'#225'ficos'
  ClientHeight = 710
  ClientWidth = 1140
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1140
    Height = 710
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1136
    ExplicitHeight = 709
    object Splitter1: TSplitter
      Left = 1
      Top = 352
      Width = 568
      Height = 3
      Align = alNone
    end
    object Splitter2: TSplitter
      Left = 569
      Top = 352
      Width = 568
      Height = 3
      Align = alNone
    end
    object Splitter3: TSplitter
      Left = 587
      Top = 4
      Height = 346
      Align = alNone
    end
    object Splitter4: TSplitter
      Left = 587
      Top = 361
      Height = 344
      Align = alNone
    end
    object Panel2: TPanel
      Left = 0
      Top = 1
      Width = 581
      Height = 349
      TabOrder = 0
      object DBChart1: TDBChart
        Left = 1
        Top = 1
        Width = 579
        Height = 347
        Title.Text.Strings = (
          'Produtos em Estoque')
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TBarSeries
          HoverElement = []
          Marks.Brush.Gradient.Colors = <
            item
              Color = clRed
            end
            item
              Color = 819443
              Offset = 0.067915690866510540
            end
            item
              Color = clYellow
              Offset = 1.000000000000000000
            end>
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = clYellow
          Marks.Brush.Gradient.MidColor = 819443
          Marks.Brush.Gradient.StartColor = clRed
          Marks.Brush.Gradient.Visible = True
          Marks.Font.Color = 159
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = [fsBold, fsItalic]
          Marks.Frame.Color = 33023
          Marks.RoundSize = 14
          Marks.Visible = False
          DataSource = dtmgrafico.qry_produtoestoque
          Title = 'ProdutoEstoque'
          XLabelsSource = 'LABEL'
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          YValues.ValueSource = 'VALUE'
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 356
      Width = 580
      Height = 349
      TabOrder = 1
      object DBChart3: TDBChart
        Left = 1
        Top = 1
        Width = 578
        Height = 347
        Title.Text.Strings = (
          '10 Produtos mais vendidos na '#250'ltima semana')
        Legend.TextStyle = ltsLeftPercent
        View3D = False
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 2
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object PieSeries1: TPieSeries
          HoverElement = []
          Marks.Brush.Gradient.Colors = <
            item
              Color = clRed
            end
            item
              Color = 819443
              Offset = 0.067915690866510540
            end
            item
              Color = clYellow
              Offset = 1.000000000000000000
            end>
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = clYellow
          Marks.Brush.Gradient.MidColor = 819443
          Marks.Brush.Gradient.StartColor = clRed
          Marks.Brush.Gradient.Visible = True
          Marks.Font.Color = 159
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = [fsBold, fsItalic]
          Marks.Frame.Color = 33023
          Marks.RoundSize = 14
          Marks.Style = smsValue
          Marks.Callout.Length = 20
          Marks.Tail.Margin = 2
          DataSource = dtmgrafico.qry_produtomaisvendidos
          Title = '10ProdutosMaisVendidos'
          XLabelsSource = 'LABEL'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'VALUE'
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          OtherSlice.Legend.TextStyle = ltsPercent
          OtherSlice.Legend.Visible = False
        end
      end
    end
    object Panel4: TPanel
      Left = 596
      Top = -3
      Width = 541
      Height = 358
      TabOrder = 2
      object DBChart2: TDBChart
        Left = 1
        Top = 1
        Width = 539
        Height = 356
        Title.Text.Strings = (
          'Valor de Venda por Cliente na '#218'ltima Semana')
        Legend.TextStyle = ltsLeftPercent
        View3D = False
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitTop = 2
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series2: TPieSeries
          HoverElement = []
          Marks.Brush.Gradient.Colors = <
            item
              Color = clRed
            end
            item
              Color = 819443
              Offset = 0.067915690866510540
            end
            item
              Color = clYellow
              Offset = 1.000000000000000000
            end>
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = clYellow
          Marks.Brush.Gradient.MidColor = 819443
          Marks.Brush.Gradient.StartColor = clRed
          Marks.Brush.Gradient.Visible = True
          Marks.Font.Color = 159
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = [fsBold, fsItalic]
          Marks.Frame.Color = 33023
          Marks.RoundSize = 14
          Marks.Style = smsValue
          Marks.Callout.Length = 20
          DataSource = dtmgrafico.qry_valorvendaporcliente
          Title = 'ValordeVendaporClientena'#218'ltimaSemana'
          XLabelsSource = 'LABEL'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'VALUE'
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          OtherSlice.Legend.TextStyle = ltsPercent
          OtherSlice.Legend.Visible = False
        end
      end
    end
    object Panel5: TPanel
      Left = 596
      Top = 361
      Width = 547
      Height = 344
      TabOrder = 3
      object DBChart4: TDBChart
        Left = 1
        Top = 1
        Width = 545
        Height = 342
        Title.Text.Strings = (
          'Vendas da '#218'ltima Semana')
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 72
        ExplicitTop = 24
        ExplicitWidth = 400
        ExplicitHeight = 250
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series3: TLineSeries
          HoverElement = [heCurrent]
          DataSource = dtmgrafico.qry_vendasultimasemana
          Title = 'VendasUltimaSemana'
          XLabelsSource = 'LABEL'
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'VALUE'
        end
      end
    end
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 608
    Top = 6
  end
end
