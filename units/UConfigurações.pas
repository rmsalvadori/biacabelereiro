unit UConfigura��es;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TFrmConfiguracoes = class(TForm)
    Label1: TLabel;
    TBSalvar: TSpeedButton;
    TBExcluir: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    EdtConfig1: TMaskEdit;
    SpeedButton1: TSpeedButton;
    SaveDialog1: TSaveDialog;
    procedure TBSalvarClick(Sender: TObject);
    procedure TBExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfiguracoes: TFrmConfiguracoes;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmConfiguracoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EdtConfig1.Text := dm.config1;
end;

procedure TFrmConfiguracoes.FormCreate(Sender: TObject);
begin
KeyPreview := true;
EdtConfig1.Text := DM.config1;
end;

procedure TFrmConfiguracoes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    begin
      EdtConfig1.Text := dm.config1;
      Close;
    end;
end;

procedure TFrmConfiguracoes.FormShow(Sender: TObject);
begin
  Left:=(Screen.Width-Width)  div 2;
  Top:=(Screen.Height-Height) div 2;
end;

procedure TFrmConfiguracoes.SpeedButton1Click(Sender: TObject);
var
wstring:pwidechar;
begin
SaveDialog1.FileName := 'db_bkp_'+formatdatetime('dd_mm_yyyy',date);
if SaveDialog1.Execute Then
Begin
//showmessage(SaveDialog1.FileName);
wstring := pwidechar(SaveDialog1.FileName);
//showmessage(wstring);
if CopyFile('C:\BiaCabelereiro\db\db.db',wstring , False) then
     MessageDlg('Backup realizado com sucesso!',mtInformation,[mbOK],0)
 else
     MessageDlg('Problema ao realizar o backup, por favor fa�a manualmente.',mtError,[mbOK],0);
End;
end;

procedure TFrmConfiguracoes.TBExcluirClick(Sender: TObject);
begin
  if Application.MessageBox(
  PChar('Deseja cancelar as altera��es?'),
  PChar('Confirmar'),
  MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDYES  then
    begin
      EdtConfig1.Text := dm.config1;
      Close;
    end;

end;

procedure TFrmConfiguracoes.TBSalvarClick(Sender: TObject);
var
  N: Integer;
begin
  try
    N := StrToInt(Trim(EdtConfig1.Text));
    dm.config1 := IntToStr(N);
    dm.atualizaConfig;
    EdtConfig1.Text :=  dm.config1;
    ModalResult := mrOk;
  except
    MessageDlg('O Percentual digitado n�o � v�lido.',mtError,[mbOK],0);
    EdtConfig1.SetFocus;
    EdtConfig1.Text :=  dm.config1;
  end;


end;

end.
