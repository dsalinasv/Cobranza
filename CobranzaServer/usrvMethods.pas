unit usrvMethods;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider;

type
  TsrvMethods = class(TDSServerModule)
    cntData: TFDConnection;
    qryClientes: TFDQuery;
    qryArticulos: TFDQuery;
    qryGeneral: TFDQuery;
    qryVentas: TFDQuery;
    qryVentasDetalles: TFDQuery;
    dsVentas: TDataSource;
    dspVentas: TDataSetProvider;
    dspArticulos: TDataSetProvider;
    dspClientes: TDataSetProvider;
    qryEstados: TFDQuery;
    dspEstados: TDataSetProvider;
    dspGeneral: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TsrvMethods.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TsrvMethods.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

