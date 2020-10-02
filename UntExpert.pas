unit UntExpert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Gauges, ExtCtrls, Buttons, Grids, JPEG,
  Menus, ComObj, SHELLAPI, RxHints, RXSlider, GIFImage, RXCtrls;

Type
  tAtkPoks = packed record
  CodPkmn, CodAtk : Integer;
  Por : String[12];
end;

Type
  tTraits = packed record
    Cod : Integer;
    Nome : string[12];
    Descr: string[140];
end;

Type
  tPokes = packed record
    Cod : Integer;
    PKMN : string[10];
    Tipo1, Tipo2, Abilitie1, Abilitie2, EggGroup1, EggGroup2 : Integer;
    Steps, SexoF, SexoM : Real;
    BHP, BATK, BDEF, BSPE, BSAT, BSDF : integer;
end;

Type
  tGolpes = packed record
  cd_golpe : Integer;
  nm_golpe : String[12];
  cd_tipo, cd_categ, qt_poder, qt_precisao, qt_pp : Integer;
  ds_golpe : String[240];
end;

Type
  tItens = packed record
  cd_item : Integer;
  nm_item : String[12];
  ds_item : String[240];
end;

Type
  tBoxes = Packed Record
    Box : Integer;
    IdxPkmn : Integer;
    Nick : String[15];
    IdxIVHP, IdxIVATK, IdxIVDEF, IdxIVSPE, IdxIVSAT, IdxIVSDF : Integer;
    ValEVHP, ValEVATK, ValEVDEF, ValEVSPE, ValEVSAT, ValEVSDF : Integer;
    ResHP, ResATK, ResDEF, ResSPE, ResSAT, ResSDF : Integer;
    IdxItem, IdxNature, TagImg, Trait : Integer;
    PosAtk1, PosAtk2, PosAtk3, PosAtk4 : Integer;
    Gender, Level : Integer;
    Move1, Move2, Move3, Move4 : String[12];
    Item : String[15];
end;

type
  TFrmSimulation = class(TForm)
    PanDistEVs: TPanel;
    PanResult: TPanel;
    PanManip: TPanel;
    PanPokes: TPanel;
    CmBPokes: TComboBox;
    CmBNature: TComboBox;
    BtnLevelLeft: TSpeedButton;
    EdtLevel: TEdit;
    BtnLevelRight: TSpeedButton;
    ShapeContorno: TShape;
    ImgPkmn: TImage;
    EdtBaseHP: TEdit;
    EdtBaseATK: TEdit;
    EdtBaseDEF: TEdit;
    EdtBaseSPE: TEdit;
    EdtBaseSAT: TEdit;
    EdtBaseSDF: TEdit;
    CmBIVHP: TComboBox;
    CmBIVATK: TComboBox;
    CmBIVDEF: TComboBox;
    CmBIVSPE: TComboBox;
    CmBIVSAT: TComboBox;
    CmBIVSDF: TComboBox;
    ImgFundoEVS: TImage;
    ImgFundoResult: TImage;
    PBHP1: TGauge;
    PBHP2: TGauge;
    PBATK1: TGauge;
    PBATK2: TGauge;
    PBDEF1: TGauge;
    PBDEF2: TGauge;
    PBSPE1: TGauge;
    PBSPE2: TGauge;
    PBSAT1: TGauge;
    PBSAT2: TGauge;
    PBSDF1: TGauge;
    PBSDF2: TGauge;
    BtnFechar: TSpeedButton;
    BtnMinimiza: TSpeedButton;
    ImgNatureMais: TImage;
    ImgNatureMenos: TImage;
    PanHP: TPanel;
    CmBTipoHP: TComboBox;
    EdtPowerHP: TEdit;
    BtnInfo: TSpeedButton;
    ImgFundoHP: TImage;
    BtnConfirma: TSpeedButton;
    PanTotalEvs: TPanel;
    PBEfforts: TGauge;
    LabTotalEVs: TLabel;
    BtnLimpaEVs: TSpeedButton;
    BtnIgualaEVs: TSpeedButton;
    ImgTipo2: TImage;
    ImgTipo1: TImage;
    BtnLockHP: TSpeedButton;
    BtnLockAtk: TSpeedButton;
    BtnLockDef: TSpeedButton;
    BtnLockSpe: TSpeedButton;
    BtnLockSat: TSpeedButton;
    BtnLockSdf: TSpeedButton;
    BtnUnlock: TSpeedButton;
    BtnLock: TSpeedButton;
    ImgAux: TImage;
    PanMoves: TPanel;
    StringGrid: TStringGrid;
    ImgFundoMoves: TImage;
    EdtMove1: TEdit;
    EdtMove2: TEdit;
    EdtMove3: TEdit;
    EdtMove4: TEdit;
    RBFemale: TRadioButton;
    RBMale: TRadioButton;
    PanAditional: TPanel;
    CmBItens: TComboBox;
    ImgFundoAditional: TImage;
    RBTrait1: TRadioButton;
    RBTrait2: TRadioButton;
    SaveDialog: TSaveDialog;
    EdtNick: TEdit;
    BtnExporta: TSpeedButton;
    PanBox: TPanel;
    PanDescPokeBox: TPanel;
    ImageFundoDescPokeBox: TImage;
    ShapeResumo3: TShape;
    ShapeResumo2: TShape;
    ShapeResumo1: TShape;
    LabStats: TLabel;
    LabResSpe: TLabel;
    LabResSdf: TLabel;
    LabResSat: TLabel;
    LabResHP: TLabel;
    LabResDef: TLabel;
    LabResAtk: TLabel;
    LabNickPoke: TLabel;
    LabMove4: TLabel;
    LabMove3: TLabel;
    LabMove2: TLabel;
    LabMove1: TLabel;
    LabLevelPoke: TLabel;
    LabEspeciePoke: TLabel;
    LabDescItem: TLabel;
    LabDesc1: TLabel;
    ImgBox01: TImage;
    ImgBox02: TImage;
    ImgBox03: TImage;
    ImgBox04: TImage;
    ImgBox05: TImage;
    ImgBox07: TImage;
    ImgBox08: TImage;
    ImgBox09: TImage;
    ImgBox10: TImage;
    ImgBox11: TImage;
    ImgFundoBox: TImage;
    BtnSalvaBox: TSpeedButton;
    BtnRestaura: TSpeedButton;
    BtnExclui: TSpeedButton;
    BtnTransfere: TSpeedButton;
    ShapeSeleciona: TShape;
    Image29: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    Image28: TImage;
    Image27: TImage;
    Image26: TImage;
    Image25: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image20: TImage;
    Image19: TImage;
    Image18: TImage;
    Image17: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image12: TImage;
    Image11: TImage;
    Image10: TImage;
    Image9: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image4: TImage;
    Image3: TImage;
    Image2: TImage;
    Image1: TImage;
    BtnFechaBox: TSpeedButton;
    ImgBox06: TImage;
    ImgBox12: TImage;
    ImgNumBox: TImage;
    TBHP: TRxSlider;
    TBATK: TRxSlider;
    TBDEF: TRxSlider;
    TBSPE: TRxSlider;
    TBSAT: TRxSlider;
    TBSDF: TRxSlider;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel13: TRxLabel;
    RxLabel14: TRxLabel;
    RxLabel15: TRxLabel;
    LabEvHP: TRxLabel;
    LabEvAtk: TRxLabel;
    LabEvDef: TRxLabel;
    LabEvSpe: TRxLabel;
    LabEvSat: TRxLabel;
    LabEvSdf: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabel19: TRxLabel;
    LabResultHP: TRxLabel;
    LabResultATK: TRxLabel;
    LabResultDEF: TRxLabel;
    LabResultSPE: TRxLabel;
    LabResultSAT: TRxLabel;
    LabResultSDF: TRxLabel;
    RxLabel20: TRxLabel;
    RxLabel21: TRxLabel;
    RxLabel22: TRxLabel;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    RxLabel25: TRxLabel;
    RxLabel26: TRxLabel;
    RxLabel27: TRxLabel;
    RxLabel28: TRxLabel;
    RxLabel29: TRxLabel;
    RxLabel30: TRxLabel;
    ImgFundoPokes: TImage;
    ImgFundoManip: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BtnLevelRightClick(Sender: TObject);
    procedure BtnLevelLeftClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFecharClick(Sender: TObject);
    procedure EdtLevelExit(Sender: TObject);
    procedure EdtLevelKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ImgFundoPokesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnMinimizaClick(Sender: TObject);
    procedure CmBTipoHPClick(Sender: TObject);
    procedure TBSDFChange(Sender: TObject);
    procedure TBATKChange(Sender: TObject);
    procedure TBDEFChange(Sender: TObject);
    procedure TBSPEChange(Sender: TObject);
    procedure TBSATChange(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure CmBPokesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CmBNatureClick(Sender: TObject);
    procedure BtnInfoClick(Sender: TObject);
    procedure BtnLimpaEVsClick(Sender: TObject);
    procedure BtnIgualaEVsClick(Sender: TObject);
    procedure BtnLockHPClick(Sender: TObject);
    procedure BtnLockAtkClick(Sender: TObject);
    procedure BtnLockDefClick(Sender: TObject);
    procedure BtnLockSpeClick(Sender: TObject);
    procedure BtnLockSatClick(Sender: TObject);
    procedure BtnLockSdfClick(Sender: TObject);
    procedure ImgPkmnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridDblClick(Sender: TObject);
    procedure EdtMove1Click(Sender: TObject);
    procedure EdtMove2Click(Sender: TObject);
    procedure EdtMove3Click(Sender: TObject);
    procedure EdtMove4Click(Sender: TObject);
    procedure StringGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RBTrait1Click(Sender: TObject);
    procedure BtnExportaClick(Sender: TObject);
    procedure BtnSalvaBoxClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure Image3DblClick(Sender: TObject);
    procedure Image4DblClick(Sender: TObject);
    procedure Image5DblClick(Sender: TObject);
    procedure Image6DblClick(Sender: TObject);
    procedure Image7DblClick(Sender: TObject);
    procedure Image8DblClick(Sender: TObject);
    procedure Image9DblClick(Sender: TObject);
    procedure Image10DblClick(Sender: TObject);
    procedure Image11DblClick(Sender: TObject);
    procedure Image12DblClick(Sender: TObject);
    procedure Image13DblClick(Sender: TObject);
    procedure Image14DblClick(Sender: TObject);
    procedure Image15DblClick(Sender: TObject);
    procedure Image16DblClick(Sender: TObject);
    procedure Image17DblClick(Sender: TObject);
    procedure Image18DblClick(Sender: TObject);
    procedure Image19DblClick(Sender: TObject);
    procedure Image20DblClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure Image19Click(Sender: TObject);
    procedure Image20Click(Sender: TObject);
    procedure Image21Click(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure Image23Click(Sender: TObject);
    procedure Image24Click(Sender: TObject);
    procedure Image25Click(Sender: TObject);
    procedure Image26Click(Sender: TObject);
    procedure Image27Click(Sender: TObject);
    procedure Image28Click(Sender: TObject);
    procedure Image29Click(Sender: TObject);
    procedure Image30Click(Sender: TObject);
    procedure Image31Click(Sender: TObject);
    procedure Image32Click(Sender: TObject);
    procedure ImgBox01Click(Sender: TObject);
    procedure ImgBox02Click(Sender: TObject);
    procedure ImgBox03Click(Sender: TObject);
    procedure ImgBox04Click(Sender: TObject);
    procedure ImgBox05Click(Sender: TObject);
    procedure ImgBox06Click(Sender: TObject);
    procedure ImgBox07Click(Sender: TObject);
    procedure ImgBox08Click(Sender: TObject);
    procedure ImgBox09Click(Sender: TObject);
    procedure ImgBox10Click(Sender: TObject);
    procedure ImgBox11Click(Sender: TObject);
    procedure ImgBox12Click(Sender: TObject);
    procedure Image24DblClick(Sender: TObject);
    procedure Image25DblClick(Sender: TObject);
    procedure Image26DblClick(Sender: TObject);
    procedure Image27DblClick(Sender: TObject);
    procedure Image28DblClick(Sender: TObject);
    procedure Image29DblClick(Sender: TObject);
    procedure Image30DblClick(Sender: TObject);
    procedure Image31DblClick(Sender: TObject);
    procedure Image32DblClick(Sender: TObject);
    procedure Image21DblClick(Sender: TObject);
    procedure Image22DblClick(Sender: TObject);
    procedure Image23DblClick(Sender: TObject);
    procedure BtnRestauraClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure BtnTransfereClick(Sender: TObject);
    procedure BtnFechaBoxClick(Sender: TObject);
    procedure CmBItensChange(Sender: TObject);
    procedure EdtNickExit(Sender: TObject);
    procedure CmBPokesExit(Sender: TObject);
    procedure TBHPChange(Sender: TObject);
    procedure RBFemaleClick(Sender: TObject);
    procedure RBMaleClick(Sender: TObject);
    procedure CmBPokesChange(Sender: TObject);
    procedure ImgPkmnClick(Sender: TObject);
    procedure CmBIVATKClick(Sender: TObject);
    procedure CmBIVHPChange(Sender: TObject);
    procedure CmBIVATKChange(Sender: TObject);
    procedure CmBIVDEFChange(Sender: TObject);
    procedure CmBIVSPEChange(Sender: TObject);
    procedure CmBIVSATChange(Sender: TObject);
    procedure CmBIVSDFChange(Sender: TObject);
    procedure CmBPokesKeyPress(Sender: TObject; var Key: Char);
    procedure StringGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  public
    procedure CarregaIMG(ImgDst : TImage; id: Integer; Cod: Integer);
  private
    sLista0, sLista1, sLista2, sLista3,
    sLista4, sLista5, sLista6, sLista7,
    sLista10 : TStringList;
    NatureMais, NatureMenos: Byte;
    BoxAtual : Integer;
    vImages : Array[1..32] of tImage;
    Arq1 : File of tPokes;
    Arq2 : File of tGolpes;
    Arq3 : File of tAtkPoks;
    Arq4 : File of tTraits;
    Arq5 : File of tBoxes;
    Arq6 : File of tItens;
    Reg1 : tPokes;
    Reg2 : tGolpes;
    Reg3 : tAtkPoks;
    Reg4 : tTraits;
    Reg5 : tBoxes;
    Reg6 : tItens;
    procedure AtualizaAtributos(idAtrib : Integer);
    procedure calcResultados(idAtrib : Integer);
    procedure MontaPB(idAtrib : Integer);
    Function  TotalEvs : Integer;
    procedure MaxEvs(TBAtual : TRxSlider);
    procedure BuscaValores(iAux : Integer);
    procedure CliqueTranca(Button : TSpeedButton);
    procedure MudaPokeSelecBox(idPoke:Integer; idLeft:Integer; idTop:Integer; novValor:Integer);
    procedure AbreBox(idBox:Integer);
    procedure LimparTela;
    procedure CalcHP;
    procedure CalcPowerHP;
    procedure CalcNature;
    procedure BarrasEV;
    procedure MostraAtks;
    procedure CarregaItens;
    Procedure LimpaStringGrid;
    procedure ExportaTXT(Var Caminho : String);
    procedure SalvaNaBox(Pos : Integer);
    procedure BuscaDadosBoxes(Pos : Integer);
    procedure MontaImgBoxes(Box : Integer);
    procedure MostraPokesBoxes(Pos : Integer);
    procedure MostraLabelsBoxes;
    procedure EscondeLabelsBoxes(iAux : Integer);
    procedure HabilitaBtnBoxes;
    Function TranferesEntreBoxes(NovaBox, Pos : Integer) : Boolean;
    procedure Excluir;
    Function RetornaQtdeBox(Box : Integer) : Integer;
    Function RetornaStringQuebrada(StrIni : String) : String;
  public
  end;

var
  FrmSimulation: TFrmSimulation;

implementation

uses UntInfo, UntTransf;

{$R *.dfm}

{ TFrmSimulation }

procedure TFrmSimulation.FormCreate(Sender: TObject);
begin
  //reinicia os valores das naturezas
  NatureMais := 0;
  NatureMenos := 0;
  //inclui as imagens no vetor de imagens
  vImages[1] := Image1;
  vImages[2] := Image2;
  vImages[3] := Image3;
  vImages[4] := Image4;
  vImages[5] := Image5;
  vImages[6] := Image6;
  vImages[7] := Image7;
  vImages[8] := Image8;
  vImages[9] := Image9;
  vImages[10] := Image10;
  vImages[11] := Image11;
  vImages[12] := Image12;
  vImages[13] := Image13;
  vImages[14] := Image14;
  vImages[15] := Image15;
  vImages[16] := Image16;
  vImages[17] := Image17;
  vImages[18] := Image18;
  vImages[19] := Image19;
  vImages[20] := Image20;
  vImages[21] := Image21;
  vImages[22] := Image22;
  vImages[23] := Image23;
  vImages[24] := Image24;
  vImages[25] := Image25;
  vImages[26] := Image26;
  vImages[27] := Image27;
  vImages[28] := Image28;
  vImages[29] := Image29;
  vImages[30] := Image30;
  vImages[31] := Image31;
  vImages[32] := Image32;
  //seta backgrounds
  CarregaIMG(ImgFundoPokes,3,101);
  CarregaIMG(ImgFundoManip,3,102);
  CarregaIMG(ImgFundoEVS,3,103);
  CarregaIMG(ImgFundoResult,3,104);
  CarregaIMG(ImgFundoHP,3,106);
  CarregaIMG(ImgFundoMoves,3,108);
  CarregaIMG(ImgFundoAditional,3,111);
  CarregaIMG(ImgFundoBox,3,107);
  CarregaIMG(ImgBox01,3,201);
  CarregaIMG(ImgBox02,3,202);
  CarregaIMG(ImgBox03,3,203);
  CarregaIMG(ImgBox04,3,204);
  CarregaIMG(ImgBox05,3,205);
  CarregaIMG(ImgBox06,3,206);
  CarregaIMG(ImgBox07,3,207);
  CarregaIMG(ImgBox08,3,208);
  CarregaIMG(ImgBox09,3,209);
  CarregaIMG(ImgBox10,3,210);
  CarregaIMG(ImgBox11,3,211);
  CarregaIMG(ImgBox12,3,212);
  {hints}
  RxHints.SetHintStyle(hsRectangle, 0, False, taCenter ); // Forma de Balão
  Application.HintColor := clGradientActiveCaption; // $005BFFAD muda a cor de fundo
  Application.HintHidePause := 100000 ; // Sustenta o Hint em quase 2min
end;

procedure TFrmSimulation.FormActivate(Sender: TObject);
Var
  Dir : String;
begin
  //Busca o diretório de execução
  GetDir(0,Dir);

  {Pokes}
  AssignFile(Arq1,Dir+'\data1.bin');
  {$I-}
    reset(Arq1);
  if ioresult <> 0 then
    rewrite(Arq1);
 {$I+}

 {Golpes}
  AssignFile(Arq2,Dir+'\data2.bin');
  {$I-}
    reset(Arq2);
  if ioresult <> 0 then
    rewrite(Arq2);
 {$I+}

  {ligação entre os Pokés e os Golpes}
  AssignFile(Arq3,Dir+'\data3.bin');
  {$I-}
    reset(Arq3);
  if ioresult <> 0 then
    rewrite(Arq3);
 {$I+}

 {Habilidades}
  AssignFile(Arq4,Dir+'\data4.bin');
  {$I-}
    reset(Arq4);
  if ioresult <> 0 then
    rewrite(Arq4);
 {$I+}

 {Boxes}
  AssignFile(Arq5,Dir+'\data5.bin');
  {$I-}
    reset(Arq5);
  if ioresult <> 0 then
    rewrite(Arq5);
 {$I+}

 {Itens}
  AssignFile(Arq6,Dir+'\data6.bin');
  {$I-}
    reset(Arq6);
  if ioresult <> 0 then
    rewrite(Arq6);
 {$I+}

  //cria Listas Auxiliares
  sLista0 := TStringList.Create;
  sLista1 := TStringList.Create;
  sLista2 := TStringList.Create;
  sLista3 := TStringList.Create;
  sLista4 := TStringList.Create;
  sLista5 := TStringList.Create;
  sLista6 := TStringList.Create;
  sLista7 := TStringList.Create;
  sLista10 := TStringList.Create;

  //chama a mudança no Pokémon
  BtnConfirmaClick(Self);

  //reinicializa variavel global da box
  BoxAtual := 1;

  //joga os valores de posiocionamente nos
  //botões de abertura das boxes
  ImgBox01.Left := 697;
  ImgBox02.Left := 697;
  ImgBox03.Left := 697;
  ImgBox04.Left := 697;
  ImgBox05.Left := 697;
  ImgBox06.Left := 697;
  ImgBox07.Left := 671;
  ImgBox08.Left := 671;
  ImgBox09.Left := 671;
  ImgBox10.Left := 671;
  ImgBox11.Left := 671;
  ImgBox12.Left := 671;

  //carrega os itens
  CarregaItens;

end;

procedure TFrmSimulation.calcResultados(idAtrib : Integer);
var
  fAux : Real;
begin
  case idAtrib of
    1 : {HP}
      begin
        If CmBPokes.Text = 'Shedinja' then
          LabResultHP.Caption := '1'
        else
          begin
            fAux := ((StrToInt(EdtLevel.Text) * ((StrToInt(EdtBaseHP.Text) * 2) + StrToInt(CmBIVHP.Text) + (TBHP.Value / 4))) / 100) + 10 + StrToInt(EdtLevel.Text);
             LabResultHP.Caption := IntToStr(Trunc(fAux));
          end;
      end;
    2 : {ATK}
      begin
        fAux := ((StrToInt(EdtLevel.Text) * ( (StrToInt(EdtBaseATK.Text) * 2) + StrToInt(CmBIVATK.Text) + (TBATK.Value/4) ) / 100) + 5 );
        if NatureMais = 1 then
          fAux := (fAux * 1.1);
        if NatureMenos = 1  then
          fAux := (fAux * 0.9);
        LabResultATK.Caption := IntToStr(trunc(faux));
      end;
    3 : {DEF}
      begin
        fAux := ((StrToInt(EdtLevel.Text) * ( (StrToInt(EdtBaseDEF.Text) * 2) + StrToInt(CmBIVDEF.Text) + (TBDEF.Value/4) ) / 100) + 5 );
        if NatureMais = 2 then
          fAux := (fAux * 1.1);
        if NatureMenos = 2  then
          fAux := (fAux * 0.9);
        LabResultDEF.Caption := IntToStr(trunc(faux));
      end;
    4 : {SPE}
      begin
        fAux := ((StrToInt(EdtLevel.Text) * ( (StrToInt(EdtBaseSPE.Text) * 2) + StrToInt(CmBIVSPE.Text) + (TBSPE.Value/4) ) / 100) + 5 );
        if NatureMais = 3 then
          fAux := (fAux * 1.1);
        if NatureMenos = 3  then
          fAux := (fAux * 0.9);
        LabResultSPE.Caption := IntToStr(trunc(faux));
      end;
    5 : {SAT}
      begin
        fAux := ((StrToInt(EdtLevel.Text) * ( (StrToInt(EdtBaseSAT.Text) * 2) + StrToInt(CmBIVSAT.Text) + (TBSAT.Value/4) ) / 100) + 5 );
        if NatureMais = 4 then
          fAux := (fAux * 1.1);
        if NatureMenos = 4  then
          fAux := (fAux * 0.9);
        LabResultSAT.Caption := IntToStr(trunc(faux));
      end;
    6 : {SDF}
      begin
        fAux := ((StrToInt(EdtLevel.Text) * ( (StrToInt(EdtBaseSDF.Text) * 2) + StrToInt(CmBIVSDF.Text) + (TBSDF.Value/4) ) / 100) + 5 );
        if NatureMais = 5 then
          fAux := (fAux * 1.1);
        if NatureMenos = 5  then
          fAux := (fAux * 0.9);
        LabResultSDF.Caption := IntToStr(trunc(faux));
      end;
  end;
  //atualiza a barra de progresso
  MontaPB(idAtrib);
end;

procedure TFrmSimulation.MontaPB(idAtrib : Integer);
Var
  Soma : Real;
begin
  if idAtrib = 1 then {HP}
  begin
    if StrToInt(LabResultHP.Caption) < 361 then
      begin
        PBHP2.Visible := False;
        Soma := StrToInt(LabResultHP.Caption) / 3.57;
        If LabResultHP.Caption = '1' then
          PBHP1.Progress := 1
        else
          PBHP1.Progress := Trunc(Soma);
        PBHP1.Top := 40;
      end
    else
      begin
        PBHP1.Progress := 100;
        PBHP1.Top := 34;
        Soma := ((StrToInt(LabResultHP.Caption) - 357) / 3.57);
        PBHP2.Visible := True;
        PBHP2.Progress := Trunc(Soma);
      end;
  end
  else if idAtrib = 2 then
  begin
    {ATK}
    if StrToInt(LabResultATK.Caption) <= 361 then
      begin
        PBATK2.Visible := False;
        Soma := StrToInt(LabResultATK.Caption) / 3.57;
        PBATK1.Progress := Trunc(Soma);
        PBATK1.Top := 83;
      end
    else
      begin
        PBATK1.Progress := 100;
        PBATK1.Top := 77;
        Soma := ((StrToInt(LabResultATK.Caption) - 357) / 3.57);
        PBATK2.Visible := True;
        PBATK2.Progress := Trunc(Soma);
      end;
  end
  else if idAtrib = 3 then
    begin
    {DEF}
      if StrToInt(LabResultDEF.Caption) <= 361 then
      begin
        PBDEF2.Visible := False;
        Soma := StrToInt(LabResultDEF.Caption) / 3.57;
        PBDEF1.Progress := Trunc(Soma);
        PBDEF1.Top := 125;
      end
    else
      begin
        PBDEF1.Progress := 100;
        PBDEF1.Top := 119;
        Soma := ((StrToInt(LabResultDEF.Caption) - 357) / 3.57);
        PBDEF2.Visible := True;
        PBDEF2.Progress := Trunc(Soma);
      end;
  end
  else if idAtrib = 4 then
  begin
    {SPE}
    if StrToInt(LabResultSPE.Caption) <= 361 then
      begin
        PBSPE2.Visible := False;
        PBSPE1.Top := 167;
        Soma := StrToInt(LabResultSPE.Caption) / 3.57;
        PBSPE1.Progress := Trunc(Soma);
      end
    else
      begin
        PBSPE1.Progress := 100;
        PBSPE1.top := 161;
        Soma := ((StrToInt(LabResultSPE.Caption) - 357) / 3.57);
        PBSPE2.Visible := True;
        PBSPE2.Progress := Trunc(Soma);
      end;
  end
  else if idAtrib = 5 then
  begin
    {SAT}
    if StrToInt(LabResultSAT.Caption) <= 361 then
      begin
        PBSAT2.Visible := False;
        Soma := StrToInt(LabResultSAT.Caption) / 3.57;
        PBSAT1.Progress := Trunc(Soma);
        PBSAT1.Top := 207;
      end
    else
      begin
        PBSAT1.Progress := 100;
        PBSAT1.Top := 201;
        Soma := ((StrToInt(LabResultSAT.Caption) - 357) / 3.57);
        PBSAT2.Visible := True;
        PBSAT2.Progress := Trunc(Soma);
      end;
  end
  else
  begin
    {SDF}
    if StrToInt(LabResultSDF.Caption) <= 361 then
      begin
        PBSDF2.Visible := False;
        Soma := StrToInt(LabResultSDF.Caption) / 3.57;
        PBSDF1.Progress := Trunc(Soma);
        PBSDF1.Top := 251;
      end
    else
      begin
        PBSDF1.Progress := 100;
        PBSDF1.Top := 245;
        Soma := ((StrToInt(LabResultSDF.Caption) - 357) / 3.57);
        PBSDF2.Visible := True;
        PBSDF2.Progress := Round(Soma);
      end;
  end;
end;

procedure TFrmSimulation.BtnLevelRightClick(Sender: TObject);
begin
 if StrToInt(EdtLevel.Text) < 100 then
   begin
     EdtLevel.Text := IntToStr(StrToInt(EdtLevel.Text) + 1);
     AtualizaAtributos(0);
   end;
end;

procedure TFrmSimulation.BtnLevelLeftClick(Sender: TObject);
begin
 if StrToInt(EdtLevel.Text) > 1  then
   begin
     EdtLevel.Text := IntToStr(StrToInt(EdtLevel.Text) -1);
     AtualizaAtributos(0);
   end;
end;

Function TFrmSimulation.TotalEvs : Integer;
begin
  Result := ( 510 + ( - TBHP.Value - TBATK.Value - TBDEF.Value - TBSPE.Value - TBSAT.Value - TBSDF.Value));
  LabTotalEVs.Tag := Result;
  if Result >= 0 then
    begin
      LabTotalEVs.Caption := IntToStr(Result);
      LabTotalEVs.Hint := ('Total de Efforts restantes: ' +IntToStr(Result)+ ' ponto(s)');
      PBEfforts.Progress := Result;
    end;
end;

procedure TFrmSimulation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //fecha os arquivos de dados
  CloseFile(Arq1);
  CloseFile(Arq2);
  CloseFile(Arq3);
  CloseFile(Arq4);
  CloseFile(Arq5);
end;

Procedure TFrmSimulation.BuscaValores(iAux : Integer);
Var
  sAux : String;
begin
  sAux := CmBPokes.Text;
  if (sAux <> '') then
    if (iAux >= 0) and (iAux <= 500) then
      begin
        sAux := UpperCase(Copy(sAux,1,1))+Copy(sAux,2,Length(sAux));
        CmBPokes.Text := sAux;
      end
    else
      begin
        CmBPokes.SetFocus;
        CmBPokes.SelectAll;
        exit;
      end;

  seek(Arq1,iAux);
  read(Arq1,Reg1);
  EdtBaseHP.Text := IntToStr(Reg1.BHP);
  EdtBaseATK.Text := IntToStr(Reg1.BATK);
  EdtBaseDEF.Text := IntToStr(Reg1.BDEF);
  EdtBaseSPE.Text := IntToStr(Reg1.BSPE);
  EdtBaseSAT.Text := IntToStr(Reg1.BSAT);
  EdtBaseSDF.Text := IntToStr(Reg1.BSDF);

  if Reg1.Abilitie2 = 77 then
    RBTrait2.Visible := False
  else
    begin
      RBTrait2.Visible := True;
      Seek(Arq4,Reg1.Abilitie2);
      Read(Arq4,Reg4);
      RBTrait2.Caption := Reg4.Nome;
      RBTrait2.Hint := Reg4.Descr;
    end;

   Seek(Arq4,Reg1.Abilitie1);
   Read(Arq4,Reg4);
   RBTrait1.Caption := Reg4.Nome;
   RBTrait1.Hint := Reg4.Descr;
   RBTrait1.Checked := True;

  if (Reg1.SexoF =  0) and (Reg1.SexoM = 0) then
    begin
      RBFemale.Enabled := False;
      RBMale.Enabled := False;
      RBFemale.Checked := False;
      RBMale.Checked := False;
    end
  else if (Reg1.SexoF = 0) then
    begin
      RBFemale.Enabled := False;
      RBMale.Enabled := True;
      RBMale.Checked := True;
    end
  else if Reg1.SexoM = 0 then
    begin
      RBMale.Enabled := False;
      RBFemale.Enabled := True;
      RBFemale.Checked := true;
    end
  else
    begin
      RBFemale.Enabled := True;
      RBMale.Enabled := true;
      RBMale.Checked := True;
    end;

  ImgTipo1.Tag := Reg1.Tipo1;
  ImgTipo2.Tag := Reg1.Tipo2;
  CmBPokes.Tag := FilePos(Arq1) - 1;
end;

procedure TFrmSimulation.CarregaIMG(ImgDst: TImage; id: Integer; Cod: Integer);
var
  MyGif : TGIFImage;
  ResStream : TResourceStream; {Resource Stream object}
  LibHandle: THandle;
begin
  //cria uma nova instância de GIF
  MyGIF := TGIFImage.Create;
  //processa parametro de entrada
  case id of
    1 : //img do Poké
      begin
        If ImgPkmn.Tag = 1 then //img normal
          if (not RBFemale.Enabled) or (not RBMale.Enabled) or RBMale.Checked then
            LibHandle := Loadlibrary('imgn1.dll')
          else
            LibHandle := Loadlibrary('imgn2.dll')
        else  //img shiny
          if (not RBFemale.Enabled) or (not RBMale.Enabled) or RBMale.Checked then
            LibHandle := Loadlibrary('imgs1.dll')
          else
            LibHandle := Loadlibrary('imgs2.dll')
      end;
    2 : LibHandle := Loadlibrary('imgi.dll');
    3 : LibHandle := Loadlibrary('imgf.dll');
    4 : LibHandle := Loadlibrary('imgt.dll');
  end;  
  //busca a imagem específica dentro da DLL
  ResStream := TResourceStream.CreateFromID(LibHandle, Cod, RT_RCDATA);
  //coloca no GIF a imagem carregada
  MyGif.LoadFromStream(ResStream);
  //limpa o fundo
  ImgDst.Canvas.Brush.Color := clWhite;
  ImgDst.Canvas.FillRect (ImgDst.Canvas.ClipRect);
  //desenha na imagem da tela a imagem buscada na dll
  ImgDst.Canvas.Draw(0,0,MyGif);
  //libera objetos temporários
  MyGif.Free;
  ResStream.Free;
end;


procedure TFrmSimulation.BtnFecharClick(Sender: TObject);
begin
  //finaliza aplicação
  Application.Terminate;
end;

procedure TFrmSimulation.EdtLevelExit(Sender: TObject);
begin
  if EdtLevel.Text = '' then
    EdtLevel.Text := '1';

  if (StrToInt(EdtLevel.Text) <= 0) then
        EdtLevel.Text := '1'
  else if StrToInt(EdtLevel.Text) >= 100 then
        EdtLevel.Text := '100';

  AtualizaAtributos(0);
end;

procedure TFrmSimulation.EdtLevelKeyPress(Sender: TObject; var Key: Char);
begin
  If Not (Key in ['0'..'9',#8,#13,#27]) then
    Key := #0;

  if Key = #13 then
    EdtLevelExit(self);

end;

procedure TFrmSimulation.LimparTela;
begin
  CmBNature.ItemIndex := 0;
  EdtLevel.Text := '100';
  CmBIVHP.ItemIndex := 0;
  CmBIVATK.ItemIndex := 0;
  CmBIVDEF.ItemIndex := 0;
  CmBIVSPE.ItemIndex := 0;
  CmBIVSAT.ItemIndex := 0;
  CmBIVSDF.ItemIndex := 0;
  TBHP.Value := 85;
  TBATK.Value := 85;
  TBDEF.Value := 85;
  TBSPE.Value := 85;
  TBSAT.Value := 85;
  TBSDF.Value := 85;
  ImgNatureMenos.Visible := False;
  ImgNatureMais.Visible := False;
  CmBTipoHP.ItemIndex := 14;
  EdtPowerHP.Text := '70';
  BtnLockHP.Tag := 1;
  BtnLockAtk.Tag := 1;
  BtnLockDef.Tag := 1;
  BtnLockSpe.Tag := 1;
  BtnLockSat.Tag := 1;
  BtnLockSdf.Tag := 1;
  ImgPkmn.Tag := 2;
  //ImgPkmnClick(Self);
  sLista0.Clear;
  sLista1.Clear;
  sLista2.Clear;
  sLista3.Clear;
  sLista4.Clear;
  sLista5.Clear;
  sLista6.Clear;
  sLista7.Clear;
  LimpaStringGrid;
  EdtMove1.Clear;
  EdtMove2.Clear;
  EdtMove3.Clear;
  EdtMove4.Clear;
  EdtMove1.Tag := 0;
  EdtMove2.Tag := 0;
  EdtMove3.Tag := 0;
  EdtMove4.Tag := 0;
  EdtNick.Text := '';
  CmBItens.ItemIndex := 0;
  NatureMais := 0;
  NatureMenos := 0;
  StringGrid.Tag := 0;
end;

procedure TFrmSimulation.MaxEvs(TBAtual : TRxSlider);
Var
  iAux, yAux : Integer;
begin
  if TBHP.Tag <> 3 then
    if TBHP = TBAtual then
      TBHP.Tag := 1
    else if BtnLockHP.Tag = 2 then
      TBHP.Tag := 3
    else if TBHP.Value > 0 then
      TBHP.Tag := 2
    else
      TBHP.Tag := 3;

  if TBATK.Tag <> 3 then
    if TBATK = TBAtual then
      TBATK.Tag := 1
    else if BtnLockAtk.Tag = 2 then
      TBATK.Tag := 3
    else if TBATK.Value > 0 then
      TBATK.Tag := 2
    else
      TBATK.Tag := 3;

  if TBDEF.Tag <> 3 then
    if TBDEF = TBAtual then
      TBDEF.Tag := 1
    else if BtnLockDef.Tag = 2 then
      TBDEF.Tag := 3
    else if TBDEF.Value > 0 then
      TBDEF.Tag := 2
    else
      TBDEF.Tag := 3;


  if TBSPE.Tag <> 3 then
    if TBSPE = TBAtual then
      TBSPE.Tag := 1
    else if BtnLockSpe.Tag = 2 then
      TBSPE.Tag := 3
    else if TBSPE.Value > 0 then
      TBSPE.Tag := 2
    else
      TBSPE.Tag := 3;

  if TBSAT.Tag <> 3 then
    if TBSAT = TBAtual then
      TBSAT.Tag := 1
    else if BtnLockSat.Tag = 2 then
      TBSAT.Tag := 3
    else if TBSAT.Value > 0 then
      TBSAT.Tag := 2
    else
      TBSAT.Tag := 3;

  if TBSDF.Tag <> 3 then
    if TBSDF = TBAtual then
      TBSDF.Tag := 1
    else if BtnLockSdf.Tag = 2 then
      TBSDF.Tag := 3
    else if TBSDF.Value > 0 then
      TBSDF.Tag := 2
    else
      TBSDF.Tag := 3;

    if (TBHP.Tag = 2) then
      begin
        TBHP.Value := TBHP.Value - 1;
        TBHP.Tag := 3;
      end
    else if (TBATK.Tag = 2) then
      begin
        TBATK.Value := TBATK.Value - 1;
        TBATK.Tag := 3;
      end
    else if (TBDEF.Tag = 2) then
      begin
        TBDEF.Value := TBDEF.Value - 1;
        TBDEF.Tag := 3;
      end
    else if (TBSPE.Tag = 2) then
      begin
        TBSPE.Value := TBSPE.Value - 1;
        TBSPE.Tag := 3;
      end
    else if (TBSAT.Tag = 2) then
      begin
        TBSAT.Value := TBSAT.Value - 1;
        TBSAT.Tag := 3;
      end
    else if (TBSDF.Tag = 2) then
      begin
        TBSDF.Value := TBSDF.Value - 1;
        TBSDF.Tag := 3;
      end
    else
      begin
        if (TBHP.Tag = 3) and (TBHP.Value > 0) and (BtnLockHP.Tag = 1) then
          TBHP.Tag := 2;

        if (TBATK.Tag = 3) and (TBATK.Value > 0) and (BtnLockAtk.Tag = 1)  then
          TBATK.Tag := 2;

        if (TBDEF.Tag = 3) and (TBDEF.Value > 0) and (BtnLockDef.Tag = 1) then
          TBDEF.Tag := 2;

        if (TBSPE.Tag = 3) and (TBSPE.Value > 0) and (BtnLockSpe.Tag = 1) then
          TBSPE.Tag := 2;

        if (TBSAT.Tag = 3) and (TBSAT.Value > 0) and (BtnLockSat.Tag = 1) then
          TBSAT.Tag := 2;

        if (TBSDF.Tag = 3) and (TBSDF.Value > 0) and (BtnLockSdf.Tag = 1) then
          TBSDF.Tag := 2;

        if (TBSDF.Tag <> 2) and (TBSAT.Tag <> 2) and (TBSPE.Tag <> 2) and (TBDEF.Tag <> 2) and (TBATK.Tag <> 2) and (TBHP.Tag <> 2) then
          begin
            iAux := 0;
            if TBHP <> TBAtual then
              iAux := iAux + TBHP.Value;
            if TBATK <> TBAtual then
              iAux := iAux + TBATK.Value;
            if TBDEF <> TBAtual then
              iAux := iAux + TBDEF.Value;
            if TBSPE <> TBAtual then
              iAux := iAux + TBSPE.Value;
            if TBSAT <> TBAtual then
              iAux := iAux + TBSAT.Value;
            if TBSDF <> TBAtual then
              iAux := iAux + TBSDF.Value;

            yAux := 510 - iAux;

            TBAtual.Value := yAux;
          end
        else
          MaxEvs(TBAtual);
      end;
end;

procedure TFrmSimulation.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Shift = [ssAlt]) and (Key = VK_F3) Then
 BtnMinimizaClick(self);
if (Shift = [ssAlt]) and (Key = VK_F2) Then
 BtnInfoClick(self);
end;

procedure TFrmSimulation.ImgFundoPokesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TFrmSimulation.CalcHP;
var
  iAux : Integer;
begin
  CalcPowerHP;

  iAux := 0;

  if (StrToInt(CmBIVHP.Text) div 2) <> (StrToInt(CmBIVHP.Text) / 2) then
    iAux := 1;
  if (StrToInt(CmBIVATK.Text) div 2) <> (StrToInt(CmBIVATK.Text) / 2) then
    iAux := iAux + 2;
  if (StrToInt(CmBIVDEF.Text) div 2) <> (StrToInt(CmBIVDEF.Text) / 2) then
    iAux := iAux + 4;
  if (StrToInt(CmBIVSPE.Text) div 2) <> (StrToInt(CmBIVSPE.Text) / 2) then
    iAux := iAux + 8;
  if (StrToInt(CmBIVSAT.Text) div 2) <> (StrToInt(CmBIVSAT.Text) / 2) then
    iAux := iAux + 16;
  if (StrToInt(CmBIVSDF.Text) div 2) <> (StrToInt(CmBIVSDF.Text) / 2) then
    iAux := iAux + 32;

  iAux := Trunc((15 * iAux)/63);

  case iAux of
    0 : CmBTipoHP.ItemIndex := 5;
    1 : CmBTipoHP.ItemIndex := 8;
    2 : CmBTipoHP.ItemIndex := 6;
    3 : CmBTipoHP.ItemIndex := 7;
    4 : CmBTipoHP.ItemIndex := 11;
    5 : CmBTipoHP.ItemIndex := 10;
    6 : CmBTipoHP.ItemIndex := 12;
    7 : CmBTipoHP.ItemIndex := 15;
    8 : CmBTipoHP.ItemIndex := 0;
    9 : CmBTipoHP.ItemIndex := 1;
    10 : CmBTipoHP.ItemIndex := 3;
    11 : CmBTipoHP.ItemIndex := 2;
    12 : CmBTipoHP.ItemIndex := 9;
    13 : CmBTipoHP.ItemIndex := 4;
    14 : CmBTipoHP.ItemIndex := 13;
    15 : CmBTipoHP.ItemIndex := 14;
  end;

end;

procedure TFrmSimulation.BtnMinimizaClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TFrmSimulation.CmBTipoHPClick(Sender: TObject);
Var
  sAux : String;
begin
  Case CmBTipoHP.ItemIndex of
    0 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 1;
        CmBIVSPE.ItemIndex := 1;
        CmBIVSAT.ItemIndex := 1;
        CmBIVSDF.ItemIndex := 0;
      end;
    1 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 0;
        CmBIVSPE.ItemIndex := 1;
        CmBIVSAT.ItemIndex := 1;
        CmBIVSDF.ItemIndex := 0;
      end;
    2 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 0;
        CmBIVSPE.ItemIndex := 0;
        CmBIVSAT.ItemIndex := 1;
        CmBIVSDF.ItemIndex := 0;
      end;
    3 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 1;
        CmBIVSPE.ItemIndex := 0;
        CmBIVSAT.ItemIndex := 1;
        CmBIVSDF.ItemIndex := 0;
      end;
    4 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 0;
        CmBIVSPE.ItemIndex := 1;
        CmBIVSAT.ItemIndex := 0;
        CmBIVSDF.ItemIndex := 0;
      end;
    5 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 1;
        CmBIVSPE.ItemIndex := 1;
        CmBIVSAT.ItemIndex := 1;
        CmBIVSDF.ItemIndex := 1;
      end;
    6 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 1;
        CmBIVSPE.ItemIndex := 0;
        CmBIVSAT.ItemIndex := 1;
        CmBIVSDF.ItemIndex := 1;
      end;
    7 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 0;
        CmBIVSPE.ItemIndex := 0;
        CmBIVSAT.ItemIndex := 1;
        CmBIVSDF.ItemIndex := 1;
      end;
    8 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 0;
        CmBIVSPE.ItemIndex := 1;
        CmBIVSAT.ItemIndex := 1;
        CmBIVSDF.ItemIndex := 1;
      end;
    9 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 1;
        CmBIVSPE.ItemIndex := 1;
        CmBIVSAT.ItemIndex := 0;
        CmBIVSDF.ItemIndex := 0;
      end;
   10 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 0;
        CmBIVSPE.ItemIndex := 1;
        CmBIVSAT.ItemIndex := 0;
        CmBIVSDF.ItemIndex := 1;
      end;
   11 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 1;
        CmBIVSPE.ItemIndex := 1;
        CmBIVSAT.ItemIndex := 0;
        CmBIVSDF.ItemIndex := 1;
      end;
   12 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 1;
        CmBIVSPE.ItemIndex := 0;
        CmBIVSAT.ItemIndex := 0;
        CmBIVSDF.ItemIndex := 1;
      end;
   13 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 1;
        CmBIVSPE.ItemIndex := 0;
        CmBIVSAT.ItemIndex := 0;
        CmBIVSDF.ItemIndex := 0;
      end;
   14 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 0;
        CmBIVSPE.ItemIndex := 0;
        CmBIVSAT.ItemIndex := 0;
        CmBIVSDF.ItemIndex := 0;
      end;
   15 :
      begin
        CmBIVHP.ItemIndex := 0;
        CmBIVATK.ItemIndex := 0;
        CmBIVDEF.ItemIndex := 0;
        CmBIVSPE.ItemIndex := 0;
        CmBIVSAT.ItemIndex := 0;
        CmBIVSDF.ItemIndex := 1;
      end;
  end;
  CalcPowerHP;
  AtualizaAtributos(0);

  If EdtMove1.Text <> '' then
    begin
      sAux := EdtMove1.Text;
      If (EdtMove1.Text = 'Hidden Power') or (sAux[1] = 'H') and (sAux[2] = 'P') then
        EdtMove1.Text := 'HP ' + CmBTipoHP.Text;
    end;

  If EdtMove2.Text <> '' then
    begin
      sAux := EdtMove2.Text;
      If (EdtMove2.Text = 'Hidden Power') or (sAux[1] = 'H') and (sAux[2] = 'P') then
        EdtMove2.Text := 'HP ' + CmBTipoHP.Text;
    end;

  If EdtMove3.Text <> '' then
    begin
      sAux := EdtMove3.Text;
      If (EdtMove3.Text = 'Hidden Power') or (sAux[1] = 'H') and (sAux[2] = 'P') then
        EdtMove3.Text := 'HP ' + CmBTipoHP.Text;
    end;

  If EdtMove4.Text <> '' then
    begin
      sAux := EdtMove4.Text;
      If (EdtMove4.Text = 'Hidden Power') or (sAux[1] = 'H') and (sAux[2] = 'P') then
        EdtMove4.Text := 'HP ' + CmBTipoHP.Text;
    end;


end;

procedure TFrmSimulation.TBATKChange(Sender: TObject);
begin
    TotalEvs;
    if LabTotalEVs.Tag < 0 then
      BarrasEV
    else
      AtualizaAtributos(2);;
  LabEvATK.Caption := IntToStr(TBATK.Value);
end;

procedure TFrmSimulation.TBDEFChange(Sender: TObject);
begin
    TotalEvs;
    if LabTotalEVs.Tag < 0 then
      BarrasEV
    else
      AtualizaAtributos(3);;
  LabEvDEF.Caption := IntToStr(TBDEF.Value);
end;

procedure TFrmSimulation.TBSPEChange(Sender: TObject);
begin
    TotalEvs;
    if LabTotalEVs.Tag < 0 then
      BarrasEV
    else
      AtualizaAtributos(4);;
  LabEvSPE.Caption := IntToStr(TBSPE.Value);
end;

procedure TFrmSimulation.TBSATChange(Sender: TObject);
begin
    TotalEvs;
    if LabTotalEVs.Tag < 0 then
      BarrasEV
    else
      AtualizaAtributos(5);;
  LabEvSAT.Caption := IntToStr(TBSAT.Value);
end;

procedure TFrmSimulation.TBSDFChange(Sender: TObject);
begin
    TotalEvs;
    if LabTotalEVs.Tag < 0 then
      BarrasEV
    else
      AtualizaAtributos(6);;
  LabEvSdf.Caption := IntToStr(TBSDF.Value);
end;

procedure TFrmSimulation.CalcPowerHP;
Var
  iAux : integer;
begin
  iAux := 0;
  If (StrToInt(CmBIVHP.Text) mod 4 = 2) or (StrToInt(CmBIVHP.Text) mod 4 = 3) then
    iAux := 1;
  if (StrToInt(CmBIVATK.Text) mod 4 = 2) or (StrToInt(CmBIVATK.Text) mod 4 = 3) then
    iAux := iAux + 2;
  if (StrToInt(CmBIVDEF.Text) mod 4 = 2) or (StrToInt(CmBIVDEF.Text) mod 4 = 3) then
    iAux := iAux + 4;
  if (StrToInt(CmBIVSPE.Text) mod 4 = 2) or (StrToInt(CmBIVSPE.Text) mod 4 = 3) then
    iAux := iAux + 8;
  if (StrToInt(CmBIVSAT.Text) mod 4 = 2) or (StrToInt(CmBIVSAT.Text) mod 4 = 3) then
    iAux := iAux + 16;
  if (StrToInt(CmBIVSDF.Text) mod 4 = 2) or (StrToInt(CmBIVSDF.Text) mod 4 = 3) then
    iAux := iAux + 32;

  EdtPowerHP.Text := FloatToStr(Trunc(30 + ( (40 * iAux) / 63)));
end;

procedure TFrmSimulation.BtnConfirmaClick(Sender: TObject);
Var
  iAux : Integer;
begin
  iAux := CmBPokes.ItemIndex + 1;

  if (iAux < 1) then
    exit;

  BuscaValores(iAux);

  LimparTela;

  EdtNick.Text := CmBPokes.Text;
  //EdtNick.SetFocus;

  iAux := CmBPokes.Tag;
  CarregaIMG(ImgPkmn,1,iAux);

  iAux := ImgTipo1.Tag;
  CarregaIMG(ImgTipo1,4,iAux);

  iAux := ImgTipo2.Tag;
  if iAux <> 18 then
    begin
      CarregaIMG(ImgTipo2,4,iAux);
      ImgTipo2.Visible := True;
      ImgTipo1.Left := 262;
    end
  else
    begin
      ImgTipo2.Visible := False;
      ImgTipo1.Left := 280;
    end;

  MostraAtks;

  AtualizaAtributos(0);

end;

procedure TFrmSimulation.CmBPokesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    begin
      BtnConfirmaClick(Self);
      EdtNick.SetFocus;
    end;
end;

procedure TFrmSimulation.CalcNature;
var
  sAux : String;
begin
   sAux := CmBNature.Text;
   if (sAux <> '') and (CmBNature.ItemIndex >= 0) and (CmBNature.ItemIndex <= 25) then
     begin
       sAux := UpperCase(Copy(sAux,1,1))+LowerCase(Copy(sAux,2,Length(sAux)));
       CmBNature.Text := sAux;
     end
   else
     begin
       CmBNature.SetFocus;
       exit;
     end;

    Case CmBNature.ItemIndex of
      0 : begin
            NatureMais := 0; NatureMenos := 0;
          end;
      1:  begin
           NatureMais := 1; NatureMenos := 2;
          end;
      2:  begin
           NatureMais := 1; NatureMenos := 3;
          end;
      3: begin
           NatureMais := 1; NatureMenos := 4;
          end;
      4:  begin
           NatureMais := 1; NatureMenos := 5;
          end;
      5:  begin
           NatureMais := 0; NatureMenos := 0;
          end;
      6:  begin
           NatureMais := 2; NatureMenos := 1;
          end;
      7:  begin
           NatureMais := 2; NatureMenos := 3;
          end;
      8:  begin
           NatureMais := 2; NatureMenos := 4;
          end;
      9:  begin
           NatureMais := 2; NatureMenos := 5;
          end;
     10:  begin
           NatureMais := 0; NatureMenos := 0;
          end;
     11:  begin
           NatureMais := 3; NatureMenos := 1;
          end;
     12:  begin
           NatureMais := 3; NatureMenos := 2;
          end;
     13:  begin
           NatureMais := 3; NatureMenos := 4;
          end;
     14:  begin
           NatureMais := 3; NatureMenos := 5;
          end;
     15:  begin
           NatureMais := 0; NatureMenos := 0;
          end;
     16:  begin
           NatureMais := 4; NatureMenos := 1;
          end;
     17:  begin
           NatureMais := 4; NatureMenos := 2;
          end;
     18:  begin
           NatureMais := 4; NatureMenos := 3;
          end;
     19:  begin
           NatureMais := 4; NatureMenos := 5;
          end;
     20:  begin
           NatureMais := 0; NatureMenos := 0;
          end;
     21:  begin
           NatureMais := 5; NatureMenos := 1;
          end;
     22:  begin
           NatureMais := 5; NatureMenos := 2;
          end;
     23:  begin
           NatureMais := 5; NatureMenos := 3;
          end;
     24:  begin
           NatureMais := 5; NatureMenos := 4;
          end;
    end;

    if (NatureMais = 1) then
      begin
        ImgNatureMais.Left := 87;
        ImgNatureMais.Visible := True;
      end
    else if (NatureMais = 2) then
      begin
        ImgNatureMais.Left := 133;
        ImgNatureMais.Visible := True;
      end
    else if (NatureMais = 3) then
      begin
        ImgNatureMais.Left := 180;
        ImgNatureMais.Visible := True;
      end
    else if (NatureMais = 4) then
      begin
        ImgNatureMais.Left := 226;
        ImgNatureMais.Visible := True;
      end
    else if (NatureMais = 5) then
      begin
        ImgNatureMais.Left := 273;
        ImgNatureMais.Visible := True;
      end
    else
        ImgNatureMais.Visible := False;

    if (NatureMenos = 1) then
      begin
        ImgNatureMenos.Left := 87;
        ImgNatureMenos.Visible := True;
      end
    else if (NatureMenos = 2) then
      begin
        ImgNatureMenos.Left := 133;
        ImgNatureMenos.Visible := True;
      end
    else if (NatureMenos = 3) then
      begin
        ImgNatureMenos.Left := 180;
        ImgNatureMenos.Visible := True;
      end
    else if (NatureMenos = 4) then
      begin
        ImgNatureMenos.Left := 226;
        ImgNatureMenos.Visible := True;
      end
    else if (NatureMenos = 5) then
      begin
        ImgNatureMenos.Left := 273;
        ImgNatureMenos.Visible := True;
      end
    else
        ImgNatureMenos.Visible := False;
   AtualizaAtributos(0);
end;

procedure TFrmSimulation.CmBNatureClick(Sender: TObject);
begin
  CalcNature;
end;

procedure TFrmSimulation.BtnInfoClick(Sender: TObject);
begin
  //chama formulário com dados informativos
  if FrmInfo = nil then
    FrmInfo := TFrmInfo.Create(Self);
  FrmInfo.ShowModal;
  FreeAndNil(FrmInfo);
end;

procedure TFrmSimulation.BarrasEV;
Var
  TBAtual : TRxSlider;
begin
  If TBHP.Focused then
    TBAtual := TBHP
  Else If TBATK.Focused then
    TBAtual := TBATK
  Else If TBDEF.Focused then
    TBAtual := TBDEF
  Else If TBSPE.Focused then
    TBAtual := TBSPE
  Else If TBSAT.Focused then
    TBAtual := TBSAT
  Else If TBSDF.Focused then
    TBAtual := TBSDF
  Else
    Exit;

  MaxEvs(TBAtual);
end;

procedure TFrmSimulation.BtnLimpaEVsClick(Sender: TObject);
begin
  PanTotalEvs.SetFocus;
  TBHP.Value := 0;
  TBATK.Value := 0;
  TBDEF.Value := 0;
  TBSPE.Value := 0;
  TBSAT.Value := 0;
  TBSDF.Value := 0;
end;

procedure TFrmSimulation.BtnIgualaEVsClick(Sender: TObject);
begin
  PanTotalEvs.SetFocus;
  TBHP.Value := 85;
  TBATK.Value := 85;
  TBDEF.Value := 85;
  TBSPE.Value := 85;
  TBSAT.Value := 85;
  TBSDF.Value := 85;
end;

Procedure TFrmSimulation.CliqueTranca(Button: TSpeedButton);
begin
  if Button.Tag = 1 then
    begin
      Button.Glyph := BtnLock.Glyph;
      Button.Hint := 'Trancado';
      Button.Tag := 2;
    end
  else
    begin
      Button.Glyph := BtnUnlock.Glyph;
      Button.Hint := 'Destrancado';
      Button.Tag := 1;
    end;
end;

procedure TFrmSimulation.BtnLockHPClick(Sender: TObject);
begin
  CliqueTranca(BtnLockHP);
  TBHP.SetFocus;
end;

procedure TFrmSimulation.BtnLockAtkClick(Sender: TObject);
begin
  CliqueTranca(BtnLockAtk);
  TBATK.SetFocus;
end;

procedure TFrmSimulation.BtnLockDefClick(Sender: TObject);
begin
  CliqueTranca(BtnLockDef);
  TBDEF.SetFocus;
end;

procedure TFrmSimulation.BtnLockSpeClick(Sender: TObject);
begin
  CliqueTranca(BtnLockSpe);
  TBSPE.SetFocus;
end;

procedure TFrmSimulation.BtnLockSatClick(Sender: TObject);
begin
  CliqueTranca(BtnLockSat);
  TBSAT.SetFocus;    
end;

procedure TFrmSimulation.BtnLockSdfClick(Sender: TObject);
begin
  CliqueTranca(BtnLockSdf);
  TBSDF.SetFocus;    
end;

procedure TFrmSimulation.ImgPkmnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanPokes.SetFocus;
end;

procedure TFrmSimulation.StringGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
Var
  iAux, jAux : Integer;
begin

  if (sLista0.Count = 0) then
    exit;
  iAux := ARow;

  if (ACol = 1) then
    jAux := StrToInt(sLista0.Strings[iAux])
  else
    if (ACol = 2) then
      jAux := StrToInt(sLista1.Strings[iAux])+20
    else
      exit;

  CarregaIMG(ImgAux,4,jAux);
  StringGrid.Canvas.Draw(Rect.Left,Rect.Top,ImgAux.Picture.Graphic);

end;

procedure TFrmSimulation.MostraAtks;
Var
 iAux, jAux : Integer;
begin
 seek(Arq3,0);
 While not eof(arq3) do
 begin
   read(arq3,reg3);
   if (CmBPokes.ItemIndex + 1) = Reg3.CodPkmn then
     begin
       iAux := Reg3.CodAtk;
       seek(arq2,iAux);
       read(arq2,reg2);
       sLista0.Add(IntToStr(Reg2.cd_tipo));
       sLista1.Add(IntToStr(Reg2.cd_categ));
       sLista2.Add(Reg2.nm_golpe);
       if Reg2.qt_poder > 0 then
         sLista3.Add(IntToStr(Reg2.qt_poder))
       else
         sLista3.Add('-');
       If Reg2.qt_precisao > 0 then
         sLista4.Add(IntToStr(Reg2.qt_precisao))
       else
         sLista4.Add('-');
       sLista5.Add(IntToStr(Reg2.qt_pp));
       sLista6.Add(Reg3.Por);
       sLista7.Add(Reg2.ds_golpe);
     end;
 end;

 StringGrid.RowCount := sLista0.Count;

 if sLista0.Count = 0 then
   Exit;

 for jAux := 0 to (sLista0.Count - 1) do
   begin
     //tipo
     StringGrid.Cells[1,jAux] := sLista0.Strings[jAux];
     //categoria
     StringGrid.Cells[2,jAux] := sLista1.Strings[jAux];
     //nome
     StringGrid.Cells[3,jAux] := sLista2.Strings[jAux];
     //poder
     StringGrid.Cells[4,jAux] := sLista3.Strings[jAux];
     //precisão
     StringGrid.Cells[5,jAux] := sLista4.Strings[jAux];
     //pp
     StringGrid.Cells[6,jAux] := sLista5.Strings[jAux];
     //aprende por
     StringGrid.Cells[7,jAux] := sLista6.Strings[jAux];
  end;

end;

procedure TFrmSimulation.CarregaItens;
begin
 seek(Arq6,0);
 While not eof(Arq6) do
 begin
   read(arq6,reg6);
   //adiciona no ComboBox
   CmBItens.Items.Add(Reg6.nm_item);
   //adiciona na StringList
   sLista10.Add(Reg6.ds_item);
 end;
 //seleciono a primeira posição
 CmBItens.ItemIndex := 0;
end;

procedure TFrmSimulation.LimpaStringGrid;
var
  x,y : integer;
begin
  for y := 0 to StringGrid.RowCount - 1 do
    for x := 0 to StringGrid.ColCount - 1 do
      StringGrid.Cells[x,y] := '';
  StringGrid.RowCount := 2;
  sLista0.Clear;
  sLista1.Clear;
  sLista2.Clear;
  sLista3.Clear;
  sLista4.Clear;
  sLista5.Clear;
end;

procedure TFrmSimulation.StringGridDblClick(Sender: TObject);
begin
  if StringGrid.Col <> 0 then
    StringGrid.Col := 0;

  if StringGrid.Cells[StringGrid.Col,StringGrid.Row] = 'X' then
    begin
      StringGrid.Cells[StringGrid.Col,StringGrid.Row] := '';

      if StringGrid.Cells[StringGrid.Col + 3,StringGrid.Row] = EdtMove1.Text then
        begin
          EdtMove1.Text := '';
          EdtMove1.Tag := 0;
        end;

      if StringGrid.Cells[StringGrid.Col + 3,StringGrid.Row] = EdtMove2.Text then
        begin
          EdtMove2.Text := '';
          EdtMove2.Tag := 0;
        end;

      if StringGrid.Cells[StringGrid.Col + 3,StringGrid.Row] = EdtMove3.Text then
        begin
          EdtMove3.Text := '';
          EdtMove3.Tag := 0;
        end;

      if StringGrid.Cells[StringGrid.Col + 3,StringGrid.Row] = EdtMove4.Text then
        begin
          EdtMove4.Text := '';
          EdtMove4.Tag := 0;
        end;

      exit;

    end;

  StringGrid.Cells[StringGrid.Col,StringGrid.Row] := 'X';

  If EdtMove1.Text = '' then
    begin
      EdtMove1.Text := StringGrid.Cells[StringGrid.Col + 3,StringGrid.Row];
      If EdtMove1.Text = 'Hidden Power' then
        EdtMove1.Text := 'HP ' + CmBTipoHP.Text;
      EdtMove1.Tag := StringGrid.Row;
   end
  else if EdtMove2.Text = '' then
    begin
      EdtMove2.Text := StringGrid.Cells[StringGrid.Col + 3,StringGrid.Row];
      If EdtMove2.Text = 'Hidden Power' then
        EdtMove2.Text := 'HP ' + CmBTipoHP.Text;
      EdtMove2.Tag := StringGrid.Row;
    end
  else if EdtMove3.Text = '' then
    begin
      EdtMove3.Text := StringGrid.Cells[StringGrid.Col + 3,StringGrid.Row];
      If EdtMove3.Text = 'Hidden Power' then
        EdtMove3.Text := 'HP ' + CmBTipoHP.Text;
      EdtMove3.Tag := StringGrid.Row;
    end
  else if EdtMove4.Text = '' then
    begin
      EdtMove4.Text := StringGrid.Cells[StringGrid.Col + 3,StringGrid.Row];
      If EdtMove4.Text = 'Hidden Power' then
        EdtMove4.Text := 'HP ' + CmBTipoHP.Text;
      EdtMove4.Tag := StringGrid.Row;
    end
  else
    StringGrid.Cells[StringGrid.Col,StringGrid.Row] := '';

end;

procedure TFrmSimulation.EdtMove1Click(Sender: TObject);
begin
  if EdtMove1.Tag = 0 then
    exit
  else
    begin
      StringGrid.SetFocus;
      StringGrid.Row := EdtMove1.Tag;
      StringGrid.Col := 2;
    end;
end;

procedure TFrmSimulation.EdtMove2Click(Sender: TObject);
begin
  if EdtMove2.Tag = 0 then
    exit
  else
    begin
      StringGrid.SetFocus;
      StringGrid.Row := EdtMove2.Tag;
      StringGrid.Col := 2;
    end;
end;

procedure TFrmSimulation.EdtMove3Click(Sender: TObject);
begin
  if EdtMove3.Tag = 0 then
    exit
  else
    begin
      StringGrid.SetFocus;
      StringGrid.Row := EdtMove3.Tag;
      StringGrid.Col := 2;
    end;
end;

procedure TFrmSimulation.EdtMove4Click(Sender: TObject);
begin
  if EdtMove4.Tag = 0 then
    exit
  else
    begin
      StringGrid.SetFocus;
      StringGrid.Row := EdtMove4.Tag;
      StringGrid.Col := 2;
    end;
end;

procedure TFrmSimulation.StringGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) then
    begin
      StringGrid.Col := 0;
      StringGridDblClick(Self);
    end;

  if (key = vk_delete) then
    begin
      StringGrid.Col := 0;
      if StringGrid.Cells[0,StringGrid.Row] = 'X' then
        StringGridDblClick(Self);
    end;
end;

procedure TFrmSimulation.RBTrait1Click(Sender: TObject);
begin
  if not RBTrait2.Visible then
    RBTrait1.Checked := True;
end;

procedure TFrmSimulation.BtnExportaClick(Sender: TObject);
Var
  sAux : String;
begin
  If (StringGrid.RowCount >= 4) and (EdtMove4.Text = '') then
    begin
      MessageBeep(48);
      Application.MessageBox(PChar('Ataques insuficientes!!'), PChar('Alerta'),Mb_ok + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      StringGrid.SetFocus;
      exit;
    end
  else if (StringGrid.RowCount = 3) and (EdtMove3.Text = '') then
    begin
      MessageBeep(48);
      Application.MessageBox(PChar('Ataques insuficientes!!'), PChar('Alerta'),Mb_ok + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      StringGrid.SetFocus;
      exit;
    end
  else if (StringGrid.RowCount = 2) and (EdtMove2.Text = '') then
    begin
      MessageBeep(48);
      Application.MessageBox(PChar('Ataques insuficientes!!'), PChar('Alerta'),Mb_ok + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      StringGrid.SetFocus;
      exit;
    end
  else if (StringGrid.RowCount = 1) and (EdtMove1.Text = '') then
    begin
      MessageBeep(48);
      Application.MessageBox(PChar('Ataques insuficientes!!'), PChar('Alerta'),Mb_ok + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      StringGrid.SetFocus;
      exit;
    end
  else
    begin
      if SaveDialog.Execute then
        begin
          sAux := (SaveDialog.FileName);
          ExportaTXT(sAux)
        end;
    end;
end;

procedure TFrmSimulation.ExportaTXT(Var Caminho : String);
var
  Texto : system.textfile;
  tAux : string;
begin

  try
    Caminho := Caminho + '.txt';
    AssignFile(Texto, Caminho);
//  if not FileExists(sAux) then
    Rewrite(Texto,Caminho);

  Append(Texto);

  If EdtNick.Text <> '' then
    begin
      tAux := EdtNick.Text;
      Writeln(Texto, CmBPokes.Text + '(' + tAux + ') @ ' + CmBItens.Text);
    end
  else
      Writeln(Texto, CmBPokes.Text + ' @ ' + CmBItens.Text);
  if RBFemale.Checked then
    tAux := 'Fêmea'
  else
    tAux := 'Macho';
  if ImgPkmn.Tag = 1 then
    Writeln(Texto, tAux + ' Normal (Lv.' + EdtLevel.text + ')')
  else
    writeln(Texto, tAux + ' Shiny (Lv.' + EdtLevel.Text + ')');
  if RBTrait1.Checked then
    writeln(Texto, 'Trait: ' + RbTrait1.Caption)
  else
    Writeln(Texto, 'Trait: ' + RbTrait2.Caption);
  Writeln(Texto, 'Nature: ' + CmbNature.Text);
  writeln(Texto, '      HP ATK DEF SPE SAT SDF');
  writeln(Texto, 'IVS:  ' + CmBIVHP.Text + '  ' + CmBIVATK.Text + '  ' + CmBIVDEF.Text + '  ' + CmBIVSPE.Text + '  ' + CmBIVSAT.Text + '  ' + CmBIVSDF.Text);
  tAux := '';
  tAux := 'EVs: ';
  If TBHP.Value < 100 then
    tAux := tAux + ' ';
  if TBHP.Value < 10 then
    tAux := tAux + ' ';
  tAux := tAux + LabEvHP.Caption + ' ';
  If TBATK.Value < 100 then
    tAux := tAux + ' ';
  if TBATK.Value < 10 then
    tAux := tAux + ' ';
  tAux := tAux + LabEvAtk.Caption + ' ';
  If TBDEF.Value < 100 then
    tAux := tAux + ' ';
  if TBDEF.Value < 10 then
    tAux := tAux + ' ';
  tAux := tAux + LabEvDef.Caption + ' ';
  If TBSPE.Value < 100 then
    tAux := tAux + ' ';
  if TBSPE.Value < 10 then
    tAux := tAux + ' ';
  tAux := tAux + LabEvSpe.Caption + ' ';
  If TBSAT.Value < 100 then
    tAux := tAux + ' ';
  if TBSAT.Value < 10 then
    tAux := tAux + ' ';
  tAux := tAux + LabEvSat.Caption + ' ';
  If TBSDF.Value < 100 then
    tAux := tAux + ' ';
  if TBSDF.Value < 10 then
    tAux := tAux + ' ';
  tAux := tAux + LabEvSdf.Caption + ' ';
  writeln(Texto, tAux);
  writeln(Texto, '-' + EdtMove1.Text);
  writeln(Texto, '-' + EdtMove2.Text);
  writeln(Texto, '-' + EdtMove3.Text);
  writeln(Texto, '-' + EdtMove4.Text);
  writeln(Texto,'');
  Writeln(Texto, 'Comentário: ');

  finally
    CloseFile(Texto);
  end;

  ShellExecute(Handle, nil, PChar(Caminho ), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmSimulation.SalvaNaBox(Pos : Integer);
begin
  With Reg5 do
    begin
      Box := BoxAtual;
      IdxPkmn := CmBPokes.ItemIndex;
      Nick := EdtNick.Text;
      IdxIVHP := CmBIVHP.ItemIndex;
      IdxIVATK := CmBIVATK.ItemIndex;
      IdxIVDEF := CmBIVDEF.ItemIndex;
      IdxIVSPE := CmBIVSPE.ItemIndex;
      IdxIVSAT := CmBIVSAT.ItemIndex;
      IdxIVSDF := CmBIVSDF.ItemIndex;
      ValEVHP := TBHP.Value;
      ValEVATK := TBATK.Value;
      ValEVDEF := TBDEF.Value;
      ValEVSPE := TBSPE.Value;
      ValEVSAT := TBSAT.Value;
      ValEVSDF := TBSDF.Value;
      IdxItem := CmBItens.ItemIndex;
      IdxNature := CmBNature.ItemIndex;
      TagImg := ImgPkmn.Tag;
      If RBTrait1.Checked then
        Trait := 1
      else
        Trait := 2;
      PosAtk1 := EdtMove1.Tag;
      PosAtk2 := EdtMove2.Tag;
      PosAtk3 := EdtMove3.Tag;
      PosAtk4 := EdtMove4.Tag;
      Level := StrToInt(EdtLevel.Text);
      If RBMale.Checked then
        Gender := 1
      else if RBFemale.Checked then
        Gender := 2
      else
        Gender := 3;
      ResHP := StrToInt(LabResultHP.Caption);
      ResATK := StrToInt(LabResultATK.Caption);
      ResDEF := StrToInt(LabResultDEF.Caption);
      ResSPE := StrToInt(LabResultSPE.Caption);
      ResSAT := StrToInt(LabResultSAT.Caption);
      ResSDF := StrToInt(LabResultSDF.Caption);
      Move1 := EdtMove1.Text;
      Move2 := EdtMove2.Text;
      Move3 := EdtMove3.Text;
      Move4 := EdtMove4.Text;
      Item := CmBItens.Text;
    end;//while
  Seek(Arq5, Pos);
  Write(Arq5, Reg5);
end;

procedure TFrmSimulation.BtnSalvaBoxClick(Sender: TObject);
begin
  MontaImgBoxes(BoxAtual);
  If BtnSalvaBox.Tag <> 0 then
    begin
      if Application.MessageBox(PChar('Você deseja atualizar o registro deste pokémon na box?' + #13#10 + '(Se escolher não, um novo registro será criado na Box)'), PChar('Atenção!'), mb_YesNo + mb_DefButton2 + mb_IconQuestion) = IdYes then
        begin
          SalvaNaBox(BtnSalvaBox.Tag);
          PanBox.Tag := PanBox.Tag + 1;
          MontaImgBoxes(BoxAtual);
          PanBox.SetFocus;
        end
      else
        begin
          BtnSalvaBox.Tag := 0;
          BtnSalvaBoxClick(Self);
        end
    end
  else
    begin
      If PanBox.Tag > 32 then
        begin
          ShowMessage('Box cheia, escolha outra!!!');
          Exit;
        end
      else
        begin
          SalvaNaBox(Filesize(Arq5));
          PanBox.Tag := PanBox.Tag + 1;
          MontaImgBoxes(BoxAtual);
          PanBox.SetFocus;
        end;
    end;
end;

procedure TFrmSimulation.BuscaDadosBoxes(Pos: Integer);
begin
  Seek(Arq5,Pos);
  Read(Arq5,Reg5);
  With Reg5 do
    begin
      CmBPokes.ItemIndex := IdxPkmn;
      BtnConfirmaClick(Self);
      EdtNick.Text := Nick;
      EdtNick.SetFocus;
      CmBIVHP.ItemIndex := IdxIVHP;
      CmBIVATK.ItemIndex := IdxIVATK;
      CmBIVDEF.ItemIndex := IdxIVDEF;
      CmBIVSPE.ItemIndex := IdxIVSPE;
      CmBIVSAT.ItemIndex := IdxIVSAT;
      CmBIVSDF.ItemIndex := IdxIVSDF;
      TBHP.Value := ValEVHP;
      TBATK.Value := ValEVATK;
      TBDEF.Value := ValEVDEF;
      TBSPE.Value := ValEVSPE;
      TBSAT.Value := ValEVSAT;
      TBSDF.Value := ValEVSDF;
      CmBItens.ItemIndex := IdxItem;
      CmBNature.ItemIndex := IdxNature;
      CmBNatureClick(Self);
      if TagImg = 2 then
        begin
          ImgPkmn.Tag := 1;
          ImgPkmnClick(Self);
        end
      else
        ImgPkmn.Tag := TagImg;
      If Trait = 1 then
        RBTrait1.Checked := True
      else
        RBTrait2.Checked := True;
      If (Move1 <> '') then
        begin
          StringGrid.Row := PosAtk1;
          StringGridDblClick(Self);
        end;
      If (Move2 <> '') then
        begin
          StringGrid.Row := PosAtk2;
          StringGridDblClick(Self);
        end;
      If (Move3 <> '') then
        begin
          StringGrid.Row := PosAtk3;
          StringGridDblClick(Self);
        end;
      If (Move4 <> '') then
        begin
          StringGrid.Row := PosAtk4;
          StringGridDblClick(Self);
        end;
      EdtLevel.Text := IntToStr(Level);
      If Gender = 1 then
        RBMale.Checked := True
      else if Gender = 2 then
        RBFemale.Checked := True
      else
        RBMale.Checked := False;
      EdtLevelExit(self);

      BtnSalvaBox.Tag := Pos;

    end;//while
end;

procedure TFrmSimulation.Image1DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image1.tag);
end;

procedure TFrmSimulation.Image2DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image2.tag);
end;

procedure TFrmSimulation.Image3DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image3.tag);
end;

procedure TFrmSimulation.Image4DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image4.tag);
end;

procedure TFrmSimulation.MostraPokesBoxes(Pos: Integer);
Var
  i : Integer;
begin
  If not LabDesc1.Visible then
    MostraLabelsBoxes;
  Seek(Arq5,Pos);
  Read(Arq5,Reg5);
  LabNickPoke.Caption := Reg5.Nick;
  LabLevelPoke.Caption := IntToStr(Reg5.Level);
  i := Reg5.IdxPkmn + 1;
  Seek(Arq1,i);
  Read(Arq1,Reg1);
  if Reg5.Gender = 1 then
    LabEspeciePoke.Caption := Reg1.PKMN + ' (M)'
  else if Reg5.Gender = 2 then
    LabEspeciePoke.Caption := Reg1.PKMN + ' (F)'
  else
    LabEspeciePoke.Caption := Reg1.PKMN;
  LabResHP.Caption := IntToStr(Reg5.ResHP);
  LabResATK.Caption := IntToStr(Reg5.ResATK);
  LabResDEF.Caption := IntToStr(Reg5.ResDEF);
  LabResSPE.Caption := IntToStr(Reg5.ResSPE);
  LabResSAT.Caption := IntToStr(Reg5.ResSAT);
  LabResSDF.Caption := IntToStr(Reg5.ResSDF);
  LabMove1.Caption := Reg5.Move1;
  LabMove2.Caption := Reg5.Move2;
  LabMove3.Caption := Reg5.Move3;
  LabMove4.Caption := Reg5.Move4;
  LabDescItem.Caption := 'Item: ' + Reg5.Item;
end;

procedure TFrmSimulation.MontaImgBoxes;
Var
  i, j, k : Integer;
begin
  ShapeSeleciona.Visible := False;
  ShapeSeleciona.Tag := 0;
  BtnRestaura.Enabled := False;
  BtnRestaura.Hint := 'Selecione um Pokémon!';
  BtnTransfere.Enabled := False;
  BtnTransfere.Hint := 'Selecione um Pokémon!';
  BtnExclui.Enabled := False;
  BtnExclui.Hint := 'Selecione um Pokémon!';

  seek(Arq5,0);
  i := 1;
  k := 0;
  PanBox.Tag := 0;
  While not Eof(Arq5) do
    begin
      Read(Arq5, Reg5);
      if Reg5.Box = BoxAtual then
        begin
          vImages[i].Tag := Filepos(Arq5) - 1;
          vImages[i].Hint := Reg5.Nick;
          j := Reg5.IdxPkmn + 1;
          CarregaIMG(vImages[i],2,j);
          vImages[i].Visible := True;
          Inc(i);
          PanBox.Tag := i;
          k := k + 1;
        end
    end;

  EscondeLabelsBoxes(k + 1);

  If k = 0 then
    begin
      BtnRestaura.Enabled := False;
      BtnRestaura.Hint := 'Box vazia';
      BtnTransfere.Enabled := False;
      BtnTransfere.Hint := 'Box vazia';
      BtnExclui.Enabled := False;
      BtnExclui.Hint := 'Box vazia';
      BtnSalvaBox.Enabled := True;
      BtnSalvaBox.Hint := 'Salvar na Box...';
    end
  else if k = 32 then
    begin
      BtnSalvaBox.Hint := 'Box Cheia!';
      BtnSalvaBox.Enabled := False;
    end
  else
    begin
      BtnSalvaBox.Enabled := True;
      BtnSalvaBox.Hint := 'Salvar na Box...';
    end;
end;

procedure TFrmSimulation.Image1Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image1.Tag,7,11,1);
end;

procedure TFrmSimulation.Image2Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image2.Tag,47,11,2);
end;

procedure TFrmSimulation.Image3Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image3.Tag,86,11,3);
end;

procedure TFrmSimulation.Image4Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image4.Tag,126,11,4);
end;

procedure TFrmSimulation.Image5Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image5.Tag,7,48,5);
end;

procedure TFrmSimulation.Image6Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image6.Tag,47,48,6);
end;

procedure TFrmSimulation.Image7Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image7.Tag,86,48,7);
end;

procedure TFrmSimulation.Image8Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image8.Tag,126,48,8);
end;

procedure TFrmSimulation.Image9Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image9.Tag,7,85,9);
end;

procedure TFrmSimulation.Image10Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image10.Tag,47,85,10);
end;

procedure TFrmSimulation.Image11Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image11.Tag,86,85,11);
end;

procedure TFrmSimulation.Image12Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image12.Tag,126,85,12);
end;

procedure TFrmSimulation.Image13Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image13.Tag,7,122,13);
end;

procedure TFrmSimulation.Image14Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image14.Tag,47,122,14);
end;

procedure TFrmSimulation.Image15Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image15.Tag,86,122,15);
end;

procedure TFrmSimulation.Image16Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image16.Tag,126,122,16);
end;

procedure TFrmSimulation.Image17Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image17.Tag,7,159,17);
end;

procedure TFrmSimulation.Image18Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image18.Tag,47,159,18);
end;

procedure TFrmSimulation.Image19Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image19.Tag,86,159,19);
end;

procedure TFrmSimulation.Image20Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image20.Tag,126,159,20);
end;

procedure TFrmSimulation.Image21Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image21.Tag,7,196,21);
end;

procedure TFrmSimulation.Image22Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image22.Tag,47,196,22);
end;

procedure TFrmSimulation.Image23Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image23.Tag,86,196,23);
end;

procedure TFrmSimulation.Image24Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image24.Tag,126,196,24);
end;

procedure TFrmSimulation.Image25Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image25.Tag,7,233,25);
end;

procedure TFrmSimulation.Image26Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image26.Tag,47,233,26);
end;

procedure TFrmSimulation.Image27Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image27.Tag,86,233,27);
end;

procedure TFrmSimulation.Image28Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image28.Tag,126,233,28);
end;

procedure TFrmSimulation.Image29Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image29.Tag,7,270,29);
end;

procedure TFrmSimulation.Image30Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image30.Tag,47,270,30);
end;

procedure TFrmSimulation.Image31Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image31.Tag,86,270,31);
end;

procedure TFrmSimulation.Image32Click(Sender: TObject);
begin
  MudaPokeSelecBox(Image32.Tag,126,270,32);
end;

procedure TFrmSimulation.Image10DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image10.tag);
end;

procedure TFrmSimulation.Image11DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image11.tag);
end;

procedure TFrmSimulation.Image12DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image12.tag);
end;

procedure TFrmSimulation.Image13DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image13.tag);
end;

procedure TFrmSimulation.Image14DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image14.tag);
end;

procedure TFrmSimulation.Image15DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image15.tag);
end;

procedure TFrmSimulation.Image16DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image16.tag);
end;

procedure TFrmSimulation.Image17DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image17.tag);
end;

procedure TFrmSimulation.Image18DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image18.tag);
end;

procedure TFrmSimulation.Image19DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image19.tag);
end;

procedure TFrmSimulation.Image20DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image20.tag);
end;

procedure TFrmSimulation.Image5DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image5.tag);
end;

procedure TFrmSimulation.Image6DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image6.tag);
end;

procedure TFrmSimulation.Image7DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image7.tag);
end;

procedure TFrmSimulation.Image8DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image8.tag);
end;

procedure TFrmSimulation.Image9DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image9.tag);
end;

procedure TFrmSimulation.ImgBox01Click(Sender: TObject);
begin
  AbreBox(1);
end;

procedure TFrmSimulation.ImgBox02Click(Sender: TObject);
begin
  AbreBox(2);
end;

procedure TFrmSimulation.ImgBox03Click(Sender: TObject);
begin
  AbreBox(3);
end;

procedure TFrmSimulation.ImgBox04Click(Sender: TObject);
begin
  AbreBox(4);
end;

procedure TFrmSimulation.ImgBox05Click(Sender: TObject);
begin
  AbreBox(5);
end;

procedure TFrmSimulation.ImgBox06Click(Sender: TObject);
begin
  AbreBox(6);
end;

procedure TFrmSimulation.ImgBox07Click(Sender: TObject);
begin
  AbreBox(7);
end;

procedure TFrmSimulation.ImgBox08Click(Sender: TObject);
begin
  AbreBox(8);
end;

procedure TFrmSimulation.ImgBox09Click(Sender: TObject);
begin
  AbreBox(9);
end;

procedure TFrmSimulation.ImgBox10Click(Sender: TObject);
begin
  AbreBox(10);
end;

procedure TFrmSimulation.ImgBox11Click(Sender: TObject);
begin
  AbreBox(11);
end;

procedure TFrmSimulation.ImgBox12Click(Sender: TObject);
begin
  AbreBox(12);
end;

procedure TFrmSimulation.EscondeLabelsBoxes(iAux : integer);
Var
  j : Integer;
begin
  LabNickPoke.Visible := False;
  LabLevelPoke.Visible := False;
  LabDesc1.Visible := False;
  LabEspeciePoke.Visible := False;
  ShapeResumo1.Visible := False;
  ShapeResumo2.Visible := False;
  ShapeResumo3.Visible := False;
  LabStats.Visible := False;
  LabResHP.Visible := False;
  LabResAtk.Visible := False;
  LabResDef.Visible := False;
  LabResSpe.Visible := False;
  LabResSat.Visible := False;
  LabResSdf.Visible := False;
  LabMove1.Visible := False;
  LabMove2.Visible := False;
  LabMove3.Visible := False;
  LabMove4.Visible := False;
  LabDescItem.Visible := False;
  for j := iAux to 32 do
    vImages[j].Visible := False;
end;

procedure TFrmSimulation.MostraLabelsBoxes;
begin
  LabNickPoke.Visible := True;
  LabLevelPoke.Visible := True;
  LabDesc1.Visible := True;
  LabEspeciePoke.Visible := True;
  ShapeResumo1.Visible := True;
  ShapeResumo2.Visible := True;
  ShapeResumo3.Visible := True;
  LabStats.Visible := True;
  LabResHP.Visible := True;
  LabResAtk.Visible := True;
  LabResDef.Visible := True;
  LabResSpe.Visible := True;
  LabResSat.Visible := True;
  LabResSdf.Visible := True;
  LabMove1.Visible := True;
  LabMove2.Visible := True;
  LabMove3.Visible := True;
  LabMove4.Visible := True;
  LabDescItem.Visible := True;
end;

procedure TFrmSimulation.Image24DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image24.Tag);
end;

procedure TFrmSimulation.Image25DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Self.Tag);
end;

procedure TFrmSimulation.Image26DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image26.tag);
end;

procedure TFrmSimulation.Image27DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image27.tag);
end;

procedure TFrmSimulation.Image28DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image28.tag);
end;

procedure TFrmSimulation.Image29DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image29.tag);
end;

procedure TFrmSimulation.Image30DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image30.tag);
end;

procedure TFrmSimulation.Image31DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image31.tag);
end;

procedure TFrmSimulation.Image32DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image32.tag);
end;

procedure TFrmSimulation.Image21DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image21.tag);
end;

procedure TFrmSimulation.Image22DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image22.tag);
end;

procedure TFrmSimulation.Image23DblClick(Sender: TObject);
begin
  BuscaDadosBoxes(Image23.tag);
end;

procedure TFrmSimulation.HabilitaBtnBoxes;
begin
  BtnRestaura.Enabled := True;
  BtnRestaura.Hint := 'Restaurar Pokémon';
  BtnTransfere.Enabled := True;
  BtnTransfere.Hint := 'Tranferir entre as Boxes';
  BtnExclui.Enabled := True;
  BtnExclui.Hint := 'Excluir da Box';
  ShapeSeleciona.Visible := True;
end;

procedure TFrmSimulation.BtnRestauraClick(Sender: TObject);
begin
  vImages[ShapeSeleciona.Tag].OnDblClick(self);
end;

procedure TFrmSimulation.BtnExcluiClick(Sender: TObject);
begin
MessageBeep(32);
If Application.MessageBox(PChar('Você tem certeza que quer excluir o pokémon da Box?'), PChar('Atenção!'), mb_YesNo + mb_DefButton2 + mb_IconQuestion) = IdYes then
  begin
    Excluir;
    MontaImgBoxes(BoxAtual);
    BtnSalvaBox.Tag := 0;
  end;
end;

procedure TFrmSimulation.BtnTransfereClick(Sender: TObject);
begin
  if FrmTransf = nil then
    FrmTransf := TFrmTransf.Create(Self);
  if (FrmTransf.ShowModal = MrOk) then
    begin
      If TranferesEntreBoxes(BtnTransfere.Tag,viMages[ShapeSeleciona.Tag].Tag) then
        Begin
          BoxAtual := BtnTransfere.Tag;
          MontaImgBoxes(BoxAtual);
          MessageBeep(48);
          Application.MessageBox(PChar('Tranferência realizada com sucesso!'), PChar('Aviso'),Mb_ok + MB_DEFBUTTON1 + MB_ICONINFORMATION);
        End
    End
  Else
    begin
      MessageBeep(16);
      Application.MessageBox(PChar('Tranferência não confirmada!'), PChar('Erro'), mb_Ok + mb_IconError);
    end;
  FreeAndNil(FrmTransf);
end;

procedure TFrmSimulation.Excluir;
var
  Arq5Temp : File of tBoxes;
  Reg5Temp : tBoxes;
  Dir : String;
begin
  {arq5temp}
  GetDir(0,Dir);
  AssignFile(Arq5Temp,Dir+'\datatemp.bin');
  rewrite(Arq5Temp);
  seek(Arq5,0);
  while not Eof(Arq5) do
    begin
      If FilePos(Arq5) <> vImages[ShapeSeleciona.Tag].Tag then
        begin
          Read(Arq5,Reg5);
          Reg5Temp := Reg5;
          Seek(Arq5Temp, Filesize(Arq5Temp));
          Write(Arq5Temp, Reg5Temp);
        end
      else
        Seek(Arq5,FilePos(Arq5)+1);
    end;
    CloseFile(Arq5Temp);
    CloseFile(Arq5);
    DeleteFile(Dir + '\data5.bin');
    RenameFile(Dir + '\datatemp.bin', Dir + '\data5.bin');
   {arq5}
    AssignFile(Arq5,Dir+'\data5.bin');
    {$I-}
      reset(Arq5);
   {$I+}
end;


function TFrmSimulation.TranferesEntreBoxes(NovaBox,Pos: Integer): Boolean;
begin
  If RetornaQtdeBox(NovaBox) = 32 then
    begin
      Result := False;
      MessageBeep(16);
      Application.MessageBox(PChar('A Box selecionada está Cheia!'), PChar('Erro'), mb_Ok + mb_IconError);
    end
  else if NovaBox = BoxAtual then
    begin
      MessageBeep(16);
      Application.MessageBox(PChar('O Pokémon já está nessa Box! '), PChar('Erro'), mb_Ok + mb_IconError);
      Result := False;
    end
  else
    begin
      Seek(Arq5,Pos);
      Read(Arq5,Reg5);
      Reg5.Box := NovaBox;
      Seek(Arq5,Pos);
      Write(Arq5,Reg5);
      Result := True;
    end;
end;

function TFrmSimulation.RetornaQtdeBox(Box: Integer): Integer;
begin
  Result := 0;
  Seek(Arq5,0);
  While Not eof(Arq5) do
    begin
      read(Arq5,Reg5);
      If Reg5.Box = Box then
        Result := Result + 1
    end;
end;

procedure TFrmSimulation.BtnFechaBoxClick(Sender: TObject);
begin
  ImgBox01.Left := 697;
  ImgBox02.Left := 697;
  ImgBox03.Left := 697;
  ImgBox04.Left := 697;
  ImgBox05.Left := 697;
  ImgBox06.Left := 697;
  ImgBox07.Left := 671;
  ImgBox08.Left := 671;
  ImgBox09.Left := 671;
  ImgBox10.Left := 671;
  ImgBox11.Left := 671;
  ImgBox12.Left := 671;
  PanBox.Visible := False;
  ImgNumBox.Visible := False;
  BtnFechaBox.Visible := False;
end;

procedure TFrmSimulation.CmBItensChange(Sender: TObject);
begin
  //Busca na StringList a descrição deste item
  CmBItens.Hint := RetornaStringQuebrada(sLista10.Strings[CmBItens.ItemIndex]);
end;

procedure TFrmSimulation.EdtNickExit(Sender: TObject);
begin
  If EdtNick.Text = '' then
    EdtNick.Text := CmBPokes.Text;
end;

procedure TFrmSimulation.CmBPokesExit(Sender: TObject);
begin
If CmBPokes.ItemIndex < 0 then
  CmBPokes.SetFocus;
end;


procedure TFrmSimulation.TBHPChange(Sender: TObject);
begin
    TotalEvs;
    if LabTotalEVs.Tag < 0 then
      BarrasEV
    else
      AtualizaAtributos(1);
   LabEvHP.Caption := IntToStr(TBHP.Value);
end;

procedure TFrmSimulation.RBFemaleClick(Sender: TObject);
begin
  CarregaIMG(ImgPkmn,1,CmBPokes.ItemIndex + 1);
end;

procedure TFrmSimulation.RBMaleClick(Sender: TObject);
begin
  CarregaIMG(ImgPkmn,1,CmBPokes.ItemIndex + 1);
end;

procedure TFrmSimulation.CmBPokesChange(Sender: TObject);
begin
  BtnConfirmaClick(Self);
end;

procedure TFrmSimulation.ImgPkmnClick(Sender: TObject);
var
 iAux : Integer;
begin
  iAux := CmBPokes.ItemIndex + 1;
  if ImgPkmn.Tag = 1 then
    ImgPkmn.Tag := 2
  else
    ImgPkmn.Tag := 1;
  CarregaIMG(ImgPkmn,1,iAux);
end;

procedure TFrmSimulation.MudaPokeSelecBox(idPoke, idLeft, idTop, novValor: Integer);
begin
  MostraPokesBoxes(idPoke);
  ShapeSeleciona.Left := idLeft;
  ShapeSeleciona.Top := idTop;
  ShapeSeleciona.Tag := novValor;
  HabilitaBtnBoxes;
end;

procedure TFrmSimulation.AbreBox(idBox:Integer);
begin
  BtnFechaBox.Visible := True;
  ImgNumBox.Visible := True;
  CarregaIMG(ImgNumBox,3,idBox);
  if not PanBox.Visible then
  begin
    PanBox.Visible := True;
    ImgBox01.Left := 865;
    ImgBox02.Left := 865;
    ImgBox03.Left := 865;
    ImgBox04.Left := 865;
    ImgBox05.Left := 865;
    ImgBox06.Left := 865;
    ImgBox07.Left := 839;
    ImgBox08.Left := 839;
    ImgBox09.Left := 839;
    ImgBox10.Left := 839;
    ImgBox11.Left := 839;
    ImgBox12.Left := 839;
  end;
  BoxAtual := idBox;
  MontaImgBoxes(BoxAtual);
end;

procedure TFrmSimulation.AtualizaAtributos(idAtrib: Integer);
begin
  if idAtrib=0 then //todos
    begin
      calcResultados(1);
      calcResultados(2);
      calcResultados(3);
      calcResultados(4);
      calcResultados(5);
      calcResultados(6);
    end
  else
    calcResultados(idAtrib);
end;

procedure TFrmSimulation.CmBIVATKClick(Sender: TObject);
begin
  CalcHP;
  AtualizaAtributos(2);
end;

procedure TFrmSimulation.CmBIVHPChange(Sender: TObject);
begin
  CalcHP;
  AtualizaAtributos(1);
end;

procedure TFrmSimulation.CmBIVATKChange(Sender: TObject);
begin
  CalcHP;
  AtualizaAtributos(2);
end;

procedure TFrmSimulation.CmBIVDEFChange(Sender: TObject);
begin
  CalcHP;
  AtualizaAtributos(3);
end;

procedure TFrmSimulation.CmBIVSPEChange(Sender: TObject);
begin
  CalcHP;
  AtualizaAtributos(4);
end;

procedure TFrmSimulation.CmBIVSATChange(Sender: TObject);
begin
  CalcHP;
  AtualizaAtributos(5);
end;

procedure TFrmSimulation.CmBIVSDFChange(Sender: TObject);
begin
  CalcHP;
  AtualizaAtributos(6);
end;

procedure TFrmSimulation.CmBPokesKeyPress(Sender: TObject; var Key: Char);
begin
  //converte primeira letra em minuscula
  if CmBPokes.SelStart = 0 then
    Key := AnsiUpperCase(Key)[1]
end;

procedure TFrmSimulation.StringGridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  C,L : Integer;
begin
  if sLista7.Count > 0 then
  begin
    //retorna a coluna e linha
    StringGrid.MouseToCell(X, Y, C, L);
    //Se eu mudei de linha, busco o Hint
    if L <> StringGrid.Tag then
    begin
      Application.CancelHint;
      StringGrid.Hint :=  RetornaStringQuebrada(sLista7.Strings[L]);
      StringGrid.Tag := L;
    end;
  end;  
end;

function TFrmSimulation.RetornaStringQuebrada(StrIni: String): String;
Var
  StrFin : String[255];
  i : Integer;
begin
  StrFin := '';
  i := 80;
  while i < Length(StrIni) do
  begin
    if StrIni[i]<>' ' then
      i:=i+1
    else
      begin
        StrFin := StrFin + Copy(StrIni,1,i)+#13;
        StrIni := Copy(StrIni,i,Length(StrIni));
        i := 80;
      end;
  end;
  StrFin := StrFin + StrIni;
  Result := StrFin;
end;

end.
