unit model.setor;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils;

type
  Tsetor = class
  private
    Fid: Integer;
    Fabreviatura: String;
    Fnome: String;

  public
    constructor Create;
    destructor Destroy; override;

    property id: Integer read Fid write Fid;
    property nome: String read Fnome write Fnome;
    property abreviatura: String read Fabreviatura write Fabreviatura;
  end;

implementation

{ Tsetor }

constructor Tsetor.Create;
begin
  //
end;

destructor Tsetor.Destroy;
begin
  //
  inherited;
end;

end.
