unit uFormGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, uIFramework;

type
  TformGrid = class(TForm, ITabForm)
    grid: TDBGrid;
    pnlTop: TPanel;
    btnSearch: TButton;
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure DoSearch; virtual; abstract;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;

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

constructor TformGrid.Create;
begin
  inherited Create(AOwner);
  Align := alClient;
  BorderStyle := bsNone;
end;
{$ENDREGION}

end.
