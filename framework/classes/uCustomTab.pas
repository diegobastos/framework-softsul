unit uCustomTab;

interface

uses
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Controls, Messages, SysUtils, Classes, Forms, Windows, Graphics, Dialogs;

const
  WM_CLOSE_TAB = WM_USER + 100;

type
  TCustomTabControl = class(TPageControl)
  private
    procedure WMCloseTab(var Message: TMessage); message WM_CLOSE_TAB;
  protected
    procedure DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$REGION 'TCustomTabControl'}

constructor TCustomTabControl.Create(AOwner: TComponent);
begin
  inherited;
  OwnerDraw := True;
end;

procedure TCustomTabControl.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  TabIndex: Integer;
  TabRect: TRect;
begin
  inherited;
  TabIndex := IndexOfTabAt(X, Y);
  if (TabIndex >= 0) and (Button = mbLeft) then
  begin
    TabRect := Self.TabRect(TabIndex);
    if PtInRect(Rect(TabRect.Right - 20, TabRect.Top, TabRect.Right, TabRect.Bottom), Point(X, Y)) then
    begin
      Perform(WM_CLOSE_TAB, TabIndex, 0);
      Exit;
    end;
  end;
end;

procedure TCustomTabControl.WMCloseTab(var Message: TMessage);
var
  TabIndex: Integer;
begin
  TabIndex := Message.WParam;
  if (TabIndex >= 0) and (TabIndex < PageCount) then
    Pages[TabIndex].Free; // Fecha a guia liberando sua memória
end;

procedure TCustomTabControl.DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
  TabCaption: string;
  CloseButtonRect: TRect;
  TabColor: TColor;
begin
  TabCaption := Pages[TabIndex].Caption;

  var ButtonSpacing := 30;
  Canvas.FillRect(Rect);
//  Canvas.Brush.Color := TabColor;

  Canvas.FillRect(Rect);
  Canvas.Font.Color := clWindowText;
  Canvas.TextOut(Rect.Left + 3, Rect.Top + 3, TabCaption+'  ');

  if TabIndex >= 0 then
  begin
    CloseButtonRect := Rect;
    CloseButtonRect.Left := CloseButtonRect.Right - 18;

//    Canvas.Brush.Color := TabColor;
    Canvas.FillRect(CloseButtonRect);
    Canvas.Font.Color := clRed;
    Canvas.TextOut(CloseButtonRect.Left + 3, CloseButtonRect.Top + 3, 'X');
  end;
end;

{$ENDREGION}

end.

