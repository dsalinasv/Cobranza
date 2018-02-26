unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.EditBox, FMX.NumberBox,
  FMX.ListBox, System.Actions, FMX.ActnList;

type
  TfrmMain = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    lblNumero: TLabel;
    Layout1: TLayout;
    edtNumero: TEdit;
    btnConsultar: TCornerButton;
    Layout2: TLayout;
    lblNombre: TLabel;
    Layout3: TLayout;
    lblDeuda: TLabel;
    lstAbonos: TListBox;
    Layout4: TLayout;
    btnCancelar: TCornerButton;
    btnAbonar: TCornerButton;
    Label1: TLabel;
    Label2: TLabel;
    Layout5: TLayout;
    Label4: TLabel;
    numCantidad: TNumberBox;
    ActionList: TActionList;
    actCancelar: TAction;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAbonarClick(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    { Private declarations }
    sidCliente: String;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses udmData;

procedure TfrmMain.actCancelarExecute(Sender: TObject);
begin
  edtNumero.Text:= EmptyStr;
  lblNombre.Text:= EmptyStr;
  lblDeuda.Text:= EmptyStr;
  numCantidad.Value:= 0;
  lstAbonos.Clear;
  btnAbonar.Enabled:= False;
end;

procedure TfrmMain.btnAbonarClick(Sender: TObject);
begin
  dmData.Abonar(numCantidad.Value, sidCliente);
  actCancelar.Execute;
end;

procedure TfrmMain.btnConsultarClick(Sender: TObject);
var
  sNombre: String;
  dCredito: Double;
  dAbonos: Double;
begin
  btnAbonar.Enabled:= False;
  if edtNumero.Text.IsEmpty then
    ShowMessage('Introduce el número del cliente')
  else
  begin
    if dmData.ConsultarCliente(edtNumero.Text, sidCliente, sNombre, dCredito) then
    begin
      lstAbonos.Items.Text:= dmData.ConsultarAbonos(sidCliente, dAbonos);
      lblNombre.Text:= sNombre;
      lblDeuda.Text:= FormatFloat('$#,##0.00', dCredito - dAbonos);
      btnAbonar.Enabled:= True;
    end
    else
      actCancelar.Execute;
  end;
end;

end.
