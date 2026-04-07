unit model.contagem.service;

interface

uses
  System.JSON,
  System.SysUtils,

  model.contagem_cab,
  model.contagem_item,

  Dataset.Serialize;

type
  TContagemService = class
    public
      function RetornarRegistro(aFilter: String; const aOrderBy: String = ''): String;
      procedure PersistirContagemCab(contagemCab: Tcontagem_cab; out msgError: String);
      procedure PersistirContagemItem(contagemItem: Tcontagem_item; out msgError: String);
      procedure RemoverContagem(id: Integer; out msgError:  String);
      procedure RemoverContagemItem(id: Integer; out msgError: String);
  end;

implementation

uses uDM;

{ TContagemService }

procedure TContagemService.PersistirContagemCab(contagemCab: Tcontagem_cab;
  out msgError: String);
begin
  msgError := EmptyStr;
  try
    With DM.FDQCommand do
      begin
        SQL.Text := 'INSERT OR REPLACE contagem_cab (id,descricao,data_hora)'+
        'VALUES(:p1,:p2,:p3)';
        Params[0].AsInteger := contagemCab.id;
        Params[1].AsString  := contagemCab.descricao;
        Params[2].AsString  := contagemCab.dataHora;
        ExecSQL;
      end;
  except
    on e: Exception do
      msgError := e.Message;
  end;
end;

procedure TContagemService.PersistirContagemItem(contagemItem: Tcontagem_item;
  out msgError: String);
begin
  msgError := EmptyStr;
  try
    With DM.FDQCommand do
      begin
        SQL.Text := 'INSERT OR REPLACE contagem_item(id,id_contagem_cab,id_setor,codigo,qtde)'+
         'VALUES(:p1,:p2,:p3,:p4,:p5)';
        Params[0].AsInteger := contagemItem.id;
        Params[1].AsInteger := contagemItem.id_contagem_cab;
        Params[2].AsInteger := contagemItem.id_setor;
        if contagemItem.id_setor <= 0 then
          Params[2].Clear;
        Params[3].AsString  := contagemItem.codigo;
        Params[4].AsFloat   := contagemItem.qtde;
        ExecSQL;
      end;
  except
    on e: Exception do
      msgError := e.Message;
  end;
end;

procedure TContagemService.RemoverContagem(id: Integer; out msgError: String);
begin
  msgError := EmptyStr;

  if id <= 0 then
    begin
      msgError := 'Campo ID é obrigatório.';
      Exit;
    end;

  DM.FDConn.StartTransaction;
  try
    With DM.FDQCommand do
      begin
        SQL.Text := 'DELETE FROM contagem_item WHERE id_contagem_cab = :p1';
        Params[0].AsInteger := id;
        ExecSQL;

        SQL.Text := 'DELETE FROM contagem_cab WHERE id = :p1';
        Params[0].AsInteger := id;
        ExecSQL;

        DM.FDConn.Commit;
      end;
  except
    on E: Exception do
    begin
      // Desfaz tudo em caso de erro
      DM.FDConn.Rollback;
      msgError := E.Message;
    end;
  end;
end;

procedure TContagemService.RemoverContagemItem(id: Integer;
  out msgError: String);
begin
  msgError := EmptyStr;

  if id <= 0 then
    begin
      msgError := 'Campo ID é obrigatório.';
      Exit;
    end;

  try
    With DM.FDQCommand do
      begin
        SQL.Text := 'DELETE FROM contagem_item WHERE id = :p1';
        Params[0].AsInteger := id;
        ExecSQL;
      end;
  except
    on e: Exception do
      msgError := e.Message;
  end;
end;

function TContagemService.RetornarRegistro(aFilter: String;
  const aOrderBy: String): String;
begin

end;

end.
