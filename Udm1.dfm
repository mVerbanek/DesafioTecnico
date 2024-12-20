object DM1: TDM1
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      'Protocol=TCPIP'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 48
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorLib = 'D:\Desafio\fbclient.dll'
    Left = 96
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 104
  end
  object FDQFazenda: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      '  select ID, NOME from fazenda')
    Left = 264
    Top = 96
    object FDQFazendaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQFazendaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 30
    end
  end
  object FDQAnimal: TFDQuery
    MasterSource = DSFazenda
    Connection = FDConnection
    SQL.Strings = (
      'select a.ID, a.TAG, a.ID_FAZENDA'
      '  from animal a '
      ' where a.ID_FAZENDA = :IDFAZENDA')
    Left = 344
    Top = 96
    ParamData = <
      item
        Name = 'IDFAZENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQAnimalID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQAnimalTAG: TStringField
      DisplayLabel = 'Tag'
      FieldName = 'TAG'
      Origin = 'TAG'
      Required = True
      Size = 15
    end
    object FDQAnimalID_FAZENDA: TIntegerField
      FieldName = 'ID_FAZENDA'
      Origin = 'ID_FAZENDA'
      Required = True
      Visible = False
    end
  end
  object DSFazenda: TDataSource
    DataSet = FDQFazenda
    OnDataChange = DSFazendaDataChange
    Left = 264
    Top = 145
  end
  object DSAnimal: TDataSource
    DataSet = FDQAnimal
    Left = 344
    Top = 144
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 32
    Top = 200
  end
  object Relatorio: TfrxReport
    Version = '2025.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45640.156746736100000000
    ReportOptions.LastChange = 45640.203577812500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 288
    Top = 312
    Datasets = <
      item
        DataSet = RelDSFazenda
        DataSetName = 'RelDSFazenda'
      end
      item
        DataSet = RelDSAnimal
        DataSetName = 'RelDSAnimal'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 41.574830000000000000
        Width = 718.110700000000000000
        DataSet = RelDSFazenda
        DataSetName = 'RelDSFazenda'
        RowCount = 0
        object MemoRelDSFazendaID: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'ID'
          DataSet = RelDSFazenda
          DataSetName = 'RelDSFazenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '[RelDSFazenda."ID"]')
          ParentFont = False
        end
        object MemoRelDSFazendaNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 30.236240000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'NOME'
          DataSet = RelDSFazenda
          DataSetName = 'RelDSFazenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '[RelDSFazenda."NOME"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Condition = 'RelDSFazenda."ID"'
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 83.149660000000000000
        Width = 718.110700000000000000
        DataSet = RelDSAnimal
        DataSetName = 'RelDSAnimal'
        RowCount = 0
        object MemoRelDSAnimalTAG: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'TAG'
          DataSet = RelDSAnimal
          DataSetName = 'RelDSAnimal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            '[RelDSAnimal."TAG"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000000050000000000
          Top = -0.000006940000000004
          Width = 7.559056440000000000
          Height = 18.897659300000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            '')
        end
      end
    end
  end
  object RelDSFazenda: TfrxDBDataset
    UserName = 'RelDSFazenda'
    CloseDataSource = False
    DataSet = FDQFazenda
    BCDToCurrency = False
    DataSetOptions = []
    Left = 368
    Top = 312
  end
  object RelDSAnimal: TfrxDBDataset
    UserName = 'RelDSAnimal'
    CloseDataSource = False
    DataSet = FDQAnimal
    BCDToCurrency = False
    DataSetOptions = []
    Left = 456
    Top = 312
  end
end
