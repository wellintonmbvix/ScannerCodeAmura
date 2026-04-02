unit uDM;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils,

  Data.DB,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.FMXUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FDConn: TFDConnection;
    FDQCommand: TFDQuery;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{$REGION 'Procedures e funções'}



{$ENDREGION}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  DatabasePath: string;
begin
  with FDConn do
    begin
      Params.Values['DriverID'] := 'SQLite';

      {$IF DEFINED(IOS) OR DEFINED(ANDROID)}
        DatabasePath := TPath.Combine(
          TPath.GetDocumentsPath, 'db.sqlite');
      {$ELSE}
        DatabasePath := System.SysUtils.GetCurrentDir + '\DB\db.sqlite';
      {$ENDIF}
      FDConn.Params.Values['Database'] := DatabasePath;
      try
        FDConn.Connected := True;
      except
        on E: Exception do
          raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
      end;
    end;
end;

end.
