unit view.scannercode;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfScannerCode = class(TForm)
    lytScannerCode: TLayout;
    rctBackground: TRectangle;
    lytHeader: TLayout;
    rctHeader: TRectangle;
    lbTitleHeader: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fScannerCode: TfScannerCode;

implementation

{$R *.fmx}

end.
