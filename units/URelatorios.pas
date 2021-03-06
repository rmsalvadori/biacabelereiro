unit URelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, frxClass, frxDBSet;

type
  TFrmRelatorios = class(TForm)
    Panel3: TPanel;
    Label6: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    dtpDataIniRelComi: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dtpDataFimRelComi: TDateTimePicker;
    ReportComissoes: TfrxReport;
    DsReportComissoes: TfrxDBDataset;
    DSComissoes: TDataSource;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    frxDBDataset1: TfrxDBDataset;
    DataSource2: TDataSource;
    frxReport1: TfrxReport;
    LblIdColaborador: TLabel;
    lblColaborador: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorios: TFrmRelatorios;

implementation

{$R *.dfm}

uses UDM, UBuscaColaborador;

procedure TFrmRelatorios.Button1Click(Sender: TObject);
begin

if CheckBox1.Checked then
begin
 dm.qry_vw_comissoes_colaborador.Close;
dm.qry_vw_comissoes_colaborador.sql.Clear;
dm.qry_vw_comissoes_colaborador.SQL.add ( 'SELECT id,' +
                                        'valor,data,cliente,' +
                                        'descri,comis,id_colaborador, colaborador,' +
                                        'valor_comiss as "valor_comiss::FLOAT",cartao ' +
                                        'FROM vw_comissoes where data between ' +
                                        quotedstr(formatdatetime('yyyy-mm-dd', dtpDataIniRelComi.Date)) +
                                        'and ' + quotedstr(formatdatetime('yyyy-mm-dd', dtpDataFimRelComi.Date))  +
                                        'and id_colaborador = ' + LblIdColaborador.Caption);

dm.qry_vw_comissoes_colaborador.Open;
frxReport1.PrepareReport;
frxReport1.ShowPreparedReport;
end
else
begin

dm.qry_vw_comissoes.Close;
dm.qry_vw_comissoes.ParamByName('dataini').AsString := formatdatetime('yyyy-mm-dd', dtpDataIniRelComi.Date);
dm.qry_vw_comissoes.ParamByName('datafim').AsString := formatdatetime('yyyy-mm-dd', dtpDataFimRelComi.Date);
dm.qry_vw_comissoes.Open;
ReportComissoes.PrepareReport;
ReportComissoes.ShowPreparedReport;

end;

end;

procedure TFrmRelatorios.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
  begin
    if FrmBuscaColaborador.ShowModal = mrOk then
      begin
         LblIdColaborador.Caption := dm.colaborador.FieldByName('id').AsString;
         lblColaborador.Caption := dm.colaborador.FieldByName('nome').AsString;
      end
    else
    CheckBox1.Checked := false;
  end
else
  begin
   LblIdColaborador.Caption := '';
   lblColaborador.Caption := '';
  end;


end;

procedure TFrmRelatorios.FormCreate(Sender: TObject);
begin
KeyPreview := true;
end;

procedure TFrmRelatorios.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    begin
      Close;
    end;
end;

procedure TFrmRelatorios.FormShow(Sender: TObject);
begin
  Left:=(Screen.Width-Width)  div 2;
  Top:=(Screen.Height-Height) div 2;
  dtpDataIniRelComi.Date := Date;
  dtpDataFimRelComi.Date := Date;
end;

end.
