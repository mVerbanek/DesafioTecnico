unit Ucadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Udm1, UcadastroAnimal;

type
  TFrmCadastro = class(TForm)
    DBENome: TDBEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    SBCancelar: TSpeedButton;
    SBGravar: TSpeedButton;
    SBAdicionar: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBDeletar: TSpeedButton;
    Panel5: TPanel;
    Label3: TLabel;
    procedure SBGravarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBAdicionarClick(Sender: TObject);
    procedure DBENomeExit(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastro: TFrmCadastro;

implementation

{$R *.dfm}

procedure TFrmCadastro.DBENomeExit(Sender: TObject);
begin
  if DBENome.Text = EmptyStr then
  begin
    ShowMessage('Informe um Nome');
    DBENome.SetFocus;
  end;
end;

procedure TFrmCadastro.SBAdicionarClick(Sender: TObject);
var CadAnimal : TFrmCadAnimal;
begin
  try
    if DBENome.Text = EmptyStr then
       Exit;

    if DM1.FDQFazenda.State in [dsInsert] then
    begin
      DM1.FDQFazenda.Post;
      DM1.FDQFazenda.Edit;
    end;

    DM1.FDQAnimal.Insert;
    DM1.FDQAnimal.FieldByName('ID').AsInteger := DM1.GetProximoID('gerador_id_animal');
    DM1.FDQAnimal.FieldByName('ID_FAZENDA').AsInteger := DM1.FDQFazenda.FieldByName('ID').AsInteger;

    CadAnimal := TFrmCadAnimal.Create(self);
    CadAnimal.ShowModal;
  finally
    FreeAndNil(CadAnimal);
  end;
end;

procedure TFrmCadastro.SBAlterarClick(Sender: TObject);
var CadAnimal : TFrmCadAnimal;
begin
  if DBENome.Text = EmptyStr then
  Exit;

  try
    if DM1.FDQFazenda.State in [dsInsert] then
    begin
      DM1.FDQFazenda.Post;
      DM1.FDQFazenda.Edit;
    end;

    DM1.FDQAnimal.Edit;

    CadAnimal := TFrmCadAnimal.Create(self);
    CadAnimal.ShowModal;
  finally
    FreeAndNil(CadAnimal);
  end;

end;

procedure TFrmCadastro.SBCancelarClick(Sender: TObject);
begin
  if DM1.FDQFazenda.State in [dsInsert, dsEdit] then
     DM1.FDQFazenda.Cancel;

  DM1.FDConnection.Rollback;
  Close;
end;

procedure TFrmCadastro.SBDeletarClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     DM1.FDQAnimal.Delete;
end;

procedure TFrmCadastro.SBGravarClick(Sender: TObject);
begin

  if DM1.FDQFazenda.State in [dsInsert, dsEdit] then
     DM1.FDQFazenda.Post;

  DM1.FDConnection.Commit;
  Close;
end;

end.
