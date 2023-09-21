unit uCustomTab;

interface

uses
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Controls, Messages, SysUtils, Classes,
  Graphics, Winapi.Windows, Forms;

const
  WM_CLOSE_TAB = WM_USER + 100; //utiliza mensagem do Windows

type
  TCloseTabEvent = procedure(Sender: TObject; var CloseAction: TCloseAction) of object;

  TCustomTabSheet = class(TTabSheet)
  private
    FCloseButton: TButton;
    FOnCloseTab: TCloseTabEvent;
    procedure CloseButtonClick(Sender: TObject);
    procedure WMCloseTab(var Message: TMessage); message WM_CLOSE_TAB;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CreateCloseButton;
    property CloseButton: TButton read FCloseButton;
    property OnCloseTab: TCloseTabEvent read FOnCloseTab write FOnCloseTab;
  end;

implementation

{$REGION 'TCustomTabSheet'}

constructor TCustomTabSheet.Create(AOwner: TComponent);
begin
  inherited;
  CreateCloseButton;
end;

procedure TCustomTabSheet.CreateCloseButton;
begin
  FCloseButton := TButton.Create(Self);
  FCloseButton.Parent := Self;
  FCloseButton.Caption := 'X';
  FCloseButton.Width := 20;
  FCloseButton.Height := 20;
  FCloseButton.Top := 5;
  FCloseButton.Left := Width - FCloseButton.Width - 5;
  FCloseButton.OnClick := CloseButtonClick;
end;

procedure TCustomTabSheet.CloseButtonClick(Sender: TObject);
var
  CloseAction: TCloseAction;
begin
  CloseAction := TCloseAction.caFree;
  if Assigned(FOnCloseTab) then
    FOnCloseTab(Self, CloseAction);
  if CloseAction = TCloseAction.caFree then
    Free;
end;

procedure TCustomTabSheet.WMCloseTab(var Message: TMessage);
begin
  if Parent is TPageControl then
  begin
    (Parent as TPageControl).ActivePage := Self;
    CloseButtonClick(Self);
  end;
end;
{$ENDREGION}

end.
