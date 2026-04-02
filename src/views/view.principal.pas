unit view.principal;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts;

type
  TfPrincipal = class(TForm)
    lytPrincipal: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure RegisterRouters;
  public
    { Public declarations }
    procedure Animation( aLayout : TFMXObject );
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  Router4D, view.home;

{$R *.fmx}

{ TfPrincipal }

procedure TfPrincipal.Animation(aLayout: TFMXObject);
begin
  TLayout(aLayout).Opacity := 0;
  TLayout(aLayout).AnimateFloat('Opacity', 1, 0.9);
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  RegisterRouters;
end;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
  TRouter4D.Render<TfHome>.SetElement(lytPrincipal, lytPrincipal);
  TRouter4D.Link.Animation(Animation);
end;

procedure TfPrincipal.RegisterRouters;
begin
  TRouter4D.Switch.Router('Home', TfHome);
end;

end.
