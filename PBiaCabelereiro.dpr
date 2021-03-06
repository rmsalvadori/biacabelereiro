program PBiaCabelereiro;

uses
  Vcl.Forms,
  UPrincipal in 'units\UPrincipal.pas' {FrmPrincipal},
  UDM in 'units\UDM.pas' {DM: TDataModule},
  UClientes in 'units\UClientes.pas' {FrmClientes},
  UServicos in 'units\UServicos.pas' {FrmServicos},
  UServicosInsertEdit in 'units\UServicosInsertEdit.pas' {FrmServicosInsertEdit},
  UTipoServico in 'units\UTipoServico.pas' {FrmTipoServico},
  UTipoServicoInsertEdit in 'units\UTipoServicoInsertEdit.pas' {FrmTipoServicoInsertEdit},
  UColaborador in 'units\UColaborador.pas' {FrmColaborador},
  UColaboradorInsertEdit in 'units\UColaboradorInsertEdit.pas' {FrmColaboradorInsertEdit},
  UVenda in 'units\UVenda.pas' {FrmVenda},
  UNovoItemVenda in 'units\UNovoItemVenda.pas' {FrmNovoItemVenda},
  UBuscaClientes in 'units\UBuscaClientes.pas' {FrmBuscaClientes},
  UBuscaColaborador in 'units\UBuscaColaborador.pas' {FrmBuscaColaborador},
  UBuscaServicos in 'units\UBuscaServicos.pas' {FrmBuscaServicos},
  UClientesInsertEdit in 'units\UClientesInsertEdit.pas' {FrmClientesInsertEdit},
  UConfigurações in 'units\UConfigurações.pas' {FrmConfiguracoes},
  URelatorios in 'units\URelatorios.pas' {FrmRelatorios},
  UAtualizacoes in 'units\UAtualizacoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmClientes, FrmClientes);
  Application.CreateForm(TFrmServicos, FrmServicos);
  Application.CreateForm(TFrmServicosInsertEdit, FrmServicosInsertEdit);
  Application.CreateForm(TFrmTipoServico, FrmTipoServico);
  Application.CreateForm(TFrmTipoServicoInsertEdit, FrmTipoServicoInsertEdit);
  Application.CreateForm(TFrmColaborador, FrmColaborador);
  Application.CreateForm(TFrmClientesInsertEdit, FrmClientesInsertEdit);
  Application.CreateForm(TFrmColaboradorInsertEdit, FrmColaboradorInsertEdit);
  Application.CreateForm(TFrmVenda, FrmVenda);
  Application.CreateForm(TFrmNovoItemVenda, FrmNovoItemVenda);
  Application.CreateForm(TFrmBuscaClientes, FrmBuscaClientes);
  Application.CreateForm(TFrmBuscaColaborador, FrmBuscaColaborador);
  Application.CreateForm(TFrmBuscaServicos, FrmBuscaServicos);
  Application.CreateForm(TFrmClientesInsertEdit, FrmClientesInsertEdit);
  Application.CreateForm(TFrmConfiguracoes, FrmConfiguracoes);
  Application.CreateForm(TFrmRelatorios, FrmRelatorios);
  Application.Run;
end.
