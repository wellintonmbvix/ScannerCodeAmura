unit model.configuracao.service;

interface

uses
  System.JSON,
  System.SysUtils,

  model.configuracao,

  Dataset.Serialize;

type
  TConfiguracaoService = class
    private
    public
     function RetornaRegistro(aFilter: String; const aOrderBy: String = ''): String;
     procedure PersistirRegistro(configuracao: Tconfiguracao; out msgError: String);
  end;

implementation

{ TConfiguracaoService }

uses uDM;

procedure TConfiguracaoService.PersistirRegistro(
  configuracao: Tconfiguracao; out msgError: String);
begin
  msgError := EmptyStr;
  try
    With DM.FDQCommand do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'INSERT OR REPLACE INTO configuracao (id,setorizar,validar_codigo)'+
        'VALUES(:p1,:p2,:p3)';
        Params[0].AsInteger := configuracao.id;
        Params[1].AsInteger := Integer(configuracao.setorizar);
        Params[2].AsInteger := Integer(configuracao.validar_codigo);
        ExecSQL;
      end;
  except
    on e: Exception do
      begin
        msgError := e.Message;
      end;
  end;
end;

function TConfiguracaoService.RetornaRegistro(aFilter: String;
  const aOrderBy: String): String;
var
  sqlcommand: String;
begin
  sqlcommand := 'SELECT * FROM configuracao WHERE 1=1 ';

  if aFilter.Trim.Length > 0 then
    sqlcommand := sqlcommand + 'AND ' + aFilter;

  if aOrderBy.Trim.Length > 0 then
    sqlcommand := sqlcommand + ' ORDER BY ' + aOrderBy;


  With DM.FDQCommand Do
    begin
      Close;
      SQL.Clear;
      SQL.Text := sqlcommand;
      ExecSQL;

      ToJSONArrayString;
    end;
end;

end.
