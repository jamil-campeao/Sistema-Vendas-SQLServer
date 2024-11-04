inherited frm_concategoria: Tfrm_concategoria
  Caption = 'Consulta de Categorias'
  ClientHeight = 374
  ClientWidth = 714
  ExplicitWidth = 726
  ExplicitHeight = 412
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 714
    ExplicitWidth = 886
  end
  inherited Panel2: TPanel
    Top = 333
    Width = 714
    inherited btn_fechar: TBitBtn
      Left = 607
      ExplicitLeft = 779
    end
  end
  inherited Panel3: TPanel
    Width = 714
    Height = 268
    inherited grd_pesquisa: TDBGrid
      Width = 712
      Height = 266
      DataSource = dts_listagem
    end
  end
  inherited qry_listagem: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT CATEGORIAID,'
      'DESCRICAO'
      'FROM CATEGORIAS')
    Left = 488
    Top = 16
    object qry_listagemCATEGORIAID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CATEGORIAID'
      ReadOnly = True
    end
    object qry_listagemDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  inherited dts_listagem: TDataSource
    Left = 568
  end
end
