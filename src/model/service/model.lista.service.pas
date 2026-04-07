unit model.lista.service;

interface

uses
  System.JSON,
  System.SysUtils,

  model.lista,

  Dataset.Serialize;

type
  TListaService = class
    public
      function RetornarRegistro(aFilter: String; const aOrderBy: String = ''): String;
      procedure PersistirRegistro(lista: Tlista; out msgError: String);
      procedure RemoverCodigo(codigo: String; out msgError: String);
      procedure LimparLista(out msgError: String);
  end;

implementation

uses uDM;

{ TListaService }

procedure TListaService.LimparLista(out msgError: String);
begin
  msgError := EmptyStr;
  try
    With DM.FDQCommand do
      begin
        SQL.Text := 'DELETE FROM listas';
        ExecSQL;
      end;
  except
    on e: Exception do
      begin
        msgError := e.Message;
      end;
  end;
end;

procedure TListaService.PersistirRegistro(lista: Tlista; out msgError: String);
begin
  msgError := EmptyStr;
  try
    With DM.FDQCommand do
      begin
        SQL.Text := 'INSERT OR REPLACE INTO listas (codigo,descricao)'+
        'VALUES(:p1,:p2)';
        Params[0].AsString := lista.codigo;
        Params[1].AsString := lista.descricao;
        ExecSQL;
      end;
  except
    on e: Exception do
      begin
        msgError := e.Message;
      end;
  end;
end;

procedure TListaService.RemoverCodigo(codigo: String; out msgError: String);
begin
  msgError := EmptyStr;

  if codigo.Trim.IsEmpty then
    begin
      msgError := 'Campo código é obrigatório.';
      Exit;
    end;

  try
    With DM.FDQCommand do
      begin
        SQL.Text := 'DELETE FROM listas WHERE codigo = :p1';
        Params[0].AsString := codigo;
        ExecSQL;
      end;
  except
    on e: Exception do
      begin
        msgError := e.Message;
      end;
  end;
end;

function TListaService.RetornarRegistro(aFilter: String;
  const aOrderBy: String): String;
var
  sqlcommand: String;
begin
  sqlcommand := 'SELECT * FROM listas WHERE 1=1';

  if aFilter.Trim.Length > 0 then
    sqlcommand := sqlcommand + ' AND ' + aFilter;

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
