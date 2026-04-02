unit model.lista;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils;

type
  Tlista = class
  private
    Fdescricao: String;
    Fcodigo: String;
  public
    constructor Create;
    destructor Destroy; override;

    property codigo: String read Fcodigo write Fcodigo;
    property descricao: String read Fdescricao write Fdescricao;
  end;

implementation

{ Tlista }

constructor Tlista.Create;
begin
  //
end;

destructor Tlista.Destroy;
begin
  //
  inherited;
end;

end.
