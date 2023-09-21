unit uGridFarms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormGrid, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TformGridFarms = class(TformGrid)
  private

  protected
    procedure DoSearch; override;
    function GetKeyRow: variant; override;
  public

  end;

var
  formGridFarms: TformGridFarms;

implementation

{$R *.dfm}
{$REGION 'TformGridFarms'}

procedure TformGridFarms.DoSearch;
begin
  inherited;
  { Ação necessária para buscar os dados }
end;

function TformGridFarms.GetKeyRow: variant;
begin
  Result := 1; //valor fake para testes;
end;

{$ENDREGION}

end.
