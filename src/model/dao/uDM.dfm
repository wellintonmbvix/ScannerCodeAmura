object DM: TDM
  OnCreate = DataModuleCreate
  Height = 348
  Width = 398
  object FDConn: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    TxOptions.AutoStop = False
    LoginPrompt = False
    Left = 80
    Top = 32
  end
  object FDQCommand: TFDQuery
    Connection = FDConn
    Left = 176
    Top = 32
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 72
    Top = 96
  end
end
