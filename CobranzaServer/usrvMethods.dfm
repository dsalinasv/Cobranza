object srvMethods: TsrvMethods
  OldCreateOrder = False
  Height = 262
  Width = 313
  object cntData: TFDConnection
    Params.Strings = (
      'Database=C:\AppData\COBRANZA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object qryClientes: TFDQuery
    Connection = cntData
    SQL.Strings = (
      'select * from clientes order by numero_cliente')
    Left = 88
    Top = 56
  end
  object qryArticulos: TFDQuery
    Connection = cntData
    SQL.Strings = (
      'select * from articulos order by codigo')
    Left = 24
    Top = 56
  end
  object qryGeneral: TFDQuery
    Connection = cntData
    Left = 88
    Top = 8
  end
  object qryVentas: TFDQuery
    Connection = cntData
    SQL.Strings = (
      'select * from ventas where folio = :folio')
    Left = 216
    Top = 56
    ParamData = <
      item
        Name = 'FOLIO'
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryVentasDetalles: TFDQuery
    MasterSource = dsVentas
    Connection = cntData
    SQL.Strings = (
      'select * from ventas_detalles'
      'where id_ventas = :id_ventas')
    Left = 216
    Top = 152
    ParamData = <
      item
        Name = 'ID_VENTAS'
        DataType = ftString
        ParamType = ptInput
        Size = 38
        Value = Null
      end>
  end
  object dsVentas: TDataSource
    DataSet = qryVentas
    Left = 216
    Top = 104
  end
  object dspVentas: TDataSetProvider
    DataSet = qryVentas
    Options = [poFetchDetailsOnDemand, poCascadeDeletes, poCascadeUpdates, poPropogateChanges, poUseQuoteChar]
    Left = 216
    Top = 200
  end
  object dspArticulos: TDataSetProvider
    DataSet = qryArticulos
    Left = 24
    Top = 104
  end
  object dspClientes: TDataSetProvider
    DataSet = qryClientes
    Left = 88
    Top = 104
  end
  object qryEstados: TFDQuery
    Connection = cntData
    SQL.Strings = (
      'select * from estados order by nombre')
    Left = 152
    Top = 56
  end
  object dspEstados: TDataSetProvider
    DataSet = qryEstados
    Left = 152
    Top = 104
  end
  object dspGeneral: TDataSetProvider
    DataSet = qryGeneral
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 8
  end
end
