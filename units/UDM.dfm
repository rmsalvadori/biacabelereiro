object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 424
  Width = 835
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\BiaCabelereiro\db\db.db'
      'LockingMode=Normal'
      'SharedCache=False'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object cliente: TFDTable
    Active = True
    Filtered = True
    Filter = 'excluido = 0'
    IndexFieldNames = 'id'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    UpdateOptions.UpdateTableName = 'cliente'
    TableName = 'cliente'
    Left = 144
    Top = 16
    object clienteid: TFDAutoIncField
      Alignment = taLeftJustify
      DisplayLabel = 'Id'
      DisplayWidth = 5
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object clientenome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 27
    end
    object clientetelefone: TWideStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 17
      FieldName = 'telefone'
      Origin = 'telefone'
      EditMask = '00000-0000;1;_'
      Size = 40
    end
    object clienteendereco: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 30
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 150
    end
    object clienteobs: TWideStringField
      DisplayLabel = 'Observa'#231#227'o'
      DisplayWidth = 30
      FieldName = 'obs'
      Origin = 'obs'
      Size = 255
    end
    object clienteexcluido: TBooleanField
      FieldName = 'excluido'
      Origin = 'excluido'
      Visible = False
    end
  end
  object servico: TFDTable
    Active = True
    Filtered = True
    Filter = 'excluido = 0'
    IndexFieldNames = 'id'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    UpdateOptions.UpdateTableName = 'servico'
    TableName = 'servico'
    Left = 240
    Top = 16
    object servicoid: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object servicodesc: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descri'
      Origin = 'descri'
      Required = True
      Size = 30
    end
    object servicopreco: TFloatField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'preco'
      Origin = 'preco'
      Required = True
      currency = True
    end
    object servicocomis: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'comis'
      Origin = 'comis'
      Required = True
      DisplayFormat = '##%'
      EditFormat = '##'
      MaxValue = 100.000000000000000000
    end
    object servicoid_tipo_servico: TIntegerField
      FieldName = 'id_tipo_servico'
      Origin = 'id_tipo_servico'
      Required = True
      Visible = False
    end
    object servicoexcluido: TBooleanField
      FieldName = 'excluido'
      Origin = 'excluido'
      Visible = False
    end
    object servicotipo_servico: TWideStringField
      FieldKind = fkLookup
      FieldName = 'tipo_servico'
      LookupDataSet = tipo_servico
      LookupKeyFields = 'id'
      LookupResultField = 'desc'
      KeyFields = 'id_tipo_servico'
      Size = 150
      Lookup = True
    end
  end
  object colaborador: TFDTable
    Active = True
    Filtered = True
    Filter = 'excluido = 0'
    IndexFieldNames = 'id'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    UpdateOptions.UpdateTableName = 'colaborador'
    TableName = 'colaborador'
    Left = 456
    Top = 16
    object colaboradorid: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object colaboradornome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 28
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 32767
    end
    object colaboradortelefone: TWideStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 13
      FieldName = 'telefone'
      Origin = 'telefone'
      EditMask = '00000-0000;1;_'
    end
    object colaboradorexcluido: TBooleanField
      FieldName = 'excluido'
      Origin = 'excluido'
      Visible = False
    end
    object colaboradorinativo: TBooleanField
      FieldName = 'inativo'
      Origin = 'inativo'
      Visible = False
    end
  end
  object tipo_servico: TFDTable
    Active = True
    Filtered = True
    Filter = 'excluido = 0'
    IndexFieldNames = 'id'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    UpdateOptions.UpdateTableName = 'tipo_servico'
    TableName = 'tipo_servico'
    Left = 344
    Top = 16
    object tipo_servicoid: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 6
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tipo_servicodesc: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 34
      FieldName = 'desc'
      Origin = '"desc"'
      Required = True
      Size = 60
    end
    object tipo_servicoexcluido: TBooleanField
      FieldName = 'excluido'
      Origin = 'excluido'
      Visible = False
    end
  end
  object item_venda: TFDTable
    Active = True
    Filter = 'excluido = 0'
    IndexFieldNames = 'id'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    UpdateOptions.UpdateTableName = 'item_venda'
    TableName = 'item_venda'
    Left = 656
    Top = 16
    object item_vendaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object item_vendaid_servico: TWideStringField
      FieldName = 'id_servico'
      Origin = 'id_servico'
      Required = True
      Size = 32767
    end
    object item_vendaid_colaborador: TWideStringField
      FieldName = 'id_colaborador'
      Origin = 'id_colaborador'
      Required = True
      Size = 32767
    end
    object item_vendaid_venda: TIntegerField
      FieldName = 'id_venda'
      Origin = 'id_venda'
      Required = True
    end
    object item_vendavalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      currency = True
    end
    object item_vendacartao: TBooleanField
      FieldName = 'cartao'
      Origin = 'cartao'
      Required = True
      DisplayValues = #39'T;F'#39';'
    end
    object item_vendaperc_cartao: TIntegerField
      FieldName = 'perc_cartao'
      Origin = 'perc_cartao'
      Required = True
    end
    object item_vendacomis: TFloatField
      FieldName = 'comis'
      Origin = 'comis'
      Required = True
      DisplayFormat = '##%'
      EditFormat = '##'
    end
    object item_vendaexcluido: TBooleanField
      FieldName = 'excluido'
      Origin = 'excluido'
    end
    object item_vendacolaborador: TWideStringField
      FieldKind = fkLookup
      FieldName = 'colaborador'
      LookupDataSet = colaborador
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'id_colaborador'
      Size = 150
      Lookup = True
    end
    object item_vendaservico: TWideStringField
      FieldKind = fkLookup
      FieldName = 'servico'
      LookupDataSet = servico
      LookupKeyFields = 'id'
      LookupResultField = 'descri'
      KeyFields = 'id_servico'
      Size = 150
      Lookup = True
    end
  end
  object vw_item_venda2: TFDTable
    OnCalcFields = vw_item_venda2CalcFields
    Filtered = True
    AggregatesActive = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    UpdateOptions.UpdateTableName = 'vw_item_venda'
    TableName = 'vw_item_venda'
    Left = 40
    Top = 320
    object vw_item_venda2id: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object vw_item_venda2servico: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'servico'
      Origin = 'descri'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object vw_item_venda2colaborador: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'colaborador'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object vw_item_venda2valor_descontado_cartao: TFloatField
      DefaultExpression = '0'
      FieldName = 'valor_descontado_cartao'
      Origin = 'valor_descontado_cartao'
    end
    object vw_item_venda2valor_comiss: TFloatField
      FieldName = 'valor_comiss'
      Origin = 'valor_comiss'
    end
    object vw_item_venda2v_cartao: TFloatField
      FieldName = 'v_cartao'
      Origin = 'v_cartao'
    end
    object vw_item_venda2v_dinheiro: TFloatField
      FieldName = 'v_dinheiro'
      Origin = 'v_dinheiro'
    end
    object vw_item_venda2cartaoflag: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'cartaoflag'
    end
    object vw_item_venda2id_venda: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'id_venda'
      Origin = 'id_venda'
      ProviderFlags = []
      ReadOnly = True
    end
    object vw_item_venda2cartao: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'cartao'
      Origin = 'cartao'
      ProviderFlags = []
      ReadOnly = True
    end
    object vw_item_venda2valor: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      ProviderFlags = []
      ReadOnly = True
    end
    object vw_item_venda2total: TAggregateField
      FieldName = 'total'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor)'
    end
    object vw_item_venda2totalcomiss: TAggregateField
      FieldName = 'totalcomiss'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_comiss)'
    end
    object vw_item_venda2totaldinheiro: TAggregateField
      FieldName = 'totaldinheiro'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(v_dinheiro)'
    end
    object vw_item_venda2totalcartao: TAggregateField
      FieldName = 'totalcartao'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(v_cartao)'
    end
  end
  object qry_vw_lista_vendas: TFDQuery
    Active = True
    AggregatesActive = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    SQL.Strings = (
      
        'SELECT id, valor as "valor::FLOAT", nome, data, valor_descontado' +
        '_cartao as "valor_descontado_cartao::FLOAT", '
      
        'v_cartao as "v_cartao::FLOAT", v_dinheiro as "v_dinheiro::FLOAT"' +
        ', valor_comiss as "valor_comiss::FLOAT"   FROM VW_LISTA_VENDAs')
    Left = 40
    Top = 256
    object qry_vw_lista_vendasid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qry_vw_lista_vendasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 32767
    end
    object qry_vw_lista_vendasvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      currency = True
    end
    object qry_vw_lista_vendasdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object qry_vw_lista_vendasvalor_descontado_cartao: TFloatField
      FieldName = 'valor_descontado_cartao'
      Origin = 'valor_descontado_cartao'
    end
    object qry_vw_lista_vendasvalor_comiss: TFloatField
      FieldName = 'valor_comiss'
      Origin = 'valor_comiss'
      currency = True
    end
    object qry_vw_lista_vendasv_cartao: TFloatField
      FieldName = 'v_cartao'
      Origin = 'v_cartao'
      currency = True
    end
    object qry_vw_lista_vendasv_dinheiro: TFloatField
      FieldName = 'v_dinheiro'
      Origin = 'v_dinheiro'
      currency = True
    end
    object qry_vw_lista_vendastotalcartao: TAggregateField
      DefaultExpression = '0'
      FieldName = 'totalcartao'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(v_cartao)'
    end
    object qry_vw_lista_vendastotaldinheiro: TAggregateField
      DefaultExpression = '0'
      FieldName = 'totaldinheiro'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(v_dinheiro)'
    end
    object qry_vw_lista_vendastotalcomiss: TAggregateField
      DefaultExpression = '0'
      FieldName = 'totalcomiss'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_comiss)'
    end
    object qry_vw_lista_vendastotal: TAggregateField
      DefaultExpression = '0'
      FieldName = 'total'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor)'
    end
  end
  object qry_update_config: TFDQuery
    AggregatesActive = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll]
    FetchOptions.RowsetSize = -1
    SQL.Strings = (
      'UPDATE config SET valor = :valor WHERE id = :config')
    Left = 176
    Top = 256
    ParamData = <
      item
        Name = 'VALOR'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CONFIG'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object config: TFDTable
    Active = True
    Filtered = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    UpdateOptions.UpdateTableName = 'config'
    TableName = 'config'
    Left = 744
    Top = 16
    object configid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object configdescri: TStringField
      FieldName = 'descri'
      Origin = 'descri'
      Required = True
      Size = 60
    end
    object configvalor: TWideStringField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Size = 32767
    end
  end
  object qry_vw_comissoes: TFDQuery
    AggregatesActive = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    SQL.Strings = (
      
        'SELECT id, valor,data,cliente,descri,comis,id_colaborador,colabo' +
        'rador,valor_comiss as "valor_comiss::FLOAT",cartao FROM vw_comis' +
        'soes'
      'where data between :dataini and :datafim')
    Left = 320
    Top = 264
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftString
        ParamType = ptInput
        Value = '2018-09-01'
      end
      item
        Name = 'DATAFIM'
        DataType = ftString
        ParamType = ptInput
        Value = '2018-09-30'
      end>
    object qry_vw_comissoesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qry_vw_comissoesvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
    end
    object qry_vw_comissoesdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object qry_vw_comissoescliente: TWideStringField
      FieldName = 'cliente'
      Origin = 'cliente'
      Size = 160
    end
    object qry_vw_comissoesdescri: TWideStringField
      FieldName = 'descri'
      Origin = 'descri'
      Required = True
      Size = 50
    end
    object qry_vw_comissoescomis: TFloatField
      FieldName = 'comis'
      Origin = 'comis'
      Required = True
    end
    object qry_vw_comissoescolaborador: TWideStringField
      FieldName = 'colaborador'
      Origin = 'colaborador'
      Required = True
      Size = 32767
    end
    object qry_vw_comissoesvalor_comiss: TFloatField
      FieldName = 'valor_comiss'
      Origin = 'valor_comiss'
    end
    object qry_vw_comissoescartao: TBooleanField
      FieldName = 'cartao'
      Origin = 'cartao'
      Required = True
    end
    object qry_vw_comissoesid_colaborador: TFDAutoIncField
      FieldName = 'id_colaborador'
      Origin = 'id_colaborador'
      ProviderFlags = [pfInWhere, pfInKey]
    end
  end
  object venda: TFDTable
    Active = True
    Filtered = True
    Filter = 'excluido = 0'
    IndexFieldNames = 'id'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    UpdateOptions.UpdateTableName = 'venda'
    TableName = 'venda'
    Left = 560
    Top = 16
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'cliente'
      Origin = 'cliente'
      Size = 160
    end
    object WideStringField2: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 30
    end
    object DateField1: TDateField
      FieldName = 'data'
      Origin = 'data'
      EditMask = '!99/99/00;1;_'
    end
    object WideStringField3: TWideStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 150
    end
    object WideStringField4: TWideStringField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
      Size = 32767
    end
    object BooleanField1: TBooleanField
      FieldName = 'excluido'
      Origin = 'excluido'
    end
    object vendarequisicao: TBooleanField
      FieldName = 'requisicao'
      Origin = 'requisicao'
    end
  end
  object vw_item_venda: TFDQuery
    Active = True
    Filtered = True
    AggregatesActive = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    SQL.Strings = (
      
        'SELECT id as "id::INTEGER", id_venda as "id_venda::INTEGER", car' +
        'tao AS "cartao::Boolean",servico, colaborador, valor as "valor::' +
        'FLOAT", valor_descontado_cartao as "valor_descontado_cartao::FLO' +
        'AT", '
      
        'v_cartao as "v_cartao::FLOAT", v_dinheiro as "v_dinheiro::FLOAT"' +
        ', valor_comiss as "valor_comiss::FLOAT"   FROM VW_item_venda')
    Left = 176
    Top = 320
    object vw_item_vendaIntegerField: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object vw_item_vendaWideStringField: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'servico'
      Origin = 'descri'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object vw_item_vendaWideStringField2: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'colaborador'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object vw_item_vendaFloatField: TFloatField
      DefaultExpression = '0'
      FieldName = 'valor_descontado_cartao'
      Origin = 'valor_descontado_cartao'
    end
    object vw_item_vendaFloatField2: TFloatField
      FieldName = 'valor_comiss'
      Origin = 'valor_comiss'
    end
    object vw_item_vendaFloatField3: TFloatField
      FieldName = 'v_cartao'
      Origin = 'v_cartao'
    end
    object vw_item_vendaFloatField4: TFloatField
      FieldName = 'v_dinheiro'
      Origin = 'v_dinheiro'
    end
    object vw_item_vendaStringField: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'cartaoflag'
    end
    object vw_item_vendaFloatField5: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      ProviderFlags = []
      ReadOnly = True
    end
    object vw_item_vendaid_venda: TIntegerField
      FieldName = 'id_venda'
      Origin = 'id_venda'
    end
    object vw_item_vendacartao: TBooleanField
      FieldName = 'cartao'
      Origin = 'cartao'
    end
    object vw_item_vendatotalcartao: TAggregateField
      FieldName = 'totalcartao'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(v_cartao)'
    end
    object vw_item_vendatotaldinheiro: TAggregateField
      FieldName = 'totaldinheiro'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(v_dinheiro)'
    end
    object vw_item_vendatotalcomiss: TAggregateField
      FieldName = 'totalcomiss'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_comiss)'
    end
    object vw_item_vendatotal: TAggregateField
      FieldName = 'total'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor)'
    end
  end
  object qry_atualizacoes: TFDQuery
    Connection = FDConnection1
    Left = 744
    Top = 256
  end
  object qry_vw_comissoes_colaborador: TFDQuery
    AggregatesActive = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evAutoFetchAll]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = -1
    SQL.Strings = (
      
        'SELECT id, valor,data,cliente,descri,comis,id_colaborador, colab' +
        'orador,valor_comiss as "valor_comiss::FLOAT",cartao FROM vw_comi' +
        'ssoes'
      'where data between :dataini and :datafim')
    Left = 320
    Top = 320
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftString
        ParamType = ptInput
        Value = '2018-09-01'
      end
      item
        Name = 'DATAFIM'
        DataType = ftString
        ParamType = ptInput
        Value = '2018-09-30'
      end>
    object FDAutoIncField2: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FloatField1: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
    end
    object DateField2: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object WideStringField5: TWideStringField
      FieldName = 'cliente'
      Origin = 'cliente'
      Size = 160
    end
    object WideStringField6: TWideStringField
      FieldName = 'descri'
      Origin = 'descri'
      Required = True
      Size = 50
    end
    object FloatField2: TFloatField
      FieldName = 'comis'
      Origin = 'comis'
      Required = True
    end
    object WideStringField7: TWideStringField
      FieldName = 'colaborador'
      Origin = 'colaborador'
      Required = True
      Size = 32767
    end
    object FloatField3: TFloatField
      FieldName = 'valor_comiss'
      Origin = 'valor_comiss'
    end
    object BooleanField2: TBooleanField
      FieldName = 'cartao'
      Origin = 'cartao'
      Required = True
    end
    object qry_vw_comissoes_colaboradorid_colaborador: TFDAutoIncField
      FieldName = 'id_colaborador'
      Origin = 'id_colaborador'
      ProviderFlags = [pfInWhere, pfInKey]
    end
  end
end
