unit ufrmList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBNavigator, dxStatusBar, dxRibbonSkins,
  dxRibbonCustomizationForm, dxBar, Vcl.DBClientActns, Vcl.DBActns,
  System.Actions, Vcl.ActnList, dxRibbon;

type
  TfrmList = class(TForm)
    sbData: TdxStatusBar;
    grdDataDBTableView1: TcxGridDBTableView;
    grdDataLevel1: TcxGridLevel;
    grdData: TcxGrid;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    BarManager: TdxBarManager;
    BarManagerBar1: TdxBar;
    ActionList: TActionList;
    actInsert: TDataSetInsert;
    actDelete: TDataSetDelete;
    DatasetClientDataSetApply1: TClientDataSetApply;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmList: TfrmList;

implementation

{$R *.dfm}

end.
