unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.StdCtrls, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,

  uIFramework, uCustomTab;

type
  TformMain = class(TForm)
    sideBar: TPanel;
    pnlDesktop: TPanel;
    topBar: TPanel;
    logoTop: TImage;
    btnFarms: TButton;
    btnUsers: TButton;
    pgcDesktop: TCustomTabControl;
    procedure btnFarmsClick(Sender: TObject);
    procedure btnUsersClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    procedure OpenTabForm(AForm: ITabForm);
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

uses
  uGridFarms, uGridUsers;

{$REGION 'TformMain' }

procedure TformMain.btnFarmsClick(Sender: TObject);
begin
  OpenTabForm(formGridFarms);
end;

procedure TformMain.btnUsersClick(Sender: TObject);
begin
  OpenTabForm(formGridUsers);
end;

procedure TformMain.FormResize(Sender: TObject);
begin
  pgcDesktop.Align := alClient;
end;

procedure TformMain.OpenTabForm(AForm: ITabForm);
begin
  var xNewTab := TTabSheet.Create(pgcDesktop);
  xNewTab.PageControl := pgcDesktop;
  xNewTab.Caption := '[]';
  AForm.OpenForm(xNewTab);
  xNewTab.Caption := AForm.GetFormName;
end;
{$ENDREGION}

end.
