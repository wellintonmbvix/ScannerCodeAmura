program ScannerCodeAmura;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.principal in 'src\views\view.principal.pas' {fPrincipal},
  view.home in 'src\views\pages\view.home.pas' {fHome},
  uLoading in 'src\utils\uLoading.pas',
  uCombobox in 'src\utils\uCombobox.pas',
  uNotificacao in 'src\utils\uNotificacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TfHome, fHome);
  Application.Run;
end.
