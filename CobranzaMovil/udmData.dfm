object dmData: TdmData
  OldCreateOrder = False
  Height = 150
  Width = 215
  object cntData: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'HostName=cevaf.redirectme.net'
      'port=111')
    Left = 24
    Top = 16
  end
  object cdsGeneral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGeneral'
    RemoteServer = dspConnection
    Left = 168
    Top = 16
  end
  object dspConnection: TDSProviderConnection
    ServerClassName = 'TsrvMethods'
    SQLConnection = cntData
    Left = 96
    Top = 16
  end
  object LocationSensor: TLocationSensor
    Active = True
    OnLocationChanged = LocationSensorLocationChanged
    Left = 96
    Top = 64
  end
end
