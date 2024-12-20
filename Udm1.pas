unit Udm1;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, system.IniFiles, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  frxSmartMemo, frxClass, frxDBSet, frCoreClasses;

type
  TDM1 = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQFazenda: TFDQuery;
    FDQFazendaID: TIntegerField;
    FDQFazendaNOME: TStringField;
    FDQAnimal: TFDQuery;
    FDQAnimalID: TIntegerField;
    FDQAnimalTAG: TStringField;
    FDQAnimalID_FAZENDA: TIntegerField;
    DSFazenda: TDataSource;
    DSAnimal: TDataSource;
    FDQuery: TFDQuery;
    Relatorio: TfrxReport;
    RelDSFazenda: TfrxDBDataset;
    RelDSAnimal: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
    procedure DSFazendaDataChange(Sender: TObject; Field: TField);
  private
    LIniFile : TIniFile;
    const LUserName = 'SYSDBA';
    const LPassWord = 'masterkey';
  public
    function GetProximoID(nome: String) : Integer;
    procedure Imprimir;
  end;

var
  DM1: TDM1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM1.DataModuleCreate(Sender: TObject);
var
  LDatabase : string;
  LServidor : string;
  LPorta  : integer;
  LCaminho : string;
begin
  try
    FDConnection.Connected := False;
    LCaminho := ExtractFileDir(ParamStr(0)) + '\login.ini';
    FDPhysFBDriverLink1.VendorLib := ExtractFileDir(ParamStr(0)) + '\fbclient.dll';

    LIniFile := TIniFile.Create(LCaminho);

    LDatabase := LIniFile.ReadString('Conexao','Database','');
    LServidor := LIniFile.ReadString('Conexao','Servidor','');
    LPorta    := LIniFile.ReadInteger('Conexao','Porta', 0);

    FDConnection.Params.Values['Database']  := LDatabase;
    FDConnection.Params.Values['User_Name'] := LUserName;
    FDConnection.Params.Values['Password']  := LPassWord;
    FDConnection.Params.Values['Server']    := LServidor;
    FDConnection.Params.Values['Porta']     := LPorta.ToString;

    FDConnection.Connected := True;
  finally
    FreeAndNil(LIniFile);
  end;

  FDQFazenda.Open;
  FDQAnimal.Open;
end;

procedure TDM1.DSFazendaDataChange(Sender: TObject; Field: TField);
begin
  FDQAnimal.Close;
  FDQAnimal.ParamByName('IDFAZENDA').AsInteger := FDQFazenda.FieldByName('ID').AsInteger;
  FDQAnimal.Open;
end;

function TDM1.GetProximoID(nome: String): Integer;
begin
  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Text := 'SELECT GEN_ID('+nome+',1) from rdb$database';
  FDQuery.Open;

  Result := FDQuery.FieldByName('GEN_ID').AsInteger + 1;
end;

procedure TDM1.Imprimir;
begin
  Relatorio.ShowReport;
end;

end.
