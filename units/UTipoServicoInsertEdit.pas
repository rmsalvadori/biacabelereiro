unit UTipoServicoInsertEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TFrmTipoServicoInsertEdit = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    TBSalvar: TSpeedButton;
    TBExcluir: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    DataSource1: TDataSource;
    procedure TBSalvarClick(Sender: TObject);
    procedure TBExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTipoServicoInsertEdit: TFrmTipoServicoInsertEdit;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmTipoServicoInsertEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataSource1.State in [dsInsert,dsEdit] then
  DataSource1.DataSet.Cancel;
end;

procedure TFrmTipoServicoInsertEdit.FormCreate(Sender: TObject);
begin
KeyPreview := true;
end;

procedure TFrmTipoServicoInsertEdit.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    begin
      DataSource1.DataSet.Cancel;
      Close;
    end;
end;

procedure TFrmTipoServicoInsertEdit.FormShow(Sender: TObject);
begin
  Left:=(Screen.Width-Width)  div 2;
  Top:=(Screen.Height-Height) div 2;
end;

procedure TFrmTipoServicoInsertEdit.TBExcluirClick(Sender: TObject);
begin
  if Application.MessageBox(
  PChar('Deseja cancelar as alterações?'),
  PChar('Confirmar'),
  MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDYES  then
    begin
      DataSource1.DataSet.Cancel;
      Close;
    end;

end;

procedure TFrmTipoServicoInsertEdit.TBSalvarClick(Sender: TObject);
begin
  DataSource1.DataSet.Post;
  ModalResult := mrOk;
end;

end.
