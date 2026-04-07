unit model.setor.service;

interface

uses
  System.JSON,
  System.SysUtils,

  model.setor,

  Dataset.Serialize;

type
  TSetorService = class
    public
      function RetornarRegistro(aFilter: String; const aOrderBy: String = ''): String;
      procedure PersistirRegistro(setor: Tsetor; out msgError: String);
      procedure RemoverRegistro(id: Integer; out msgError: String);
  end;

implementation

uses uDM;

{ TSetorService }

procedure TSetorService.PersistirRegistro(setor: Tsetor; out msgError: String);
begin
  msgError := EmptyStr;
  try
    With DM.FDQCommand do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'INSERT OR REPLACE INTO setores (id,nome,abreviatura)'+
        'VALUES(:p1,:p2,:p3)';
        Params[0].AsInteger := setor.id;
        Params[1].AsString := setor.nome;
        Params[2].AsString := setor.abreviatura;
        ExecSQL;
      end;
  except
    on e: Exception do
      begin
        msgError := e.Message;
      end;
  end;
end;

procedure TSetorService.RemoverRegistro(id: Integer; out msgError: String);
begin
  msgError := EmptyStr;
  try
    With DM.FDQCommand do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'DELETE FROM setores WHERE id = :p1';
        Params[0].AsInteger := id;
        ExecSQL;
      end;
  except
    on e: Exception do
      begin
        msgError := e.Message;
      end;
  end;
end;

function TSetorService.RetornarRegistro(aFilter: String;
  const aOrderBy: String): String;
var
  sqlcommand: String;
begin
  sqlcommand := 'SELECT * FROM setor WHERE 1=1 ';

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
