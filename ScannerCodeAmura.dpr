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
  model.contagem_item in 'src\model\entity\model.contagem_item.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TfHome, fHome);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
