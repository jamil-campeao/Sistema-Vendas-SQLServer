object dtm_venda: Tdtm_venda
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object qry_cliente: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT CLIENTEID,'
      'NOME'
      'FROM CLIENTES')
    Params = <>
    Left = 368
    Top = 112
    object qry_clienteCLIENTEID: TIntegerField
      DisplayLabel = 'C'#243'd Cliente'
      FieldName = 'CLIENTEID'
      ReadOnly = True
    end
    object qry_clienteNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
  end
  object qry_produto: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT PRODUTOID,'
      'NOME,'
      'VALOR,'
      'QUANTIDADE'
      'FROM PRODUTOS')
    Params = <>
    Left = 248
    Top = 136
    object qry_produtoPRODUTOID: TIntegerField
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'PRODUTOID'
      ReadOnly = True
    end
    object qry_produtoNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object qry_produtoVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object qry_produtoQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
  end
  object dts_cliente: TDataSource
    AutoEdit = False
    DataSet = qry_cliente
    Left = 368
    Top = 240
  end
  object dts_produto: TDataSource
    AutoEdit = False
    DataSet = qry_produto
    Left = 480
    Top = 216
  end
  object dts_itensvenda: TDataSource
    AutoEdit = False
    DataSet = cds_itensvenda
    Left = 488
    Top = 288
  end
  object cds_itensvenda: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'produtoid'
        DataType = ftInteger
      end
      item
        Name = 'nomeproduto'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'quantidade'
        DataType = ftFloat
      end
      item
        Name = 'valorunitario'
        DataType = ftFloat
      end
      item
        Name = 'valortotalproduto'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 192
    Top = 248
    object cds_itensvendaprodutoid: TIntegerField
      DisplayLabel = 'Cod Prod'
      FieldName = 'produtoid'
    end
    object cds_itensvendanomeproduto: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nomeproduto'
      Size = 60
    end
    object cds_itensvendaquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object cds_itensvendavalorunitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'valorunitario'
    end
    object cds_itensvendavalortotalproduto: TFloatField
      DisplayLabel = 'Total do produto'
      FieldName = 'valortotalproduto'
    end
  end
end
