unit UClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TFrmClientes = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    TBNovo: TSpeedButton;
    TBEditar: TSpeedButton;
    TBExcluir: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    procedure TBNovoClick(Sender: TObject);
    procedure TBEditarClick(Sender: TObject);
    procedure TBExcluirClick(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClientes: TFrmClientes;

implementation

{$R *.dfm}

uses UDM, TypInfo, UClientesInsertEdit, FireDAC.Comp.Client;

procedure TFrmClientes.DBGrid1DblClick(Sender: TObject);
begin
  DataSource1.DataSet.Edit;
  FrmClientesInsertEdit.ShowModal;
end;

procedure TFrmClientes.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Key := 0; { ignore }
end;

procedure TFrmClientes.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    DataSource1.DataSet.Edit;
    FrmClientesInsertEdit.ShowModal;
  end;
end;

procedure TFrmClientes.DBGrid1TitleClick(Column: TColumn);
var
  tabela: TFDTable;
begin
  tabela := dm.cliente;
  if tabela.IndexFieldNames = Column.FieldName + ':A' then
    tabela.IndexFieldNames := Column.FieldName + ':D'
  else
    tabela.IndexFieldNames := Column.FieldName + ':A';

end;

procedure TFrmClientes.Edit1Change(Sender: TObject);
begin
  DataSource1.DataSet.Filter := 'nome like ''%' + Edit1.Text +
    '%'' AND excluido = 0';
  DataSource1.DataSet.FilterOptions := [foCaseInsensitive, foNoPartialCompare];
end;

procedure TFrmClientes.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_DOWN then
  begin
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TFrmClientes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    Edit1.SetFocus;
  if Key = VK_ESCAPE then
    Close;
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  DataSource1.DataSet.Filter := 'excluido = 0';
  Edit1.Text:='';
end;

procedure TFrmClientes.TBEditarClick(Sender: TObject);
begin
  DataSource1.DataSet.Edit;
  FrmClientesInsertEdit.ShowModal;
end;

procedure TFrmClientes.TBExcluirClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Deseja excluir o registro?'),
    PChar('Confirmar'), MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDYES
  then
  begin
    DataSource1.DataSet.Edit;
    DataSource1.DataSet.FieldByName('excluido').AsBoolean := true;
    DataSource1.DataSet.Post;
  end;
end;

procedure TFrmClientes.TBNovoClick(Sender: TObject);
begin
  DataSource1.DataSet.Append;
  if FrmClientesInsertEdit.ShowModal = mrOk then
  begin
    Edit1.Text := '';
    DataSource1.DataSet.Last;
  end;
end;

end.
