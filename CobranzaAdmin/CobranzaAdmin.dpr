program CobranzaAdmin;

uses
  Vcl.Forms,
  MidasLib,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  udmData in 'udmData.pas' {dmData: TDataModule},
  ufrmList in 'Shared\ufrmList.pas' {frmList},
  ufrmArticulos in 'Lists\ufrmArticulos.pas' {frmArticulos},
  ufrmClientes in 'Lists\ufrmClientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.Run;
end.
