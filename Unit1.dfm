object Form1: TForm1
  Left = 347
  Top = 163
  Width = 374
  Height = 419
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 336
    Width = 46
    Height = 20
    Caption = 'Server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 128
    Top = 8
    Width = 54
    Height = 24
    Caption = 'Client'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 96
    Width = 28
    Height = 13
    Caption = 'Nama'
  end
  object Label4: TLabel
    Left = 24
    Top = 72
    Width = 23
    Height = 13
    Caption = 'NRP'
  end
  object Label5: TLabel
    Left = 24
    Top = 120
    Width = 20
    Height = 13
    Caption = 'Nilai'
  end
  object Button1: TButton
    Left = 232
    Top = 336
    Width = 49
    Height = 25
    Caption = 'connect'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 80
    Top = 336
    Width = 145
    Height = 21
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object Edit2: TEdit
    Left = 80
    Top = 72
    Width = 129
    Height = 21
    TabOrder = 2
    Text = '26409022'
  end
  object Edit3: TEdit
    Left = 80
    Top = 96
    Width = 129
    Height = 21
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 80
    Top = 120
    Width = 129
    Height = 21
    TabOrder = 4
  end
  object Button2: TButton
    Left = 32
    Top = 152
    Width = 65
    Height = 25
    Caption = 'Add'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 112
    Top = 152
    Width = 57
    Height = 25
    Caption = 'View'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 32
    Top = 192
    Width = 57
    Height = 25
    Caption = 'Edit'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 112
    Top = 192
    Width = 57
    Height = 25
    Caption = 'Delete'
    TabOrder = 8
    OnClick = Button5Click
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnRead = ClientSocket1Read
    Left = 312
    Top = 8
  end
end
