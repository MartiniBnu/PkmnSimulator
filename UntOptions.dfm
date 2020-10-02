object FrmOptions: TFrmOptions
  Left = 478
  Top = 245
  BorderStyle = bsSingle
  Caption = 'Op'#231#245'es'
  ClientHeight = 224
  ClientWidth = 184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 10
    Top = 188
    Width = 73
    Height = 25
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BtnCancel: TBitBtn
    Left = 92
    Top = 188
    Width = 79
    Height = 25
    TabOrder = 1
    OnClick = BtnCancelClick
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 13
    Top = 4
    Width = 156
    Height = 105
    Caption = 'Pok'#233's'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object LabOpt01: TRxLabel
      Left = 11
      Top = 18
      Width = 64
      Height = 12
      Caption = 'Ordena'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clBtnFace
      Transparent = True
    end
    object RxLabel1: TRxLabel
      Left = 11
      Top = 63
      Width = 73
      Height = 12
      Caption = 'Mostrar Nro.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clBtnFace
      Transparent = True
    end
    object CmbOptListagens: TComboBox
      Left = 12
      Top = 33
      Width = 93
      Height = 21
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = 'Alfab'#233'tica'
      Items.Strings = (
        'Alfab'#233'tica'
        'Num'#233'rica'
        'Evolutiva')
    end
    object CmbMostraNro: TComboBox
      Left = 13
      Top = 78
      Width = 69
      Height = 21
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ItemHeight = 13
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'Sim'
      Items.Strings = (
        'Sim'
        'N'#227'o')
    end
  end
  object GroupBox2: TGroupBox
    Left = 13
    Top = 116
    Width = 156
    Height = 65
    Caption = 'Visual'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object LabOpt02: TRxLabel
      Left = 13
      Top = 19
      Width = 26
      Height = 12
      Caption = 'Skin'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clBtnFace
      Transparent = True
    end
    object CmbOptSkins: TComboBox
      Left = 13
      Top = 34
      Width = 140
      Height = 21
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      OnChange = CmbOptSkinsChange
    end
  end
end
