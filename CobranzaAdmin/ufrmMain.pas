unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus, dxRibbonForm,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxRibbonCustomizationForm, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxDBLookupComboBox,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxGroupBox, cxLabel, cxDBLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxBevel, dxBar, dxRibbon, dxBarBuiltInMenu, cxPC;

type
  TfrmMain = class(TdxRibbonForm)
    ActionList: TActionList;
    actArticulos: TAction;
    actClientes: TAction;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    BarManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarManager1Bar2: TdxBar;
    dxBarLargeButton3: TdxBarLargeButton;
    actNuevo: TAction;
    dxBarLargeButton4: TdxBarLargeButton;
    actGuardar: TAction;
    dxBarLargeButton5: TdxBarLargeButton;
    actConsultar: TAction;
    cxPageControl1: TcxPageControl;
    tabVentas: TcxTabSheet;
    grdData: TcxGrid;
    grdDataDBTableView1: TcxGridDBTableView;
    grdDataLevel1: TcxGridLevel;
    lblFecha: TcxDBLabel;
    cxLabel5: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cmbClientes: TcxDBLookupComboBox;
    cxDBLabel1: TcxDBLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBLabel2: TcxDBLabel;
    cxLabel4: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    BarManagerBar1: TdxBar;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    grdDataDBTableView1ID_ARTICULOS: TcxGridDBColumn;
    grdDataDBTableView1COSTO: TcxGridDBColumn;
    grdDataDBTableView1PRECIO: TcxGridDBColumn;
    grdDataDBTableView1Column1: TcxGridDBColumn;
    actUtilidad: TAction;
    actAbonos: TAction;
    actVentas: TAction;
    procedure actExecute(Sender: TObject);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGuardarExecute(Sender: TObject);
    procedure grdDataDBTableView1ID_ARTICULOSPropertiesEditValueChanged(
      Sender: TObject);
    procedure cmbClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actNuevoUpdate(Sender: TObject);
    procedure actGuardarUpdate(Sender: TObject);
    procedure cmbClientesExit(Sender: TObject);
    procedure actConsultarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actConsultarUpdate(Sender: TObject);
    procedure actUtilidadExecute(Sender: TObject);
    procedure actAbonosExecute(Sender: TObject);
    procedure actVentasExecute(Sender: TObject);
  private
    { Private declarations }
    Consulta: Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses udmData, DateUtils, cxLookupDBGrid;

procedure TfrmMain.actAbonosExecute(Sender: TObject);
var
  Fecha: TDate;
begin
  Fecha:= StrToDate(InputBox('Captura', 'Fecha',
    FormatDateTime('dd/mm/yyyy', Date)));
  dmData.ReportarCobranza(Fecha, IncDay(Fecha));
end;

procedure TfrmMain.actConsultarExecute(Sender: TObject);
begin
  Consulta:= True;
  with dmData do
  begin
    cdsVentas.Close;
    cdsVentas.ParamByName('FOLIO').Value:= InputBox('Captura', 'Folio de la venta', EmptyStr);
    cdsVentas.Open;
    if cdsVentas.IsEmpty then
      actNuevo.Execute
    else
      tabVentas.Enabled:= False;
  end;
end;

procedure TfrmMain.actConsultarUpdate(Sender: TObject);
begin
  actConsultar.Enabled:= not dmData.cdsVentas.Active or Consulta;
end;

procedure TfrmMain.actExecute(Sender: TObject);
var
  sForma: String;
  FormClass: TFormClass;
begin
  sForma:= StringReplace(TAction(Sender).Name, 'act', 'frm', []);
  FormClass:= TFormClass(GetClass('T' + sForma));
  if Assigned(FormClass) then
    with FormClass.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.actGuardarExecute(Sender: TObject);
begin
  with dmData do
  begin
    cdsVentasFOLIO.Value:= dmData.GetFolio;
    cdsVentas.ApplyUpdates(0);
    cdsVentas.Close;
    tabVentas.Enabled:= False;
  end;
end;

procedure TfrmMain.actGuardarUpdate(Sender: TObject);
begin
  actGuardar.Enabled:= not dmData.cdsVentas_Detalles.IsEmpty and not Consulta;
end;

procedure TfrmMain.actNuevoExecute(Sender: TObject);
begin
  Consulta:= False;
  with dmData do
  begin
    cdsVentas.Open;
    cdsVentas.Append;
    tabVentas.Enabled:= True;
    cmbClientes.SetFocus;
  end;
end;

procedure TfrmMain.actNuevoUpdate(Sender: TObject);
begin
  actNuevo.Enabled:= dmData.cdsVentasFECHA_VENTA.IsNull or Consulta;
end;

procedure TfrmMain.actUtilidadExecute(Sender: TObject);
begin
  dmData.ReportarUtilidades;
end;

procedure TfrmMain.actVentasExecute(Sender: TObject);
var
  Fecha: TDate;
begin
  Fecha:= StrToDate(InputBox('Captura', 'Fecha',
    FormatDateTime('dd/mm/yyyy', Date)));
  dmData.ReportarVentas(Fecha, IncDay(Fecha));
end;

procedure TfrmMain.cmbClientesExit(Sender: TObject);
begin
  dmData.cdsVentas_Detalles.Append;
end;

procedure TfrmMain.cmbClientesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    grdData.SetFocus;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Consulta:= False;
end;

procedure TfrmMain.grdDataDBTableView1ID_ARTICULOSPropertiesEditValueChanged(
  Sender: TObject);
var
  Combo: TcxLookupComboBox;
  Data: TcxLookupGridDBDataController;
begin
  Combo:= (Sender as TcxLookupComboBox);
  Combo.PostEditValue;
  Data:= combo.Properties.Grid.DataController;
  with dmData do
  begin
    cdsVentas_Detalles.Edit;
    cdsVentas_Detalles.FieldByName('COSTO').Value:=
      Data.Values[Combo.ItemIndex, 1];
    cdsVentas_Detalles.FieldByName('PRECIO').Value:=
      Data.Values[Combo.ItemIndex, 2];
  end;
end;

end.
