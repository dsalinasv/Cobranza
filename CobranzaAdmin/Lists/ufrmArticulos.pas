unit ufrmArticulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBNavigator, Vcl.ExtCtrls, dxStatusBar,
  cxTextEdit, dxRibbonSkins, dxRibbonCustomizationForm, Vcl.DBClientActns,
  Vcl.DBActns, System.Actions, Vcl.ActnList, dxBar, dxRibbon;

type
  TfrmArticulos = class(TfrmList)
    grdDataDBTableView1CODIGO: TcxGridDBColumn;
    grdDataDBTableView1NOMBRE: TcxGridDBColumn;
    grdDataDBTableView1COSTO: TcxGridDBColumn;
    grdDataDBTableView1PRECIO: TcxGridDBColumn;
    grdDataDBTableView1EXISTENCIA: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArticulos: TfrmArticulos;

implementation

{$R *.dfm}

uses udmData;

initialization
  RegisterClass(TfrmArticulos);

end.
