object FormOTP: TFormOTP
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'One Time Password Example'
  ClientHeight = 236
  ClientWidth = 141
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ScreenSnap = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 105
    Height = 13
    Caption = 'Private Key (base32):'
  end
  object Label2: TLabel
    Left = 8
    Top = 103
    Width = 43
    Height = 13
    Caption = 'Counter:'
    Enabled = False
  end
  object Label3: TLabel
    Left = 8
    Top = 183
    Width = 94
    Height = 13
    Caption = 'One Time Password'
  end
  object EdtKey: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object CBTOPT: TCheckBox
    Left = 8
    Top = 54
    Width = 121
    Height = 35
    Caption = 'Use Time Based One Time Password'
    Checked = True
    State = cbChecked
    TabOrder = 1
    WordWrap = True
    OnClick = CBTOPTClick
  end
  object EdtHOTP: TEdit
    Left = 8
    Top = 122
    Width = 121
    Height = 21
    Enabled = False
    NumbersOnly = True
    TabOrder = 2
  end
  object BtnCalculate: TButton
    Left = 8
    Top = 149
    Width = 121
    Height = 25
    Caption = 'Calculate'
    Default = True
    TabOrder = 3
    OnClick = BtnCalculateClick
  end
  object EdtResult: TEdit
    Left = 8
    Top = 202
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
end
