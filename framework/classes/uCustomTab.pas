unit uCustomTab;

interface

uses
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Controls, Messages, SysUtils, Classes, Forms, Windows, Graphics;

const
  WM_CLOSE_TAB = WM_USER + 100;

type
  TCloseTabEvent = procedure(Sender: TObject; var CloseAction: TCloseAction) of object;

  TCustomTabControl = class(TPageControl)
  private
    FOnCloseTab: TCloseTabEvent;
    procedure WMCLOSETAB(var Message: TMessage); message WM_CLOSE_TAB;
  protected
    procedure DoCloseTab(TabIndex: Integer);
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    property OnCloseTab: TCloseTabEvent read FOnCloseTab write FOnCloseTab;
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
begin
  inherited;
  TabIndex := IndexOfTabAt(X, Y);
  if (TabIndex >= 0) and (Button = mbMiddle) then
  begin
    DoCloseTab(TabIndex);
    Exit;
  end;
end;

procedure TCustomTabControl.DoCloseTab(TabIndex: Integer);
var
  CloseAction: TCloseAction;
begin
  CloseAction := TCloseAction.caHide; // Pode ser caFree se desejar destruir a aba
  if Assigned(FOnCloseTab) then
    FOnCloseTab(Self, CloseAction);
  if CloseAction = TCloseAction.caFree then
    Tabs.Delete(TabIndex); // Remova a aba se for necessário
end;

procedure TCustomTabControl.WMCLOSETAB(var Message: TMessage);
var
  TabIndex: Integer;
begin
  TabIndex := Message.WParam;
  DoCloseTab(TabIndex);
end;

procedure TCustomTabControl.DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
  TabCaption: string;
  CloseButtonRect: TRect;
  TabColor: TColor;
begin
  TabCaption := Pages[TabIndex].Caption;
  if Active then
  begin
    Canvas.Brush.Color := clBtnFace;
    TabColor := clBlue;
  end
  else
  begin
    Canvas.Brush.Color := clBtnFace;
    TabColor := clRed;
  end;

  Canvas.FillRect(Rect);
  Canvas.Brush.Color := TabColor;
  Canvas.FillRect(Rect);
  Canvas.Font.Color := clWindowText;
  Canvas.TextOut(Rect.Left + 3, Rect.Top + 3, TabCaption);

  if TabIndex >= 0 then
  begin
    CloseButtonRect := Rect;
    CloseButtonRect.Left := CloseButtonRect.Right - 20;
    Canvas.Brush.Color := TabColor;
    Canvas.FillRect(CloseButtonRect);
    Canvas.Font.Color := clWindowText;
    Canvas.TextOut(CloseButtonRect.Left + 3, CloseButtonRect.Top + 3, 'X');
  end;
end;

procedure TCustomTabControl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent is TTabSheet) then
    Invalidate; // Redesenha as abas quando uma aba é removida
end;

{$ENDREGION}

end.


{unit uCustomTab;

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
                                                    var
                                                      ButtonLeft: Integer;
                                                      begin
                                                        // Defina a largura da aba personalizada de acordo com a sua necessidade
                                                          Width := 120; // Exemplo: Defina o tamanho adequado

                                                            // Crie o botão de fechar
                                                              FCloseButton := TButton.Create(Self);
                                                                FCloseButton.Parent := Self;
                                                                  FCloseButton.Caption := 'X';
                                                                    FCloseButton.Width := 20;
                                                                      FCloseButton.Height := 20;
                                                                        FCloseButton.Top := 0;

                                                                          // Calcule a posição horizontal do botão para que ele fique à direita da aba
                                                                            ButtonLeft := Width - FCloseButton.Width - 5;
                                                                              if ButtonLeft < 0 then
                                                                                  ButtonLeft := 0; // Garanta que o botão não saia do limite da aba

                                                                                    FCloseButton.Left := ButtonLeft;

                                                                                      // Defina outras propriedades do botão, como a cor da fonte
                                                                                        FCloseButton.Font.Color := clBlack;

                                                                                          // Associe o evento OnClick ao botão
                                                                                            FCloseButton.OnClick := CloseButtonClick;

                                                                                            //  FCloseButton := TButton.Create(Self);
                                                                                            //  FCloseButton.Parent := Self;
                                                                                            //  FCloseButton.Caption := 'X';
                                                                                            //  FCloseButton.Width := 20;
                                                                                            //  FCloseButton.Height := 20;
                                                                                            //  FCloseButton.Top := 5;
                                                                                            //  FCloseButton.Font.Color := clBlack;
                                                                                            //  FCloseButton.Left := Width - FCloseButton.Width - 5;
                                                                                            //  FCloseButton.OnClick := CloseButtonClick;
                                                                                            {//  Self.Width := 100;
                                                                                            //  FCloseButton := TButton.Create(Self);
                                                                                            //  FCloseButton.Parent := Self;
                                                                                            //  FCloseButton.Caption := 'X';
                                                                                            //  FCloseButton.Width := 20;
                                                                                            //  FCloseButton.Height := 20;
                                                                                            //  FCloseButton.Top := 5;
                                                                                            //  FCloseButton.Left := Width - FCloseButton.Width - 5;
                                                                                            //
                                                                                            //  FCloseButton.Visible := True;
                                                                                            //  FCloseButton.Font.Color := clWindowText;
                                                                                            //  FCloseButton.OnClick := CloseButtonClick;}
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

                                                                                                                          end.}
