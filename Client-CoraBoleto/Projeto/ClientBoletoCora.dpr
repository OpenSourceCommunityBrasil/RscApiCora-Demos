program ClientBoletoCora;

uses
  Vcl.Forms,
  uFrmPrincipal in '..\Source\View\FormPrincipal\uFrmPrincipal.pas' {FrmPrincipal};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown :=  True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
