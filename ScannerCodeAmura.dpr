program ScannerCodeAmura;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.principal in 'src\views\view.principal.pas' {fPrincipal},
  view.home in 'src\views\pages\view.home.pas' {fHome},
  uLoading in 'src\utils\uLoading.pas',
  uCombobox in 'src\utils\uCombobox.pas',
  uNotificacao in 'src\utils\uNotificacao.pas',
  uDM in 'src\model\dao\uDM.pas' {DM: TDataModule},
  model.configuracao in 'src\model\entity\model.configuracao.pas',
  model.setor in 'src\model\entity\model.setor.pas',
  model.lista in 'src\model\entity\model.lista.pas',
  model.contagem_cab in 'src\model\entity\model.contagem_cab.pas',
  model.contagem_item in 'src\model\entity\model.contagem_item.pas',
  view.scannercode in 'src\views\pages\view.scannercode.pas' {fScannerCode},
  model.configuracao.service in 'src\model\service\model.configuracao.service.pas',
  model.setor.service in 'src\model\service\model.setor.service.pas',
  model.lista.service in 'src\model\service\model.lista.service.pas',
  model.contagem.service in 'src\model\service\model.contagem.service.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TfHome, fHome);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfScannerCode, fScannerCode);
  Application.Run;
end.
