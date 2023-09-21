unit uGridUsers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormGrid, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TformGridUsers = class(TformGrid)
  private
    { Private declarations }
  protected
    procedure DoSearch; override;
    function GetKeyRow: variant; override;
  public
    function GetFormName: string; overload;
  end;

var
  formGridUsers: TformGridUsers;

implementation

{$R *.dfm}

{$REGION 'TformGridUsers' }

procedure TformGridUsers.DoSearch;
begin
  inherited;

end;

function TformGridUsers.GetFormName: string;
begin
  inherited;
  //caso precise sobrescrever o método
end;

function TformGridUsers.GetKeyRow: variant;
begin
  Result := 1; //valor fake para testes;
end;
{$ENDREGION}

end.
