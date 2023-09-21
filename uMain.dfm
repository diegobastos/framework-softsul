object formMain: TformMain
  Left = 0
  Top = 0
  ClientHeight = 543
  ClientWidth = 1027
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 15
  object sideBar: TPanel
    Left = 0
    Top = 41
    Width = 33
    Height = 502
    Align = alLeft
    TabOrder = 0
    object btnFarms: TButton
      Left = 1
      Top = 1
      Width = 31
      Height = 25
      Align = alTop
      Caption = 'F'
      TabOrder = 0
      OnClick = btnFarmsClick
    end
    object btnUsers: TButton
      Left = 1
      Top = 26
      Width = 31
      Height = 25
      Align = alTop
      Caption = 'U'
      TabOrder = 1
      OnClick = btnUsersClick
    end
  end
  object pnlDesktop: TPanel
    Left = 33
    Top = 41
    Width = 994
    Height = 502
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pgcDesktop: TCustomTabControl
      Left = 0
      Top = 0
      Width = 994
      Height = 502
    end
  end
  object topBar: TPanel
    Left = 0
    Top = 0
    Width = 1027
    Height = 41
    Align = alTop
    TabOrder = 2
    object logoTop: TImage
      Left = 1
      Top = 1
      Width = 32
      Height = 39
      Align = alLeft
      Center = True
      Transparent = True
    end
  end
end
