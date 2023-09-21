object formGrid: TformGrid
  Left = 0
  Top = 0
  Caption = '[Title]'
  ClientHeight = 302
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object gridDefault: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 491
    Height = 252
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gridDefaultDblClick
  end
  object pnlTop: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 491
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 507
    DesignSize = (
      491
      38)
    object btnSearch: TButton
      Left = 411
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Buscar'
      TabOrder = 0
      OnClick = btnSearchClick
      ExplicitLeft = 427
    end
  end
end
