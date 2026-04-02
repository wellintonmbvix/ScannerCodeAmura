unit view.home;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Skia,

  Router4D,
  Router4D.Props,

  Router4D.Interfaces,
  uLoading,

  FMX.Toast,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Skia,
  FMX.Edit,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.ListBox;

type
  TfHome = class(TForm, iRouter4DComponent)
    lytHome: TLayout;
    rctBackgroud: TRectangle;
    lytHeader: TLayout;
    rctHeader: TRectangle;
    lbTitleHeader: TLabel;
    lytFooter: TLayout;
    sklbSessionFooter: TSkLabel;
    sklbSectorFooter: TSkLabel;
    sklbItemsReadFooter: TSkLabel;
    lytBody: TLayout;
    lytResources: TLayout;
    lytResourceScanner: TLayout;
    skvgScanner: TSkSvg;
    rectBtnScanner: TRectangle;
    sbtnResourceScanner: TSpeedButton;
    lytResourceList: TLayout;
    svkgFolder: TSkSvg;
    rectBtnResourceLista: TRectangle;
    sbtnResourceLista: TSpeedButton;
    lytResourcCount: TLayout;
    svkgBars: TSkSvg;
    rectResourcCount: TRectangle;
    sbtnResourceCount: TSpeedButton;
    lytResourceConfig: TLayout;
    SkSvg1: TSkSvg;
    rectResourceConfig: TRectangle;
    sbtnResourceConfig: TSpeedButton;
  private
    { Private declarations }
    var msgError: String;
    procedure CreateRouters;
  public
    { Public declarations }
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  fHome: TfHome;

implementation

uses
  view.principal;

{$R *.fmx}

{ TfHome }

procedure TfHome.CreateRouters;
begin
  //
end;

function TfHome.Render: TFMXObject;
begin
  Result := lytHome;
end;

procedure TfHome.UnRender;
begin
  //
end;

end.
