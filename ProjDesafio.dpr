program ProjDesafio;

uses
  Vcl.Forms,
  Upesquisa in 'Upesquisa.pas' {FrmPesquisa},
  Udm1 in 'Udm1.pas' {DM1: TDataModule},
  Ucadastro in 'Ucadastro.pas' {FrmCadastro},
  UcadastroAnimal in 'UcadastroAnimal.pas' {FrmCadAnimal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPesquisa, FrmPesquisa);
  Application.CreateForm(TDM1, DM1);
  Application.Run;
end.
