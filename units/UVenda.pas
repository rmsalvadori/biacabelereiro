unit UVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.Imaging.pngimage, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFrmVenda = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    TBSalvar: TSpeedButton;
    TBExcluir: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    TBNovo: TSpeedButton;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton2: TSpeedButton;
    DBENome: TDBEdit;
    DBEdtTel: TDBEdit;
    DataSource2: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBCheckBox1: TDBCheckBox;
    procedure TBSalvarClick(Sender: TObject);
    procedure TBExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBNovoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    procedure atualizaItensVendas;
    { Private declarations }
  public
  end;

var
  FrmVenda: TFrmVenda;

implementation

{$R *.dfm}

uses UDM, UNovoItemVenda, UBuscaClientes;

procedure TFrmVenda.atualizaItensVendas;
begin
  DataSource2.DataSet.Filter := 'id_venda = ' +
    inttostr(DataSource1.DataSet.FieldByName('id').AsInteger);
  DataSource2.DataSet.Refresh;
end;

procedure TFrmVenda.DBGrid1DblClick(Sender: TObject);
begin
  if not(DataSource2.DataSet.FieldByName('id').AsString = '') then
  begin
    if (DataSource1.DataSet.State in [dsEdit, dsInsert]) then
    begin
      DataSource1.DataSet.Post;
      if DataSource1.DataSet.State in [dsInsert] then
        DataSource1.DataSet.Last;
    end;
    FrmNovoItemVenda.DataSource1.DataSet.Locate('id',
      DataSource2.DataSet.FieldByName('id').AsInteger, []);
    FrmNovoItemVenda.DataSource1.DataSet.Edit;
    FrmNovoItemVenda.ShowModal;
    atualizaItensVendas;
  end;
end;

procedure TFrmVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Key := 0; { ignore }
end;

procedure TFrmVenda.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    DataSource1.DataSet.Edit;
    FrmVenda.ShowModal;
  end;
end;

procedure TFrmVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DataSource1.State in [dsInsert, dsEdit] then
    DataSource1.DataSet.Cancel;
    ModalResult := mrCancel
end;

procedure TFrmVenda.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TFrmVenda.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    DataSource1.DataSet.Cancel;
    Close;
  end;
end;

procedure TFrmVenda.FormShow(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  atualizaItensVendas
end;

procedure TFrmVenda.SpeedButton1Click(Sender: TObject);
begin
  if FrmBuscaClientes.ShowModal = mrOk then
  begin
    if not(DataSource1.DataSet.State in [dsEdit, dsInsert]) then
      DataSource1.DataSet.Edit;
    DataSource1.DataSet.FieldByName('id_cliente').AsInteger :=
      FrmBuscaClientes.DataSource1.DataSet.FieldByName('id').AsInteger;
    DataSource1.DataSet.FieldByName('cliente').AsString :=
      FrmBuscaClientes.DataSource1.DataSet.FieldByName('nome').AsString;
    DataSource1.DataSet.FieldByName('telefone').AsString :=
      FrmBuscaClientes.DataSource1.DataSet.FieldByName('telefone').AsString;
    DBENome.Enabled := false;
    DBEdtTel.Enabled := false;
  end;

end;

procedure TFrmVenda.SpeedButton2Click(Sender: TObject);
begin
  if not(DataSource1.DataSet.State in [dsEdit, dsInsert]) then
    DataSource1.DataSet.Edit;

  DataSource1.DataSet.FieldByName('id_cliente').Clear;
  DataSource1.DataSet.FieldByName('cliente').Clear;
  DataSource1.DataSet.FieldByName('telefone').Clear;
  DBENome.Enabled := true;
  DBEdtTel.Enabled := true;

end;

procedure TFrmVenda.TBExcluirClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Deseja mesmo excluir essa venda?'),
    PChar('Confirmar'), MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDYES
  then
  begin
    DataSource1.DataSet.FieldByName('excluido').AsBoolean := true;
    DataSource1.DataSet.Post;
    Close;
  end;

end;

procedure TFrmVenda.TBNovoClick(Sender: TObject);
begin
  if (DataSource1.DataSet.State in [dsEdit]) then
  begin
      DataSource1.DataSet.Post;
  end;
  if DataSource1.DataSet.State in [dsInsert] then
  begin
    DataSource1.DataSet.Post;
    DataSource1.DataSet.Last;
  end;
  FrmNovoItemVenda.DataSource1.DataSet.Insert;
  FrmNovoItemVenda.DataSource1.DataSet.FieldByName('id_venda').AsInteger :=
    DataSource1.DataSet.FieldByName('id').AsInteger;
  FrmNovoItemVenda.DataSource1.DataSet.FieldByName('cartao').AsBoolean := false;
  FrmNovoItemVenda.ShowModal;
  atualizaItensVendas;

end;

procedure TFrmVenda.TBSalvarClick(Sender: TObject);
begin
  if (DataSource1.DataSet.State in [dsInsert]) then
  begin
    DataSource1.DataSet.Post;
    DataSource1.DataSet.Last;
  end
  else if (DataSource1.DataSet.State in [dsEdit]) then
  DataSource1.DataSet.Post;
  DataSource1.DataSet.Edit;
  atualizaItensVendas;
end;

end.
