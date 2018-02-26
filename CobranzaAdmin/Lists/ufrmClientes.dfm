inherited frmClientes: TfrmClientes
  Caption = 'Clientes'
  ExplicitWidth = 749
  ExplicitHeight = 330
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdData: TcxGrid
    ExplicitTop = 122
    ExplicitHeight = 150
    inherited grdDataDBTableView1: TcxGridDBTableView
      DataController.DataSource = dmData.dsClientes
      object grdDataDBTableView1NUMERO_CLIENTE: TcxGridDBColumn
        Caption = 'N'#218'MERO'
        DataBinding.FieldName = 'NUMERO_CLIENTE'
      end
      object grdDataDBTableView1NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'NOMBRE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object grdDataDBTableView1APELLIDO_PATERNO: TcxGridDBColumn
        Caption = 'APELLIDO PATERNO'
        DataBinding.FieldName = 'APELLIDO_PATERNO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object grdDataDBTableView1APELLIDO_MATERNO: TcxGridDBColumn
        Caption = 'APELLIDO MATERNO'
        DataBinding.FieldName = 'APELLIDO_MATERNO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object grdDataDBTableView1TELEFONO: TcxGridDBColumn
        DataBinding.FieldName = 'TELEFONO'
      end
      object grdDataDBTableView1CELULAR: TcxGridDBColumn
        DataBinding.FieldName = 'CELULAR'
      end
      object grdDataDBTableView1CALLE: TcxGridDBColumn
        DataBinding.FieldName = 'CALLE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object grdDataDBTableView1NUMERO_EXTERIOR: TcxGridDBColumn
        Caption = 'NUMERO EXTERIOR'
        DataBinding.FieldName = 'NUMERO_EXTERIOR'
      end
      object grdDataDBTableView1NUMERO_INTERIOR: TcxGridDBColumn
        Caption = 'NUMERO INTERIOR'
        DataBinding.FieldName = 'NUMERO_INTERIOR'
      end
      object grdDataDBTableView1COLONIA: TcxGridDBColumn
        DataBinding.FieldName = 'COLONIA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object grdDataDBTableView1LOCALIDAD: TcxGridDBColumn
        DataBinding.FieldName = 'LOCALIDAD'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object grdDataDBTableView1REFERENCIA: TcxGridDBColumn
        DataBinding.FieldName = 'REFERENCIA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object grdDataDBTableView1MUNICIPIO: TcxGridDBColumn
        DataBinding.FieldName = 'MUNICIPIO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object grdDataDBTableView1ID_ESTADOS: TcxGridDBColumn
        Caption = 'ESTADO'
        DataBinding.FieldName = 'ID_ESTADOS'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.CharCase = ecUpperCase
        Properties.KeyFieldNames = 'ID_ESTADOS'
        Properties.ListColumns = <
          item
            FieldName = 'NOMBRE'
          end>
        Properties.ListSource = dmData.dsEstados
      end
      object grdDataDBTableView1CODIGO_POSTAL: TcxGridDBColumn
        Caption = 'CODIGO POSTAL'
        DataBinding.FieldName = 'CODIGO_POSTAL'
      end
    end
  end
  inherited dxRibbon1: TdxRibbon
    inherited dxRibbon1Tab1: TdxRibbonTab
      Index = 0
    end
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarManagerBar1: TdxBar
      DockedDockControl = nil
      DockedDockingStyle = dsNone
      FloatClientWidth = 59
      FloatClientHeight = 162
    end
  end
  inherited ActionList: TActionList
    inherited actInsert: TDataSetInsert
      DataSource = dmData.dsClientes
    end
    inherited actDelete: TDataSetDelete
      DataSource = dmData.dsClientes
    end
    inherited DatasetClientDataSetApply1: TClientDataSetApply
      DataSource = dmData.dsClientes
    end
  end
end
