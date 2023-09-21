unit uGridUsers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormGrid, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TformGridUsers = class(TformGrid)
  private

  protected
    procedure DoSearch; override;
  public
    function GetFormName: string; override;
    procedure OpenForm(AParent: TWinControl); override;
  end;

var
  formGridUsers: TformGridUsers;

implementation

{$R *.dfm}
{$REGION 'TformGridUsers' }

procedure TformGridUsers.DoSearch;
begin
  inherited;
  // implementar as ações de buscas
end;

function TformGridUsers.GetFormName: string;
begin
  Result := Caption;
end;

procedure TformGridUsers.OpenForm(AParent: TWinControl);
begin
  inherited;
  formGridUsers := formGridUsers.Create(Application);
  formGridUsers.Parent := AParent;
  formGridUsers.Show;
end;
{$ENDREGION}

end.
