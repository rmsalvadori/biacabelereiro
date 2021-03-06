unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    cliente: TFDTable;
    clienteid: TFDAutoIncField;
    clientetelefone: TWideStringField;
    clienteendereco: TWideStringField;
    clienteobs: TWideStringField;
    clienteexcluido: TBooleanField;
    clientenome: TWideStringField;
    servico: TFDTable;
    servicoid: TFDAutoIncField;
    servicodesc: TWideStringField;
    servicopreco: TFloatField;
    servicocomis: TFloatField;
    servicoid_tipo_servico: TIntegerField;
    servicoexcluido: TBooleanField;
    colaborador: TFDTable;
    tipo_servico: TFDTable;
    item_venda: TFDTable;
    tipo_servicoid: TFDAutoIncField;
    tipo_servicodesc: TWideStringField;
    tipo_servicoexcluido: TBooleanField;
    servicotipo_servico: TWideStringField;
    colaboradorid: TFDAutoIncField;
    colaboradornome: TWideStringField;
    colaboradortelefone: TWideStringField;
    colaboradorexcluido: TBooleanField;
    colaboradorinativo: TBooleanField;
    item_vendaid: TFDAutoIncField;
    item_vendaid_servico: TWideStringField;
    item_vendaid_colaborador: TWideStringField;
    item_vendavalor: TFloatField;
    item_vendacartao: TBooleanField;
    item_vendaexcluido: TBooleanField;
    item_vendaid_venda: TIntegerField;
    item_vendacolaborador: TWideStringField;
    item_vendaservico: TWideStringField;
    vw_item_venda2: TFDTable;
    vw_item_venda2servico: TWideStringField;
    vw_item_venda2colaborador: TWideStringField;
    vw_item_venda2total: TAggregateField;
    vw_item_venda2valor_descontado_cartao: TFloatField;
    vw_item_venda2valor_comiss: TFloatField;
    vw_item_venda2totalcomiss: TAggregateField;
    vw_item_venda2v_cartao: TFloatField;
    vw_item_venda2v_dinheiro: TFloatField;
    vw_item_venda2totaldinheiro: TAggregateField;
    vw_item_venda2totalcartao: TAggregateField;
    vw_item_venda2cartaoflag: TStringField;
    vw_item_venda2id: TIntegerField;
    qry_vw_lista_vendas: TFDQuery;
    qry_vw_lista_vendasid: TFDAutoIncField;
    qry_vw_lista_vendasnome: TWideStringField;
    qry_vw_lista_vendasvalor: TFloatField;
    qry_vw_lista_vendasdata: TDateField;
    qry_vw_lista_vendasvalor_descontado_cartao: TFloatField;
    qry_vw_lista_vendasvalor_comiss: TFloatField;
    qry_vw_lista_vendasv_cartao: TFloatField;
    qry_vw_lista_vendasv_dinheiro: TFloatField;
    qry_vw_lista_vendastotal: TAggregateField;
    qry_vw_lista_vendastotalcomiss: TAggregateField;
    qry_vw_lista_vendastotaldinheiro: TAggregateField;
    qry_vw_lista_vendastotalcartao: TAggregateField;
    item_vendacomis: TFloatField;
    qry_update_config: TFDQuery;
    config: TFDTable;
    configid: TFDAutoIncField;
    configdescri: TStringField;
    configvalor: TWideStringField;
    item_vendaperc_cartao: TIntegerField;
    qry_vw_comissoes: TFDQuery;
    venda: TFDTable;
    FDAutoIncField1: TFDAutoIncField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    DateField1: TDateField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    BooleanField1: TBooleanField;
    vw_item_venda2id_venda: TLargeintField;
    vw_item_venda2cartao: TLargeintField;
    qry_vw_comissoesid: TFDAutoIncField;
    qry_vw_comissoesvalor: TFloatField;
    qry_vw_comissoesdata: TDateField;
    qry_vw_comissoescliente: TWideStringField;
    qry_vw_comissoesdescri: TWideStringField;
    qry_vw_comissoescomis: TFloatField;
    qry_vw_comissoescolaborador: TWideStringField;
    qry_vw_comissoesvalor_comiss: TFloatField;
    vw_item_venda2valor: TFloatField;
    qry_vw_comissoescartao: TBooleanField;
    vw_item_venda: TFDQuery;
    vw_item_vendaIntegerField: TIntegerField;
    vw_item_vendaWideStringField: TWideStringField;
    vw_item_vendaWideStringField2: TWideStringField;
    vw_item_vendaFloatField: TFloatField;
    vw_item_vendaFloatField2: TFloatField;
    vw_item_vendaFloatField3: TFloatField;
    vw_item_vendaFloatField4: TFloatField;
    vw_item_vendaStringField: TStringField;
    vw_item_vendaFloatField5: TFloatField;
    vw_item_vendatotal: TAggregateField;
    vw_item_vendatotalcomiss: TAggregateField;
    vw_item_vendatotaldinheiro: TAggregateField;
    vw_item_vendatotalcartao: TAggregateField;
    vw_item_vendaid_venda: TIntegerField;
    vw_item_vendacartao: TBooleanField;
    qry_atualizacoes: TFDQuery;
    vendarequisicao: TBooleanField;
    qry_vw_comissoes_colaborador: TFDQuery;
    FDAutoIncField2: TFDAutoIncField;
    FloatField1: TFloatField;
    DateField2: TDateField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    FloatField2: TFloatField;
    WideStringField7: TWideStringField;
    FloatField3: TFloatField;
    BooleanField2: TBooleanField;
    qry_vw_comissoes_colaboradorid_colaborador: TFDAutoIncField;
    qry_vw_comissoesid_colaborador: TFDAutoIncField;
    procedure vw_item_venda2CalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    config1: String;
    config2: String;
    procedure atualizaConfig;
    procedure mostraMsg(msg : String);
  end;

var
  DM: TDM;

implementation

uses
  Vcl.Dialogs, UAtualizacoes;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  config.Filter := 'id = 1';
  config1 := config.FieldByName('valor').AsString;
  config.Filter := 'id = 2';
  config2 := config.FieldByName('valor').AsString;
  atualizacoes.atualizar;
end;

procedure TDM.atualizaConfig;
begin
  qry_update_config.ParamByName('valor').AsString := config1;
  qry_update_config.ParamByName('config').AsInteger := 1;
  qry_update_config.ExecSQL;
end;

procedure TDM.mostraMsg(msg:String);
begin
  MessageDlg(msg,mtError,[mbOK],0);
end;

procedure TDM.vw_item_venda2CalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('cartao').asBoolean then
    DataSet.FieldByName('CartaoFlag').AsString := 'SIM'
  else
    DataSet.FieldByName('CartaoFlag').AsString := 'N�O';
end;

end.
