inherited frmArticulos: TfrmArticulos
  Caption = 'Art'#237'culos'
  ExplicitWidth = 749
  ExplicitHeight = 330
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdData: TcxGrid
    ExplicitTop = 122
    ExplicitHeight = 150
    inherited grdDataDBTableView1: TcxGridDBTableView
      DataController.DataSource = dmData.dsArticulos
      object grdDataDBTableView1CODIGO: TcxGridDBColumn
        Caption = 'C'#211'DIGO'
        DataBinding.FieldName = 'CODIGO'
      end
      object grdDataDBTableView1NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'NOMBRE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object grdDataDBTableView1COSTO: TcxGridDBColumn
        DataBinding.FieldName = 'COSTO'
      end
      object grdDataDBTableView1PRECIO: TcxGridDBColumn
        DataBinding.FieldName = 'PRECIO'
      end
      object grdDataDBTableView1EXISTENCIA: TcxGridDBColumn
        DataBinding.FieldName = 'EXISTENCIA'
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
      DataSource = dmData.dsArticulos
    end
    inherited actDelete: TDataSetDelete
      DataSource = dmData.dsArticulos
    end
    inherited DatasetClientDataSetApply1: TClientDataSetApply
      DataSource = dmData.dsArticulos
    end
  end
end
