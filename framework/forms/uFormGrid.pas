unit uFormGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, uIFramework;

type
  TformGrid = class(TForm, ITabForm)
    gridDefault: TDBGrid;
    pnlTop: TPanel;
    btnSearch: TButton;
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridDefaultDblClick(Sender: TObject);
  private

  protected
    FCrudForm : ICrudForm;
    procedure DoSearch; virtual; abstract;

    //deve retornar o valor da primary key para o form de crud
    function GetKeyRow: variant; virtual; abstract;
  public

    { ITabForm }
    function GetFormName: string;
    procedure OpenForm(AParent: TWinControl);
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

function TformGrid.GetFormName: string;
begin
  Result := Self.Caption;
end;

procedure TformGrid.gridDefaultDblClick(Sender: TObject);
begin
  //Verifica se existe atribuição da tela de crud
  if Assigned(FCrudForm) then
  begin
    FCrudForm.OpenForm(Self, GetKeyRow);
  end;

end;

procedure TformGrid.OpenForm(AParent: TWinControl);
begin
  var xForm := TformGrid.Create(nil);
  xForm.Parent := AParent;
  xForm.Show;
  //TODO: xForm.Free; tratar qdo setar caFree;
end;

{$ENDREGION}

end.
