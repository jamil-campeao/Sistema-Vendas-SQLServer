object DtmPrincipal: TDtmPrincipal
  Height = 268
  Width = 517
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    AutoCommit = False
    ReadOnly = True
    TransactIsolationLevel = tiReadCommitted
    HostName = '.\SERVERCURSO'
    Port = 1433
    Database = 'VENDAS'
    User = 'sa'
    Password = 'Admin100%'
    Protocol = 'mssql'
    LibraryLocation = 'C:\ProjetoDelphi\ntwdblib.dll'
    Left = 136
    Top = 64
  end
end
