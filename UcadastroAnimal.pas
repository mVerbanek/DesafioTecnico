unit UcadastroAnimal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Udm1;

type
  TFrmCadAnimal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBETag: TDBEdit;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBETagKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadAnimal: TFrmCadAnimal;

implementation

{$R *.dfm}

procedure TFrmCadAnimal.DBETagKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8, #27, #32]) then
  begin
    beep;
    key := #0;
  end;
end;

procedure TFrmCadAnimal.SpeedButton1Click(Sender: TObject);
begin
  DM1.FDQAnimal.Post;
  Close;
end;

procedure TFrmCadAnimal.SpeedButton2Click(Sender: TObject);
begin
  DM1.FDQAnimal.Cancel;
  Close;
end;

end.
