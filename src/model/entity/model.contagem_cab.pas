unit model.contagem_cab;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,

  Data.DB;

type
  Tcontagem_cab = class
  private
    Fdescricao: String;
    Fid: Integer;
    FdataHora: String;
  public
    constructor Create;
    destructor Destroy; override;

    property id: Integer read Fid write Fid;
    property descricao: String read Fdescricao write Fdescricao;
    property dataHora: String read FdataHora write FdataHora;
  end;

implementation

{ Tcontagem_cab }

constructor Tcontagem_cab.Create;
begin
  //
end;

destructor Tcontagem_cab.Destroy;
begin
  //
  inherited;
end;

end.
