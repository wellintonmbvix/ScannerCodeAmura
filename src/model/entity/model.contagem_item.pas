unit model.contagem_item;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections;

type
  Tcontagem_item = class
  private
    Fid_setor: Integer;
    Fid_contagem_cab: Integer;
    Fcodigo: String;
    Fid: Integer;
    Fqtde: Double;
  public
    constructor Create;
    destructor Destroy; override;

    property id: Integer read Fid write Fid;
    property id_contagem_cab: Integer read Fid_contagem_cab
      write Fid_contagem_cab;
    property id_setor: Integer read Fid_setor write Fid_setor;
    property codigo: String read Fcodigo write Fcodigo;
    property qtde: Double read Fqtde write Fqtde;
  end;

implementation

{ Tcontagem_item }

constructor Tcontagem_item.Create;
begin
  //
end;

destructor Tcontagem_item.Destroy;
begin
  //
  inherited;
end;

end.
