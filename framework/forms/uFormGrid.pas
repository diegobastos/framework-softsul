unit uFormGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, uIFramework;

type
  TformGrid = class(TForm, ITabForm)
    gridDefault: TDBGrid;
    pnlTop: TPanel;
    btnSearch: TButton;
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  protected
    procedure DoSearch; virtual; abstract;
  public

    {ITabForm}
    function GetFormName: string; virtual; abstract;
    procedure OpenForm(AParent: TWinControl); virtual; abstract;
  end;

var
  formGrid: TformGrid;

implementation

{$R *.dfm}

{$REGION 'TformGrid' }
procedure TformGrid.btnSearchClick(Sender: TObject);
begin
  DoSearch;
end;

procedure TformGrid.FormCreate(Sender: TObject);
begin
  Align := alClient;
  BorderStyle := bsNone;
end;

{$ENDREGION}

end.
