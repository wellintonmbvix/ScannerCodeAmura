unit model.contagem_cab;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils;

type
  Tcontagem_cab = class
  private
    Fdescricao: String;
    Fid: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    property id: Integer read Fid write Fid;
    property descricao: String read Fdescricao write Fdescricao;
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
