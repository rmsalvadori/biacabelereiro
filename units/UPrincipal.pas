unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.WinXPickers, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.DBCtrls;

type
  TFrmPrincipal = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    dtpData: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    TBNovo: TSpeedButton;
    DBGrid1: TDBGrid;
    DBText4: TDBText;
    DBText2: TDBText;
    Label5: TLabel;
    DBText1: TDBText;
    Label6: TLabel;
    DBText3: TDBText;
    DataSource1: TDataSource;
    SpeedButton6: TSpeedButton;
    lblversao: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure dtpDataChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    procedure filtraData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UClientes, UServicos, UTipoServico, UColaborador, UClientesInsertEdit,
  UVenda, UDM, UConfigurações, URelatorios;

procedure TFrmPrincipal.DBGrid1CellClick(Column: TColumn);
begin
  FrmVenda.DataSource1.DataSet.Locate('id',
    DataSource1.DataSet.FieldByName('id').AsInteger, []);
end;

procedure TFrmPrincipal.DBGrid1DblClick(Sender: TObject);
begin
  if DataSource1.DataSet.FieldByName('id').AsInteger > 0 then
  begin
    FrmVenda.DataSource1.DataSet.Edit;
    if FrmVenda.DataSource1.DataSet.FieldByName('id_cliente').AsString = '' then
    begin
      FrmVenda.DBENome.Enabled := true;
      FrmVenda.DBEdtTel.Enabled := true;
    end
    else
    begin
      FrmVenda.DBENome.Enabled := false;
      FrmVenda.DBEdtTel.Enabled := false;
    end;
    FrmVenda.ShowModal;
    filtraData;
  end;
end;

procedure TFrmPrincipal.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Key := 0; { ignore }
end;

procedure TFrmPrincipal.dtpDataChange(Sender: TObject);
begin
  filtraData;

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  dtpData.date := date;
  filtraData;
  lblversao.Caption := 'Versão: ' + dm.config2;
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  FrmClientes.ShowModal;
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  FrmServicos.ShowModal;
end;

procedure TFrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  FrmTipoServico.ShowModal;
end;

procedure TFrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  FrmColaborador.ShowModal;
end;

procedure TFrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
  FrmConfiguracoes.ShowModal;
end;

procedure TFrmPrincipal.SpeedButton6Click(Sender: TObject);
begin
  FrmRelatorios.ShowModal;
end;

procedure TFrmPrincipal.TBNovoClick(Sender: TObject);
begin
  FrmVenda.DataSource1.DataSet.Insert;
  FrmVenda.DataSource1.DataSet.FieldByName('cliente').Clear;
  FrmVenda.DataSource1.DataSet.FieldByName('telefone').Clear;
  FrmVenda.DBENome.Enabled := true;
  FrmVenda.DBEdtTel.Enabled := true;
  FrmVenda.DataSource1.DataSet.FieldByName('data').AsDateTime := dtpData.date;
  FrmVenda.ShowModal;
  filtraData;
end;

procedure TFrmPrincipal.filtraData;
begin
  try
    begin
      with DM.qry_vw_lista_vendas do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT id, valor as "valor::FLOAT", nome, data,   ' +
          'valor_descontado_cartao as "valor_descontado_cartao::FLOAT", ' +
          'v_cartao as "v_cartao::FLOAT", v_dinheiro as "v_dinheiro::FLOAT",' +
          'valor_comiss as "valor_comiss::FLOAT"   FROM VW_LISTA_VENDAs    ' +
          'where Data = ' + quotedstr(formatdatetime('yyyy-mm-dd',
          dtpData.date)));
        open;
      end;
    end;
  except
  end;
end;

end.
