unit UServicosInsertEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.Imaging.pngimage, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFrmServicosInsertEdit = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    TBSalvar: TSpeedButton;
    TBExcluir: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
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
  FrmServicosInsertEdit: TFrmServicosInsertEdit;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmServicosInsertEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataSource1.State in [dsInsert,dsEdit] then
  DataSource1.DataSet.Cancel;
end;

procedure TFrmServicosInsertEdit.FormCreate(Sender: TObject);
begin
KeyPreview := true;
end;

procedure TFrmServicosInsertEdit.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    begin
      DataSource1.DataSet.Cancel;
      Close;
    end;
end;

procedure TFrmServicosInsertEdit.FormShow(Sender: TObject);
begin
  Left:=(Screen.Width-Width)  div 2;
  Top:=(Screen.Height-Height) div 2;
end;

procedure TFrmServicosInsertEdit.TBExcluirClick(Sender: TObject);
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

procedure TFrmServicosInsertEdit.TBSalvarClick(Sender: TObject);
begin
  DataSource1.DataSet.Post;
  ModalResult := mrOk;
end;

end.
