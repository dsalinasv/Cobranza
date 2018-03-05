object dmData: TdmData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 399
  Width = 474
  object dspConnection: TDSProviderConnection
    ServerClassName = 'TsrvMethods'
    Connected = True
    SQLConnection = cntData
    Left = 96
    Top = 16
  end
  object cntData: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'HostName=localhost'
      'port=111')
    Connected = True
    Left = 24
    Top = 16
  end
  object cdsArticulos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspArticulos'
    RemoteServer = dspConnection
    Left = 24
    Top = 64
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    RemoteServer = dspConnection
    Left = 96
    Top = 64
  end
  object dsArticulos: TDataSource
    DataSet = cdsArticulos
    Left = 24
    Top = 112
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 96
    Top = 112
  end
  object cdsVentas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'FOLIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspVentas'
    RemoteServer = dspConnection
    AfterInsert = cdsVentasAfterInsert
    Left = 240
    Top = 64
    object cdsVentasID_VENTAS: TStringField
      FieldName = 'ID_VENTAS'
      Origin = 'ID_VENTAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object cdsVentasID_CLIENTES: TStringField
      FieldName = 'ID_CLIENTES'
      Origin = 'ID_CLIENTES'
      Size = 38
    end
    object cdsVentasFOLIO: TIntegerField
      FieldName = 'FOLIO'
      Origin = 'FOLIO'
    end
    object cdsVentasFECHA_VENTA: TSQLTimeStampField
      FieldName = 'FECHA_VENTA'
      Origin = 'FECHA_VENTA'
    end
    object cdsVentasqryVentasDetalles: TDataSetField
      FieldName = 'qryVentasDetalles'
    end
  end
  object dsVentas: TDataSource
    DataSet = cdsVentas
    Left = 240
    Top = 112
  end
  object dsEstados: TDataSource
    DataSet = cdsEstados
    Left = 168
    Top = 112
  end
  object cdsEstados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstados'
    RemoteServer = dspConnection
    Left = 168
    Top = 64
  end
  object cdsVentas_Detalles: TClientDataSet
    Aggregates = <>
    DataSetField = cdsVentasqryVentasDetalles
    PacketRecords = 0
    Params = <>
    Left = 320
    Top = 64
  end
  object dsVentasDetalles: TDataSource
    DataSet = cdsVentas_Detalles
    Left = 320
    Top = 112
  end
  object cdsGeneral: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select folio,fecha_venta, sum(d.precio) venta from ventas v left' +
      ' join ventas_detalles d on v.id_ventas = d.id_ventas group by fo' +
      'lio,fecha_venta'
    Params = <>
    ProviderName = 'dspGeneral'
    RemoteServer = dspConnection
    Left = 168
    Top = 16
  end
  object frxUtilidad: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43091.591314710600000000
    ReportOptions.LastChange = 43091.591314710600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 24
    Top = 232
    Datasets = <
      item
        DataSet = dbdUtilidad
        DataSetName = 'Utilidades'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte de utilidades por cliente')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 68.031540000000010000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Width = 740.787401570000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 63.638498270000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'NUMERO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 63.638498270000000000
          Width = 64.865402120000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'NOMBRE')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          Left = 154.960610390000000000
          Width = 142.434763540000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'APELLIDO PATERNO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          Left = 297.395373930000000000
          Width = 148.153527580000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'APELLIDO MATERNO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          Left = 445.548901510000000000
          Width = 54.199614920000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'COSTO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          Left = 499.748516430000000000
          Width = 65.835019140000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CREDITO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          Left = 565.583535570000000000
          Width = 54.199614920000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'PAGOS')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          Left = 619.783150500000000000
          Width = 53.229997910000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'DEUDA')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          Left = 673.013148400000000000
          Width = 67.774253170000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'UTILIDAD')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        DataSet = dbdUtilidad
        DataSetName = 'Utilidades'
        RowCount = 0
        object Memo12: TfrxMemoView
          Width = 63.638498270000000000
          Height = 18.897650000000000000
          DataField = 'NUMERO_CLIENTE'
          DataSet = dbdUtilidad
          DataSetName = 'Utilidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Utilidades."NUMERO_CLIENTE"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          Left = 63.638498270000000000
          Width = 91.322112120000000000
          Height = 18.897650000000000000
          DataField = 'NOMBRE'
          DataSet = dbdUtilidad
          DataSetName = 'Utilidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Utilidades."NOMBRE"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          Left = 154.960610390000000000
          Width = 142.434763540000000000
          Height = 18.897650000000000000
          DataField = 'APELLIDO_PATERNO'
          DataSet = dbdUtilidad
          DataSetName = 'Utilidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Utilidades."APELLIDO_PATERNO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo15: TfrxMemoView
          Left = 297.395373930000000000
          Width = 148.153527580000000000
          Height = 18.897650000000000000
          DataField = 'APELLIDO_MATERNO'
          DataSet = dbdUtilidad
          DataSetName = 'Utilidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Utilidades."APELLIDO_MATERNO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo16: TfrxMemoView
          Left = 445.548901510000000000
          Width = 54.199614920000000000
          Height = 18.897650000000000000
          DataField = 'COSTO'
          DataSet = dbdUtilidad
          DataSetName = 'Utilidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Utilidades."COSTO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo17: TfrxMemoView
          Left = 499.748516430000000000
          Width = 65.835019140000000000
          Height = 18.897650000000000000
          DataField = 'CREDITO'
          DataSet = dbdUtilidad
          DataSetName = 'Utilidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Utilidades."CREDITO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo18: TfrxMemoView
          Left = 565.583535570000000000
          Width = 54.199614920000000000
          Height = 18.897650000000000000
          DataField = 'PAGOS'
          DataSet = dbdUtilidad
          DataSetName = 'Utilidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Utilidades."PAGOS"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo19: TfrxMemoView
          Left = 619.783150500000000000
          Width = 53.229997910000000000
          Height = 18.897650000000000000
          DataField = 'DEUDA'
          DataSet = dbdUtilidad
          DataSetName = 'Utilidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Utilidades."DEUDA"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo20: TfrxMemoView
          Left = 673.013148400000000000
          Width = 67.774253170000000000
          Height = 18.897650000000000000
          DataField = 'UTILIDAD'
          DataSet = dbdUtilidad
          DataSetName = 'Utilidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Utilidades."UTILIDAD"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 275.905690000000000000
        Width = 740.409927000000000000
        object Memo21: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo22: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo23: TfrxMemoView
          Align = baRight
          Left = 664.819327000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 230.551330000000000000
        Width = 740.409927000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 673.133858270000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[SUM(<Utilidades."UTILIDAD">,MasterData1)]')
        end
        object Memo24: TfrxMemoView
          Left = 393.071120000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Totales')
        end
        object SysMemo2: TfrxSysMemoView
          Left = 619.842519690000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[SUM(<Utilidades."DEUDA">,MasterData1)]')
        end
        object SysMemo3: TfrxSysMemoView
          Left = 565.417322830000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[SUM(<Utilidades."PAGOS">,MasterData1)]')
        end
        object SysMemo4: TfrxSysMemoView
          Left = 499.653543310000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[SUM(<Utilidades."CREDITO">,MasterData1)]')
        end
        object SysMemo5: TfrxSysMemoView
          Left = 445.606299210000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[SUM(<Utilidades."COSTO">,MasterData1)]')
        end
      end
    end
  end
  object dbdUtilidad: TfrxDBDataset
    UserName = 'Utilidades'
    CloseDataSource = False
    DataSet = cdsGeneral
    BCDToCurrency = False
    Left = 24
    Top = 184
  end
  object frxCobranza: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43091.622646261610000000
    ReportOptions.LastChange = 43091.659915335700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 96
    Top = 232
    Datasets = <
      item
        DataSet = dbdCobranza
        DataSetName = 'Cobranza'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte de cobranza del d'#237'a')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 68.031540000000010000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Width = 740.787401570000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Left = 79.370130000000000000
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'PAGO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo12: TfrxMemoView
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'FECHA')
          ParentFont = False
          Style = 'Header'
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        Condition = 'Cobranza."NUMERO_CLIENTE"'
        object Memo4: TfrxMemoView
          Width = 60.094527000000000000
          Height = 22.677180000000000000
          DataField = 'NUMERO_CLIENTE'
          DataSet = dbdCobranza
          DataSetName = 'Cobranza'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            '[Cobranza."NUMERO_CLIENTE"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 60.472480000000000000
          Width = 226.771653540000000000
          Height = 22.677180000000000000
          DataField = 'NOMBRE'
          DataSet = dbdCobranza
          DataSetName = 'Cobranza'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            '[Cobranza."NOMBRE"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 286.866327000000000000
          Width = 226.771653540000000000
          Height = 22.677180000000000000
          DataField = 'APELLIDO_PATERNO'
          DataSet = dbdCobranza
          DataSetName = 'Cobranza'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            '[Cobranza."APELLIDO_PATERNO"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 514.016080000000000000
          Width = 226.771653540000000000
          Height = 22.677180000000000000
          DataField = 'APELLIDO_MATERNO'
          DataSet = dbdCobranza
          DataSetName = 'Cobranza'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            '[Cobranza."APELLIDO_MATERNO"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 200.315090000000000000
        Width = 740.409927000000000000
        DataSet = dbdCobranza
        DataSetName = 'Cobranza'
        RowCount = 0
        object Memo8: TfrxMemoView
          Left = 79.370130000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'PAGO'
          DataSet = dbdCobranza
          DataSetName = 'Cobranza'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Cobranza."PAGO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'FECHA_ABONO'
          DataSet = dbdCobranza
          DataSetName = 'Cobranza'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Cobranza."FECHA_ABONO"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Top = 241.889920000000000000
        Width = 740.409927000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 347.716760000000000000
        Width = 740.409927000000000000
        object Memo9: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo10: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo11: TfrxMemoView
          Align = baRight
          Left = 664.819327000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 302.362400000000000000
        Width = 740.409927000000000000
        object Memo14: TfrxMemoView
          Left = 642.520100000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[SUM(<Cobranza."PAGO">,MasterData1)]')
        end
        object Memo15: TfrxMemoView
          Left = 544.252320000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Cobranza total')
        end
      end
    end
  end
  object dbdCobranza: TfrxDBDataset
    UserName = 'Cobranza'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NUMERO_CLIENTE=NUMERO_CLIENTE'
      'NOMBRE=NOMBRE'
      'APELLIDO_PATERNO=APELLIDO_PATERNO'
      'APELLIDO_MATERNO=APELLIDO_MATERNO'
      'FECHA_ABONO=FECHA_ABONO'
      'PAGO=PAGO')
    DataSet = cdsGeneral
    BCDToCurrency = False
    Left = 96
    Top = 184
  end
  object frxVentas: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43091.668282673600000000
    ReportOptions.LastChange = 43091.668282673600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 168
    Top = 232
    Datasets = <
      item
        DataSet = dbdVentas
        DataSetName = 'Ventas'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Reporte de ventas del d'#237'a')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 68.031540000000010000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Width = 740.787401574802900000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'FOLIO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 78.000000000000000000
          Width = 254.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'FECHA')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          Left = 332.000000000000000000
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'VENTA')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        DataSet = dbdVentas
        DataSetName = 'Ventas'
        RowCount = 0
        object Memo6: TfrxMemoView
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'FOLIO'
          DataSet = dbdVentas
          DataSetName = 'Ventas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Ventas."FOLIO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo7: TfrxMemoView
          Left = 78.000000000000000000
          Width = 254.000000000000000000
          Height = 18.897650000000000000
          DataField = 'FECHA_VENTA'
          DataSet = dbdVentas
          DataSetName = 'Ventas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Ventas."FECHA_VENTA"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          Left = 332.000000000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'VENTA'
          DataSet = dbdVentas
          DataSetName = 'Ventas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Ventas."VENTA"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 275.905690000000000000
        Width = 740.409927000000000000
        object Memo9: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo10: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo11: TfrxMemoView
          Align = baRight
          Left = 664.819327000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 230.551330000000000000
        Width = 740.409927000000000000
        object Memo12: TfrxMemoView
          Left = 646.299630000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[SUM(<Ventas."VENTA">,MasterData1)]')
        end
        object Memo13: TfrxMemoView
          Left = 551.811380000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Total de ventas')
        end
      end
    end
  end
  object dbdVentas: TfrxDBDataset
    UserName = 'Ventas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FOLIO=FOLIO'
      'FECHA_VENTA=FECHA_VENTA'
      'VENTA=VENTA')
    DataSet = cdsGeneral
    BCDToCurrency = False
    Left = 168
    Top = 184
  end
  object Timer: TTimer
    Interval = 100000
    OnTimer = TimerTimer
    Left = 240
    Top = 16
  end
  object ssmEcho: TSqlServerMethod
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'Value'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 2000
      end>
    SQLConnection = cntData
    ServerMethodName = 'TsrvMethods.EchoString'
    Left = 320
    Top = 16
  end
end
