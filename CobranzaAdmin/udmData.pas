unit udmData;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.SqlExpr, Data.DB, Datasnap.DBClient, Datasnap.DSConnect,
  frxClass, frxDBSet, Data.FMTBcd, Vcl.ExtCtrls;

type
  TdmData = class(TDataModule)
    dspConnection: TDSProviderConnection;
    cntData: TSQLConnection;
    cdsArticulos: TClientDataSet;
    cdsClientes: TClientDataSet;
    dsArticulos: TDataSource;
    dsClientes: TDataSource;
    cdsVentas: TClientDataSet;
    dsVentas: TDataSource;
    dsEstados: TDataSource;
    cdsEstados: TClientDataSet;
    cdsVentas_Detalles: TClientDataSet;
    dsVentasDetalles: TDataSource;
    cdsVentasID_VENTAS: TStringField;
    cdsVentasID_CLIENTES: TStringField;
    cdsVentasFECHA_VENTA: TSQLTimeStampField;
    cdsVentasqryVentasDetalles: TDataSetField;
    cdsVentasFOLIO: TIntegerField;
    cdsGeneral: TClientDataSet;
    frxUtilidad: TfrxReport;
    dbdUtilidad: TfrxDBDataset;
    frxCobranza: TfrxReport;
    dbdCobranza: TfrxDBDataset;
    frxVentas: TfrxReport;
    dbdVentas: TfrxDBDataset;
    Timer: TTimer;
    ssmEcho: TSqlServerMethod;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsVentasAfterInsert(DataSet: TDataSet);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    procedure AsignarEventos;
    function GetId: String;
    procedure cdsAfterPost(DataSet: TDataSet);
    procedure cdsNewRecord(DataSet: TDataSet);
  public
    { Public declarations }
    function GetFolio: Integer;
    procedure ReportarCobranza(FechaIni, FechaFin: TDate);
    procedure ReportarUtilidades;
    procedure ReportarVentas(FechaIni, FechaFin: TDate);
  end;

var
  dmData: TdmData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Dialogs;

{$R *.dfm}

function TdmData.GetFolio: Integer;
begin
  cdsGeneral.Close;
  cdsGeneral.CommandText:= 'select max(coalesce(folio,0)) as folio from ventas';
  cdsGeneral.Open;
  Exit(cdsGeneral.FieldByName('FOLIO').AsInteger + 1);
end;

function TdmData.GetId: String;
var
  Guid : TGuid;
begin
  CreateGuid(Guid);
  Exit(GuidToString(Guid))
end;

procedure TdmData.ReportarCobranza(FechaIni, FechaFin: TDate);
begin
  with cdsGeneral do
  begin
    Close;
    CommandText:=
      'select c.numero_cliente, c.nombre, c.apellido_paterno, ' +
      '  c.apellido_materno, fecha_abono, pago ' +
      'from abonos a left join clientes c on a.id_clientes = c.id_clientes ' +
      'where fecha_abono between :fecha_ini and :fecha_fin';
    ParamByName('FECHA_INI').AsDate:= FechaIni;
    ParamByName('FECHA_FIN').AsDate:= FechaFin;
    Open;
  end;
  if frxCobranza.PrepareReport then
    frxCobranza.ShowPreparedReport;
end;

procedure TdmData.ReportarUtilidades;
begin
  with cdsGeneral do
  begin
    Close;
    CommandText:=
      'select c.numero_cliente, c.nombre, c.apellido_paterno, ' +
      '  c.apellido_materno, v.costo, v.credito, a.pagos, ' +
      '  v.credito-a.pagos deuda, a.pagos - v.costo utilidad ' +
      'from clientes c ' +
      '  left join (select id_clientes, sum(d.costo) costo, sum(d.precio) credito from ventas v ' +
      '    left join ventas_detalles d on v.id_ventas = d.id_ventas ' +
      '    group by id_clientes) v on v.id_clientes = c.id_clientes ' +
      '  left join (select id_clientes, sum(pago) pagos from abonos ' +
      '    group by id_clientes) a on c.id_clientes = a.id_clientes ';
    Open;
  end;
  if frxUtilidad.PrepareReport then
    frxUtilidad.ShowPreparedReport;
end;

procedure TdmData.ReportarVentas(FechaIni, FechaFin: TDate);
begin
  with cdsGeneral do
  begin
    Close;
    CommandText:=
      'select folio,fecha_venta, sum(d.precio) venta ' +
      'from ventas v left join ventas_detalles d on v.id_ventas = d.id_ventas ' +
      'where fecha_venta between :fecha_ini and :fecha_fin ' +
      'group by folio,fecha_venta';
    ParamByName('FECHA_INI').AsDate:= FechaIni;
    ParamByName('FECHA_FIN').AsDate:= FechaFin;
    Open;
  end;
  if frxVentas.PrepareReport then
    frxVentas.ShowPreparedReport;
end;

procedure TdmData.TimerTimer(Sender: TObject);
begin
  ssmEcho.ExecuteMethod
end;

procedure TdmData.cdsAfterPost(DataSet: TDataSet);
begin
  with (DataSet as TClientDataSet) do
    if not Assigned(DataSetField) then
      ApplyUpdates(0);
end;

procedure TdmData.cdsNewRecord(DataSet: TDataSet);
begin
  with (DataSet as TClientDataSet) do
    FieldByName(StringReplace(DataSet.Name, 'cds', 'ID_', [])).AsString := GetId;
end;

procedure TdmData.cdsVentasAfterInsert(DataSet: TDataSet);
begin
  cdsVentasFECHA_VENTA.AsDateTime:= Now;
end;

procedure TdmData.DataModuleCreate(Sender: TObject);
begin
  AsignarEventos;
  cdsArticulos.Open;
  cdsClientes.Open;
  cdsEstados.Open;
  cdsVentas.Open;
  cdsVentas.Append;
end;

procedure TdmData.AsignarEventos;
var
  i: integer;
begin
  for i:= 0 to Pred(ComponentCount) do
    if Components[i] is TClientDataset then
      with (Components[i] as TClientDataSet) do
      begin
        AfterDelete:= cdsAfterPost;
//        AfterPost:= cdsAfterPost;
        OnNewRecord:= cdsNewRecord;
      end;
end;

end.
