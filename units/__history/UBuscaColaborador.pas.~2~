unit UBuscaColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TFrmBuscaColaborador = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel3: TPanel;
    Label6: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    TBSelecionar: TSpeedButton;
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TBSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    selecionado: integer;
  end;

var
  FrmBuscaColaborador: TFrmBuscaColaborador;

implementation

{$R *.dfm}

uses UDM, TypInfo, FireDAC.Comp.Client;

procedure TFrmBuscaColaborador.DBGrid1DblClick(Sender: TObject);
begin
  selecionado := DataSource1.DataSet.FieldByName('id').AsInteger;
  ModalResult := mrOk;
end;

procedure TFrmBuscaColaborador.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Key := 0; { ignore }
end;

procedure TFrmBuscaColaborador.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    selecionado := DataSource1.DataSet.FieldByName('id').AsInteger;
    ModalResult := mrOk;
  end;
end;

procedure TFrmBuscaColaborador.DBGrid1TitleClick(Column: TColumn);
var
  tabela: TFDTable;
begin
  tabela := dm.cliente;
  if tabela.IndexFieldNames = Column.FieldName + ':A' then
    tabela.IndexFieldNames := Column.FieldName + ':D'
  else
    tabela.IndexFieldNames := Column.FieldName + ':A';

end;

procedure TFrmBuscaColaborador.Edit1Change(Sender: TObject);
begin
  DataSource1.DataSet.Filter := 'nome like ''%' + Edit1.Text +
    '%'' AND excluido = 0';
  DataSource1.DataSet.FilterOptions := [foCaseInsensitive, foNoPartialCompare];
end;

procedure TFrmBuscaColaborador.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DOWN then
  begin
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmBuscaColaborador.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TFrmBuscaColaborador.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    Edit1.SetFocus;
  if Key = VK_ESCAPE then
    Close;
end;

procedure TFrmBuscaColaborador.FormShow(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFrmBuscaColaborador.TBSelecionarClick(Sender: TObject);
begin
  selecionado := DataSource1.DataSet.FieldByName('id').AsInteger;
  ModalResult := mrOk;
end;

end.
