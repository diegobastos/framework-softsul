object formGrid: TformGrid
  Left = 0
  Top = 0
  Caption = '[Title]'
  ClientHeight = 487
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object grid: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 507
    Height = 437
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object pnlTop: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 507
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      507
      38)
    object btnSearch: TButton
      Left = 427
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Buscar'
      TabOrder = 0
      OnClick = btnSearchClick
    end
  end
end
