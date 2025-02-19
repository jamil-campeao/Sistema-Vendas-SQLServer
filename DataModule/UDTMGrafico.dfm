object dtmgrafico: Tdtmgrafico
  Height = 480
  Width = 640
  object qry_produtoestoque: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT CONVERT(VARCHAR, PRODUTOID) + '#39' - '#39'+NOME AS LABEL, '
      'QUANTIDADE AS VALUE FROM PRODUTOS')
    Params = <>
    Left = 472
    Top = 40
    object qry_produtoestoqueLABEL: TWideStringField
      FieldName = 'LABEL'
      ReadOnly = True
      Size = 93
    end
    object qry_produtoestoqueVALUE: TFloatField
      FieldName = 'VALUE'
    end
  end
  object qry_valorvendaporcliente: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      
        '     SELECT CONVERT(VARCHAR, V.CLIENTEID) + '#39' - '#39'+ C.NOME AS LAB' +
        'EL,'
      '     SUM(V.TOTALVENDA) AS VALUE'
      '     FROM VENDAS  V'
      '     INNER JOIN CLIENTES C ON C.CLIENTEID = V.CLIENTEID'
      
        '     WHERE V.DATAVENDA BETWEEN CONVERT(DATE, GETDATE()-7) AND CO' +
        'NVERT(DATE, GETDATE())'
      '     GROUP BY V.CLIENTEID, C.NOME')
    Params = <>
    Left = 248
    Top = 104
    object qry_valorvendaporclienteLABEL: TWideStringField
      FieldName = 'LABEL'
      ReadOnly = True
      Size = 93
    end
    object qry_valorvendaporclienteVALUE: TFloatField
      FieldName = 'VALUE'
      ReadOnly = True
    end
  end
  object qry_produtomaisvendidos: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      
        ' SELECT TOP 10 CONVERT(VARCHAR, VI.PRODUTOID) + '#39'-'#39' + P.NOME AS ' +
        'LABEL,'
      ' SUM(VI.TOTALPRODUTO) AS VALUE'
      ' FROM VENDASITENS VI'
      ' INNER JOIN PRODUTOS AS P ON P.PRODUTOID = VI.PRODUTOID'
      ' GROUP BY VI.PRODUTOID, P.NOME'
      ' ORDER BY LABEL DESC')
    Params = <>
    Left = 240
    Top = 168
  end
  object qry_vendasultimasemana: TZQuery
    Connection = DtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT V.DATAVENDA AS LABEL,'
      'SUM(V.TOTALVENDA) AS VALUE'
      'FROM VENDAS V'
      
        'WHERE V.DATAVENDA BETWEEN CONVERT(DATE, GETDATE()-7) AND CONVERT' +
        '(DATE, GETDATE())'
      'GROUP BY V.DATAVENDA')
    Params = <>
    Left = 408
    Top = 128
  end
end
