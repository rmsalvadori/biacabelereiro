unit UNovoItemVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.Imaging.pngimage, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFrmNovoItemVenda = class(TForm)
    Label2: TLabel;
    TBSalvar: TSpeedButton;
    TBExcluir: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBCheckBox1: TDBCheckBox;
    SpeedButton3: TSpeedButton;
    procedure TBSalvarClick(Sender: TObject);
    procedure TBExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
  private
    { Private declarations }
  public
    id_venda: integer;
  end;

var
  FrmNovoItemVenda: TFrmNovoItemVenda;

implementation

{$R *.dfm}

uses UDM, UBuscaColaborador, UBuscaServicos;

procedure TFrmNovoItemVenda.DataSource1StateChange(Sender: TObject);
begin
  if DataSource1.DataSet.State in [dsEdit] then
    TBExcluir.Enabled := true
  else
    TBExcluir.Enabled := false;
end;

procedure TFrmNovoItemVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Key := 0; { ignore }
end;

procedure TFrmNovoItemVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataSource1.State in [dsInsert, dsEdit] then
    DataSource1.DataSet.Cancel;
end;

procedure TFrmNovoItemVenda.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TFrmNovoItemVenda.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    DataSource1.DataSet.Cancel;
    Close;
  end;
end;

procedure TFrmNovoItemVenda.FormShow(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFrmNovoItemVenda.SpeedButton1Click(Sender: TObject);
begin
  if FrmBuscaServicos.ShowModal = mrOk then
  begin
    DataSource1.DataSet.FieldByName('id_servico').AsInteger :=
      FrmBuscaServicos.DataSource1.DataSet.FieldByName('id').AsInteger;
    DataSource1.DataSet.FieldByName('valor').AsFloat :=
      FrmBuscaServicos.DataSource1.DataSet.FieldByName('preco').AsFloat;
    DataSource1.DataSet.FieldByName('comis').AsFloat :=
      FrmBuscaServicos.DataSource1.DataSet.FieldByName('comis').AsFloat;
    DataSource1.DataSet.FieldByName('perc_cartao').AsInteger :=
      strtoint(dm.config1);
  end;

end;

procedure TFrmNovoItemVenda.SpeedButton2Click(Sender: TObject);
begin
  if FrmBuscaColaborador.ShowModal = mrOk then
  begin
    DataSource1.DataSet.FieldByName('id_colaborador').AsInteger :=
      FrmBuscaColaborador.DataSource1.DataSet.FieldByName('id').AsInteger;
  end;

end;

procedure TFrmNovoItemVenda.SpeedButton3Click(Sender: TObject);
begin
  if Application.MessageBox(PChar('Deseja cancelar as altera��es?'),
    PChar('Confirmar'), MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDYES
  then
  begin
    DataSource1.DataSet.Cancel;
    Close;
  end;
end;

procedure TFrmNovoItemVenda.TBExcluirClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Deseja excluir esse servi�o?'),
    PChar('Confirmar'), MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDYES
  then
  begin
    DataSource1.DataSet.FieldByName('excluido').AsBoolean := true;
    DataSource1.DataSet.Post;
    Close;
  end;

end;

procedure TFrmNovoItemVenda.TBSalvarClick(Sender: TObject);
begin
  DataSource1.DataSet.Post;
  ModalResult := mrOk;
end;

end.
