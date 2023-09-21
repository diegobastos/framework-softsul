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
  public
    function GetFormName: string; override;
    procedure OpenForm(AParent: TWinControl); override;
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

function TformGridFarms.GetFormName: string;
begin
  Result := Caption;
end;

procedure TformGridFarms.OpenForm(AParent: TWinControl);
begin
  formGridFarms := TformGridFarms.Create(Application);
  formGridFarms.Parent := AParent;
  formGridFarms.Show;
end;
{$ENDREGION}

end.
