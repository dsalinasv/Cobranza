unit usrvContainer;

interface

uses System.SysUtils, System.Classes,
    Vcl.SvcMgr,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth;

type
  TCobranza = class(TService)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
  private
    { Private declarations }
  protected
    function DoStop: Boolean; override;
    function DoPause: Boolean; override;
    function DoContinue: Boolean; override;
    procedure DoInterrogate; override;
  public
    function GetServiceController: TServiceController; override;
  end;

var
  Cobranza: TCobranza;

implementation


{$R *.dfm}

uses
  Winapi.Windows,
  usrvMethods;

procedure TCobranza.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TsrvMethods;
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  Cobranza.Controller(CtrlCode);
end;

function TCobranza.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

function TCobranza.DoContinue: Boolean;
begin
  Result := inherited;
  DSServer1.Start;
end;

procedure TCobranza.DoInterrogate;
begin
  inherited;
end;

function TCobranza.DoPause: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

function TCobranza.DoStop: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

procedure TCobranza.ServiceStart(Sender: TService; var Started: Boolean);
begin
  DSServer1.Start;
end;
end.

