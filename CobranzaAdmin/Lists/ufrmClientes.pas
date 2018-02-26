unit ufrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBNavigator, Vcl.ExtCtrls, dxStatusBar,
  cxDBLookupComboBox, cxTextEdit, dxRibbonSkins, dxRibbonCustomizationForm,
  Vcl.DBClientActns, Vcl.DBActns, System.Actions, Vcl.ActnList, dxBar, dxRibbon;

type
  TfrmClientes = class(TfrmList)
    grdDataDBTableView1NUMERO_CLIENTE: TcxGridDBColumn;
    grdDataDBTableView1NOMBRE: TcxGridDBColumn;
    grdDataDBTableView1APELLIDO_PATERNO: TcxGridDBColumn;
    grdDataDBTableView1APELLIDO_MATERNO: TcxGridDBColumn;
    grdDataDBTableView1TELEFONO: TcxGridDBColumn;
    grdDataDBTableView1CELULAR: TcxGridDBColumn;
    grdDataDBTableView1CALLE: TcxGridDBColumn;
    grdDataDBTableView1NUMERO_EXTERIOR: TcxGridDBColumn;
    grdDataDBTableView1NUMERO_INTERIOR: TcxGridDBColumn;
    grdDataDBTableView1COLONIA: TcxGridDBColumn;
    grdDataDBTableView1LOCALIDAD: TcxGridDBColumn;
    grdDataDBTableView1REFERENCIA: TcxGridDBColumn;
    grdDataDBTableView1MUNICIPIO: TcxGridDBColumn;
    grdDataDBTableView1ID_ESTADOS: TcxGridDBColumn;
    grdDataDBTableView1CODIGO_POSTAL: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses udmData;

initialization
  RegisterClass(TfrmClientes);

end.
