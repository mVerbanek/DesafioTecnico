unit Upesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Datasnap.DBClient, Udm1, Ucadastro;

type
  TFrmPesquisa = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    SBImprimir: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBInserir: TSpeedButton;
    SBDeletar: TSpeedButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    procedure SBInserirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBDeletarClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

procedure TFrmPesquisa.SBAlterarClick(Sender: TObject);
var TelaCadastro : TFrmCadastro;
begin
  try
    TelaCadastro := TFrmCadastro.Create(self);

    DM1.FDConnection.StartTransaction;
    DM1.FDQFazenda.Edit;

    TelaCadastro.ShowModal;

    DM1.FDQFazenda.Close;
    DM1.FDQFazenda.Open;
  finally
    FreeAndNil(TelaCadastro);
  end;
end;

procedure TFrmPesquisa.SBDeletarClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     DM1.FDQFazenda.Delete;
end;

procedure TFrmPesquisa.SBImprimirClick(Sender: TObject);
begin
   DM1.Imprimir;
end;

procedure TFrmPesquisa.SBInserirClick(Sender: TObject);
var TelaCadastro : TFrmCadastro;
begin
  try
    TelaCadastro := TFrmCadastro.Create(self);

    DM1.FDConnection.StartTransaction;
    DM1.FDQFazenda.Insert;
    DM1.FDQFazenda.FieldByName('ID').AsInteger := DM1.GetProximoID('gerador_id_fazenda');

    TelaCadastro.ShowModal;

    DM1.FDQFazenda.Close;
    DM1.FDQFazenda.Open;
  finally
    FreeAndNil(TelaCadastro);
  end;
end;

end.
