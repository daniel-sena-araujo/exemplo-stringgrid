object PrincipalForm: TPrincipalForm
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Exemplo StringGrid'
  ClientHeight = 229
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object StringGrid: TStringGrid
    Left = 10
    Top = 10
    Width = 524
    Height = 179
    ColCount = 8
    FixedColor = clGray
    RowCount = 7
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnDrawCell = StringGridDrawCell
    OnSelectCell = StringGridSelectCell
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24)
  end
  object BitBtn: TBitBtn
    Left = 10
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Marcar'
    TabOrder = 1
    OnClick = BitBtnClick
  end
end
