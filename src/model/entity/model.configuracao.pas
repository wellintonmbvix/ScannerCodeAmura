unit model.configuracao;

interface

uses
  Data.DB,
  Generics.Collections,

  System.Classes,
  System.SysUtils;

type
  Tconfiguracao = class
  private
    Fsetorizar: Boolean;
    Fvalidar_codigo: Boolean;
    Fid: Integer;

  public
    constructor Create;
    destructor Destroy; override;

    property id: Integer read Fid write Fid;
    property setorizar: Boolean read Fsetorizar write Fsetorizar;
    property validar_codigo: Boolean read Fvalidar_codigo write Fvalidar_codigo;
  end;

implementation

{ Tconfiguracao }

constructor Tconfiguracao.Create;
begin
  //
end;

destructor Tconfiguracao.Destroy;
begin
  //
  inherited;
end;

end.
