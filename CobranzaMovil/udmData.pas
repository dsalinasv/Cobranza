unit udmData;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Datasnap.DBClient, Datasnap.DSConnect, Data.DB, Data.SqlExpr,
  System.Sensors, System.Sensors.Components;

type
  TdmData = class(TDataModule)
    cntData: TSQLConnection;
    cdsGeneral: TClientDataSet;
    dspConnection: TDSProviderConnection;
    LocationSensor: TLocationSensor;
    procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
  private
    { Private declarations }
    Latitud: Double;
    Longitud: Double;
    function GetId: String;
  public
    { Public declarations }
    procedure Abonar(Cantidad: Double; idCliente: String);
    function ConsultarAbonos(idCliente: String; var Abonos: Double): String;
    function ConsultarCliente(Numero: String; var idCliente: String;
      var Nombre: String; var Credito: Double): Boolean;
  end;

var
  dmData: TdmData;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function TdmData.GetId: String;
var
  Guid : TGuid;
begin
  CreateGuid(Guid);
  Exit(GuidToString(Guid))
end;

procedure TdmData.LocationSensorLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
  Latitud:= NewLocation.Latitude;
  Longitud:= NewLocation.Longitude;
end;

procedure TdmData.Abonar(Cantidad: Double; idCliente: String);
begin
  with cdsGeneral do
  begin
    Close;
    CommandText:= 'insert into abonos values (:id_abonos, :fecha_abono, :pago, :id_clientes, :latitud, :longitud)';
    ParamByName('ID_ABONOS').AsString:= GetId;
    ParamByName('FECHA_ABONO').AsDateTime:= Now;
    ParamByName('PAGO').AsFloat:= Cantidad;
    ParamByName('ID_CLIENTES').AsString:= idCliente;
    ParamByName('LATITUD').AsFloat:= Latitud;
    ParamByName('LONGITUD').AsFloat:= Longitud;
    Execute;
  end;
end;

function TdmData.ConsultarAbonos(idCliente: String; var Abonos: Double): String;
begin
  with cdsGeneral do
  begin
    Close;
    CommandText:= 'select fecha_abono, pago from abonos where id_clientes = :id_clientes';
    ParamByName('ID_CLIENTES').AsString:= idCliente;
    Open;
    while not Eof do
    begin
      Abonos:= Abonos + FieldByName('PAGO').AsFloat;
      Result:= Result + 'Fecha: ' + FieldByName('FECHA_ABONO').AsString +
        ' Abono: ' + FieldByName('PAGO').AsString + sLineBreak;
      Next;
    end;
  end;
end;

function TdmData.ConsultarCliente(Numero: String; var idCliente: String;
  var Nombre: String; var Credito: Double): Boolean;
begin
  with cdsGeneral do
  begin
    Close;
    CommandText:= 'select id_clientes, nombre, apellido_paterno, apellido_materno ' +
      'from clientes where numero_cliente = :numero_cliente';
    ParamByName('NUMERO_CLIENTE').AsInteger:= StrToInt(Numero);
    Open;
    if IsEmpty then
      Exit(False);
    idCliente:= FieldByName('ID_CLIENTES').AsString;
    Nombre:= FieldByName('NOMBRE').AsString + ' ' +
      FieldByName('APELLIDO_PATERNO').AsString  + ' ' +
      FieldByName('APELLIDO_MATERNO').AsString;
    Close;
    CommandText:= 'select sum(vd.precio) as credito from ventas v ' +
      'join ventas_detalles vd on v.id_ventas = vd.id_ventas ' +
      'where v.id_clientes = :id_clientes';
    ParamByName('ID_CLIENTES').AsString:= idCliente;
    Open;
    if IsEmpty then
      Exit(False);
    Credito:= FieldByName('CREDITO').AsFloat;
    Exit(True);
  end;
end;

end.
