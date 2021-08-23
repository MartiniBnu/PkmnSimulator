unit UntOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, StdCtrls, IniFiles, Buttons;

type
  TFrmOptions = class(TForm)
    BitBtn1: TBitBtn;
    BtnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    CmbOptListagens: TComboBox;
    LabOpt01: TRxLabel;
    CmbMostraNro: TComboBox;
    RxLabel1: TRxLabel;
    GroupBox2: TGroupBox;
    CmbOptSkins: TComboBox;
    LabOpt02: TRxLabel;
    procedure CmbOptSkinsChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure carregarSkins;
  private
    {}
  public
    { Public declarations }
  end;

var
  FrmOptions: TFrmOptions;

implementation

uses UntPrincipal;

{$R *.dfm}

procedure TFrmOptions.CmbOptSkinsChange(Sender: TObject);
var
  source : String;
begin
  source := CmbOptSkins.Items.Strings[CmbOptSkins.ItemIndex];
  FrmPrincipal.atualizaSkin(source);
end;

//gravando no .ini as configurações
procedure TFrmOptions.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
  //Fecha
  FrmOptions.Hide;
end;

procedure TFrmOptions.BtnCancelClick(Sender: TObject);
begin
  FrmOptions.Close;
end;

procedure TFrmOptions.FormCreate(Sender: TObject);
begin
  CmbOptListagens.ItemIndex := FrmPrincipal.OptList;
  CmbMostraNro.ItemIndex := FrmPrincipal.MostraNro;
  //Carregar as skins
  carregarSkins;
end;

//procura arquivos .skn e coloca como opção
procedure TFrmOptions.carregarSkins;
var
  Result : TSearchRec;
  Arquivos,i : Integer;
  CaminhoDasSkins : String;
begin
  CaminhoDasSkins := ExtractFilePath(Application.ExeName) + 'skins\*.skn';
  Arquivos := 0;
  Arquivos := Arquivos + faDirectory;
  Arquivos := Arquivos + faArchive;
  Arquivos := Arquivos + faAnyFile;
  if FindFirst(CaminhoDasSkins, Arquivos, Result) = 0 then
  begin
    //adiciona o primeiro
    CmbOptSkins.Items.Add(Result.Name);
    //continua a procurar
    while FindNext(Result) = 0 do
    begin
      //elimina o diretorio ..
      if (Result.Name <> '..') then
      begin
        CmbOptSkins.Items.Add(Result.Name);
      end;
    end;
    FindClose(Result);
  end;
  //Se possuir valor de Skin gravado, deixa selecionado
  if(FrmPrincipal.Skin <> '')then
    //iterar sobre a combo e procurar
    for i := 0 to CmbOptSkins.Items.Count - 1 do
      if(CmbOptSkins.Items.Strings[i]=FrmPrincipal.Skin)then
        CmbOptSkins.ItemIndex := i;
end;

end.
