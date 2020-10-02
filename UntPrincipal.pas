unit UntPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ComCtrls, Buttons, WinSkinData, WinSkinStore,
  SkinCaption, IniFiles, RXCtrls, ExtCtrls, GIFImage, RXSlider, ImgList;

//estrutura dos registros
Type
  tPoke = packed record
    seq
   ,nro
   ,tipo_1
   ,tipo_2
   ,trait_1
   ,trait_2
   ,egg_group_1
   ,egg_group_2
   ,bhp
   ,batk
   ,bdef
   ,bsat
   ,bsdf
   ,bspe : integer;
    nom : string[10];
    per_sexoF
   ,per_sexoM : Real;
end;
//estrutura das habilidades
Type
  tTraits = packed record
    Cod : Integer;
    Nome : string[12];
    Descr: string[140];
end;
//estrutura dos itens
Type
  tItens = packed record
  cd_item : Integer;
  nm_item : String[12];
  ds_item : String[240];
end;
//estrutura dos golpes
Type
  tGolpes = packed record
  cd_golpe : Integer;
  nm_golpe : String[12];
  cd_tipo, cd_categ, qt_poder, qt_precisao, qt_pp : Integer;
  ds_golpe : String[240];
end;
//estrutura dos golpes aprendidos
Type
  tPokeGolpes = packed record
  CodPkmn, CodAtk : Integer;
  DesPor : String[12];
end;
//estrutura das boxes
Type
  tBoxes = Packed Record
    Box, codPkmn : Integer;
    Nick : String[15];
    IdxIVHP, IdxIVATK, IdxIVDEF, IdxIVSPE, IdxIVSAT, IdxIVSDF : Integer;
    ValEVHP, ValEVATK, ValEVDEF, ValEVSPE, ValEVSAT, ValEVSDF : Integer;
    ResHP, ResATK, ResDEF, ResSPE, ResSAT, ResSDF : Integer; //não mais usados
    idxItem, IdxNature, TagImg, Trait : Integer;
    tagGolpe1, tagGolpe2, tagGolpe3, tagGolpe4 : Integer;
    Gender, Level : Integer;
    Move1, Move2, Move3, Move4 : String[12];
    Item : String[15];
end;

type
  TFrmPrincipal = class(TForm)
    SBtnOptions: TSpeedButton;
    BarraStatus: TStatusBar;
    GrpBoxAtrib: TGroupBox;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel8: TRxLabel;
    EdtBaseHP: TEdit;
    EdtBaseATK: TEdit;
    EdtBaseDEF: TEdit;
    EdtBaseSAT: TEdit;
    EdtBaseSDF: TEdit;
    EdtBaseSPE: TEdit;
    RadFemale: TRadioButton;
    RadMale: TRadioButton;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    CmbIVATK: TComboBox;
    CmbIVDEF: TComboBox;
    CmbIVSAT: TComboBox;
    CmbIVSDF: TComboBox;
    CmbIVSPE: TComboBox;
    CmbPokes: TComboBox;
    RxLabel4: TRxLabel;
    RxLabel11: TRxLabel;
    BtnLevelLeft: TSpeedButton;
    EdtLevel: TEdit;
    BtnLevelRight: TSpeedButton;
    RxLabel12: TRxLabel;
    EdtNick: TEdit;
    RxLabel13: TRxLabel;
    CmBNature: TComboBox;
    RxLabel14: TRxLabel;
    GroupBox1: TGroupBox;
    RadTrait1: TRadioButton;
    RadTrait2: TRadioButton;
    GroupBox2: TGroupBox;
    LabResultHP: TRxLabel;
    LabResultATK: TRxLabel;
    LabResultDEF: TRxLabel;
    LabResultSPE: TRxLabel;
    LabResultSAT: TRxLabel;
    LabResultSDF: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel15: TRxLabel;
    CmbIVHP: TComboBox;
    StringGrid: TStringGrid;
    CmBItens: TComboBox;
    RxLabel30: TRxLabel;
    SknForm: TSkinData;
    RxLabel20: TRxLabel;
    RxLabel21: TRxLabel;
    RxLabel22: TRxLabel;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    RxLabel25: TRxLabel;
    EdtMove1: TEdit;
    EdtMove2: TEdit;
    EdtMove3: TEdit;
    EdtMove4: TEdit;
    RxLabel27: TRxLabel;
    CmBTipoHP: TComboBox;
    EdtPowerHP: TEdit;
    RxLabel28: TRxLabel;
    RxLabel16: TRxLabel;
    TBEvHp: TTrackBar;
    TBEvAtk: TTrackBar;
    TBEvDef: TTrackBar;
    TBEvSat: TTrackBar;
    TBEvSdf: TTrackBar;
    TBEvSpe: TTrackBar;
    PBTotalEVs: TProgressBar;
    LabTotalEVs: TRxLabel;
    ImageList: TImageList;
    SknCaption: TSkinCaption;
    TabBoxes: TTabControl;
    ShapeContorno: TShape;
    ShapeImagem: TShape;
    ImgTipo1: TImage;
    ImgTipo2: TImage;
    ImgPkmn: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadMaleClick(Sender: TObject);
    procedure RadFemaleClick(Sender: TObject);
    procedure ImgPkmnClick(Sender: TObject);
    procedure CmbPokesChange(Sender: TObject);
    procedure EdtLevelExit(Sender: TObject);
    procedure EdtLevelKeyPress(Sender: TObject; var Key: Char);
    procedure BtnLevelRightClick(Sender: TObject);
    procedure BtnLevelLeftClick(Sender: TObject);
    procedure CmbPokesKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CmBNatureChange(Sender: TObject);
    procedure CmbIVHPChange(Sender: TObject);
    procedure CmbIVATKChange(Sender: TObject);
    procedure CmbIVDEFChange(Sender: TObject);
    procedure CmbIVSATChange(Sender: TObject);
    procedure CmbIVSDFChange(Sender: TObject);
    procedure CmbIVSPEChange(Sender: TObject);
    procedure TBEvHpChange(Sender: TObject);
    procedure TBEvAtkChange(Sender: TObject);
    procedure TBEvDefChange(Sender: TObject);
    procedure TBEvSatChange(Sender: TObject);
    procedure TBEvSdfChange(Sender: TObject);
    procedure TBEvSpeChange(Sender: TObject);
    procedure StringGridClick(Sender: TObject);
    procedure StringGridDblClick(Sender: TObject);
    procedure EdtMove1Click(Sender: TObject);
    procedure EdtMove2Click(Sender: TObject);
    procedure EdtMove3Click(Sender: TObject);
    procedure EdtMove4Click(Sender: TObject);
    procedure SBtnOptionsClick(Sender: TObject);
    procedure StringGridKeyPress(Sender: TObject; var Key: Char);
    procedure CmBTipoHPChange(Sender: TObject);
    procedure RadTrait1Enter(Sender: TObject);
    procedure RadTrait2Enter(Sender: TObject);
    procedure CmBItensChange(Sender: TObject);
    //
    procedure atualizaSkin(str : String);
    procedure TabBoxesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    //arquivos
    ArqPokes  : File of tPoke;
    ArqTraits : File of tTraits;
    ArqItens  : File of tItens;
    ArqGolpes : File of tGolpes;
    ArqPokeGolpes : File of tPokeGolpes;
    ArqBoxes : File of tBoxes;
    //registros
    RegPokes  : tPoke;
    RegTraits : tTraits;
    RegItens  : tItens;
    RegGolpes : tGolpes;
    RegPokeGolpes : tPokeGolpes;
    RegBoxes : tBoxes;
    //vetores com posições conforme a ordenação
    vetAlfa : array[0..499] of integer;
    vetEvol : array[0..499] of integer;
    //vetores e variável para o controle dos evs
    vEVTracks : array[0..5] of TTrackBar;
    indUltTBAlt : Integer;
    //vetor com os edits de golpes
    vEditGolpes : array[0..4] of TEdit;
    //listas auxiliares
    sListaItens,
    sListaGolpe0, sListaGolpe1, sListaGolpe2,
    sListaGolpe3, sListaGolpe4, sListaGolpe5,
    sListaGolpe6, sListaGolpe7, sListaGolpe8 : TStringList;
    //imagem auxiliar para pintar no StringGrid
    ImgAux: TImage;
    //Coordenadas para DragDrop das imagens
    TheSpot : TPoint;
    //vetor com as imagens criadas dinamicamente para a BOX
    vImgBoxes : array[0..49] of TImage;
    //procedure e functions gerais
    procedure leituraIni;
    procedure AbreArquivosDados;
    procedure RestauraPoke(seq : Integer);
    procedure RestauraPokeGolpes(seq : Integer);
    procedure CarregaIMG(ImgDst: TImage; id: Integer; Cod: Integer);
    procedure montaVetores;
    procedure montaListagemPokes;
    procedure RestauraItens;
    function retVarNature(seqNature,seqAtribut: Integer) : Real;
    function CalculaAtributo(seqPoke,seqAtribut,valLevel,valBase,valIV,valEV,seqNature: Integer) : Integer;
    procedure AtualizaAtributos(seqAtribut,valBase,valIV,valEV: Integer; labResult: TRxLabel);
    function RestauraTrait(opt: Integer; seq: Integer) : String;
    function calculaTotalEVs(valHP,valATK,valDEF,valSAT,valSDF,valSPE : Integer) : Integer;
    function retTBDisp(TBIgnore : TTrackBar) : Integer;
    function retRestoEvs(TBAtual : TTrackBar) : Integer;
    procedure controlaEVs(TBAtual : TTrackBar);
    procedure controlaGolpes(duploClick : Boolean);
    function retEditGolpeDisp : TEdit;
    procedure limpaEditGolpes;
    procedure GolpeClick(edtAtual : Tedit);
    function calcPoderHP(valIVHP, valIVATK, valIVDEF, valIVSAT, valIVSDF, valIVSPE : Integer) : Integer;
    function calcTipoHP(valIVHP, valIVATK, valIVDEF, valIVSAT, valIVSDF, valIVSPE : Integer) : Integer;
    procedure controlaHP(tipExec : Integer);
    function LPad(value:String; tamanho:Integer; caractere:Char): string;
    procedure mostraMsgBarraStatus(ind:Integer; msg:String);
    //Controle das boxes
    procedure carregaBox(indBox:Integer);
    procedure restauraPokeDaBox(idxRegis:Integer);
    procedure golpeDaBox(valTagGolpe:Integer; desGolpe: String);
    procedure DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DragOver(Sender, Source: TObject; X, Y: Integer;
                         State: TDragState; var Accept: Boolean);
    procedure MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure onClick(Sender: TObject);
    procedure onDblClick(Sender: TObject);
  public
    OptList, MostraNro : Integer;
    Skin : String;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses UntOptions, SyncObjs;

{$R *.dfm}

//ao criar o formulário
procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  //monta os vetores para o deXpara na ordenação dos pokés
  //e para o controle dos EVs
  montaVetores;
  //cria as listas para busca dos golpes
  sListaItens := TStringList.Create;
  sListaGolpe0 := TStringList.Create;
  sListaGolpe1 := TStringList.Create;
  sListaGolpe2 := TStringList.Create;
  sListaGolpe3 := TStringList.Create;
  sListaGolpe4 := TStringList.Create;
  sListaGolpe5 := TStringList.Create;
  sListaGolpe6 := TStringList.Create;
  sListaGolpe7 := TStringList.Create;
  sListaGolpe8 := TStringList.Create;
  //cria a imagem auxiliar
  ImgAux := TImage.Create(Self);
  ImgAux.Transparent := True;
  //le as configs do .ini
  leituraIni;
  //retirar o caption de test do form
  SknCaption.Active := True;
  //atualiza a skin conforme o valor selecionado
  atualizaSkin(Skin);
  SknForm.Active := True;
  //abre arquivos de dados
  AbreArquivosDados;
  //inicializa variaveis de controle
  ImgPkmn.Tag := 0;
  indUltTBAlt := 0;
  //monta a listagem dos pokés
  montaListagemPokes;
  //monta os itens
  RestauraItens;
  //ligar na Tab das Boxes dos eventos de drag/drop da image
  TabBoxes.OnDragOver := DragOver;
  TabBoxes.OnDragDrop := DragDrop;
end;

//ao ativar o form
procedure TFrmPrincipal.FormActivate(Sender: TObject);
begin
  //hints da aplicação
  Application.HintColor := FrmPrincipal.Color;
  Application.HintHidePause := 100000 ; // Sustenta o Hint em quase 2min
  //carrega box 1
  carregaBox(1);
end;

//ao fechar a aplicação
procedure TFrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //libera as variáveis
  sListaItens.Free;
  sListaGolpe0.Free;
  sListaGolpe1.Free;
  sListaGolpe2.Free;
  sListaGolpe3.Free;
  sListaGolpe4.Free;
  sListaGolpe5.Free;
  sListaGolpe6.Free;
  sListaGolpe7.Free;
  sListaGolpe8.Free;
  //fecha os arquivos de dados
  CloseFile(ArqPokes);
  CloseFile(ArqTraits);
  CloseFile(ArqItens);
  CloseFile(ArqGolpes);
  CloseFile(ArqPokeGolpes);
  //finalizando a aplicação
  Application.Terminate;
end;

//Leitura do arquivo .ini com as configs do cara
procedure TFrmPrincipal.leituraIni;
  var ArqIni : TIniFile;
  var Dir : String;
begin
  //Busca o diretório de execução
  Dir := ExtractFilePath(Application.ExeName);
  //Busca o path do arquivo
  ArqIni := TIniFile.Create(Dir+'\cfg.ini');
  Try
    OptList := ArqIni.ReadInteger('Options', 'Listagem', 0);
    MostraNro := ArqIni.ReadInteger('Options', 'MostraNro', 0);
    Skin := ArqIni.ReadString('Options', 'Skin','');
  Finally
    ArqIni.Free;
  end;
end;

//chama form de opções
procedure TFrmPrincipal.SBtnOptionsClick(Sender: TObject);
  var ArqIni : TIniFile;
  var Dir : String;
  var atualizar : boolean;
begin
  FrmOptions := TFrmOptions.Create(Application);
  FrmOptions.ShowModal;
  If FrmOptions.ModalResult = mrOk Then
    begin
      //Busca o diretório de execução
      Dir := ExtractFilePath(Application.ExeName);
      //Busca o path do arquivo
      ArqIni := TIniFile.Create(Dir+'\cfg.ini');
      Try
        ArqIni.WriteInteger('Options', 'Listagem',FrmOptions.CmbOptListagens.ItemIndex);
        ArqIni.WriteInteger('Options', 'MostraNro',FrmOptions.CmbMostraNro.ItemIndex);
        ArqIni.WriteString('Options', 'Skin',FrmOptions.CmbOptSkins.Items.Strings[FrmOptions.CmbOptSkins.ItemIndex]);
      Finally
        ArqIni.Free;
      end;
      if (OptList <> FrmOptions.CmbOptListagens.ItemIndex) or (MostraNro <> FrmOptions.CmbMostraNro.ItemIndex) then
        atualizar := true
      else
        atualizar := false;
      //grava nas vars de controle...
      OptList := FrmOptions.CmbOptListagens.ItemIndex;
      MostraNro := FrmOptions.CmbMostraNro.ItemIndex;
      Skin := FrmOptions.CmbOptSkins.Text;
      if atualizar then
        montaListagemPokes;
    end
  Else
    begin
      if FrmOptions.CmbOptSkins.Items.Strings[FrmOptions.CmbOptSkins.ItemIndex] <> Skin then
        atualizaSkin(Skin);
    end;
  FrmOptions.Free;
  FrmOptions := Nil;
end;

//recebe uma String e atualiza a skin do form
procedure TFrmPrincipal.atualizaSkin(str: String);
begin
  SknForm.LoadFromFile(ExtractFilePath(Application.ExeName) + 'skins\' + str);
  SknForm.Active := True;
  SknForm.DoSkinChanged;
end;

//procedure responsável por abrir os arquivos de dados...
procedure TFrmPrincipal.AbreArquivosDados;
Var
  sDir : String;
begin
  //Busca o diretório de execução
  GetDir(0,sDir);
  {Pokes}
  //Adiciona ao arquivo um caminho
  AssignFile(ArqPokes,sDir+'\data1.bin');
  {$I-}
  reset(ArqPokes);
  //processa parametro indSainda
  if ioresult <> 0 then
  begin
    //mensagem
    Application.MessageBox(PChar('Arquivo '+sDir+'\data1.bin'+' não encontrado! Finalizando a aplicação!'), PChar('Erro'),Mb_ok + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    //finalizando a aplicação
    Application.Terminate;
  end;
  {Traits}
  AssignFile(ArqTraits,sDir+'\data4.bin');
  reset(ArqTraits);
  //processa parametro indSainda
  if ioresult <> 0 then
  begin
    //mensagem
    Application.MessageBox(PChar('Arquivo '+sDir+'\data4.bin'+' não encontrado! Finalizando a aplicação!'), PChar('Erro'),Mb_ok + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    //finalizando a aplicação
    Application.Terminate;
  end;
  {Itens}
  AssignFile(ArqItens,sDir+'\data6.bin');
  reset(ArqItens);
  //processa parametro indSainda
  if ioresult <> 0 then
  begin
    //mensagem
    Application.MessageBox(PChar('Arquivo '+sDir+'\data6.bin'+' não encontrado! Finalizando a aplicação!'), PChar('Erro'),Mb_ok + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    //finalizando a aplicação
    Application.Terminate;
  end;
  {Golpes}
  AssignFile(ArqGolpes,sDir+'\data2.bin');
  reset(ArqGolpes);
  //processa parametro indSainda
  if ioresult <> 0 then
  begin
    //mensagem
    Application.MessageBox(PChar('Arquivo '+sDir+'\data2.bin'+' não encontrado! Finalizando a aplicação!'), PChar('Erro'),Mb_ok + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    //finalizando a aplicação
    Application.Terminate;
  end;
  {ligação entre os Pokés e os Golpes}
  AssignFile(ArqPokeGolpes,sDir+'\data3.bin');
  reset(ArqPokeGolpes);
  //processa parametro indSainda
  if ioresult <> 0 then
  begin
    //mensagem
    Application.MessageBox(PChar('Arquivo '+sDir+'\data3.bin'+' não encontrado! Finalizando a aplicação!'), PChar('Erro'),Mb_ok + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    //finalizando a aplicação
    Application.Terminate;
  end;
  {Boxes}
  AssignFile(ArqBoxes,sDir+'\data5.bin');
  reset(ArqBoxes);
  //processa parametro indSainda
  if ioresult <> 0 then
    //criar um novo
    rewrite(ArqBoxes);
  {$I+}
end;

//procedure que recebe o seq do poké e procura o registro do mesmo no arquivo de dados
procedure TFrmPrincipal.RestauraPoke(seq: Integer);
begin
  //procurar
  Try
    seek(ArqPokes,seq);
    //lendo
    read(ArqPokes,RegPokes);
    //atribuindo para os edits os valores das bases
    EdtBaseHP.Text := IntToStr(RegPokes.bhp);
    EdtBaseATK.Text := IntToStr(RegPokes.batk);
    EdtBaseDEF.Text := IntToStr(RegPokes.bdef);
    EdtBaseSAT.Text := IntToStr(RegPokes.bsat);
    EdtBaseSDF.Text := IntToStr(RegPokes.bsdf);
    EdtBaseSPE.Text := IntToStr(RegPokes.bspe);
    //processando a(s) habilidade(s)
    if RegPokes.trait_2 = 77 then
      RadTrait2.Visible := False
    else
      begin
        RadTrait2.Visible := True;
        RadTrait2.Caption := RestauraTrait(0,RegPokes.trait_2);
        RadTrait2.Tag := RegPokes.trait_2;
      end;
    RadTrait1.Caption := RestauraTrait(0,RegPokes.trait_1);
    RadTrait1.Checked := True;
    RadTrait1.Tag := RegPokes.trait_1;
    //processando o sexo
    //quando assexuados
    if (RegPokes.per_sexoF =  0) and (RegPokes.per_sexoM = 0) then
      begin
        //desabilita a troca
        RadFemale.Enabled := False;
        RadMale.Enabled := False;
        RadFemale.Checked := False;
        RadMale.Checked := False;
      end
    //quando apenas macho
    else if (RegPokes.per_sexoF = 0) then
      begin
        //não é possível selecionar fêmea
        RadFemale.Enabled := False;
        RadMale.Enabled := True;
        RadMale.Checked := True;
      end
    //quando apenas fêmea
    else if RegPokes.per_sexoM = 0 then
      begin
        //não é possível selecionar macho
        RadFemale.Checked := True;
        RadMale.Enabled := False;
        RadFemale.Enabled := True;
      end
    //pode ser macho ou fêmêa
    else
      begin
        RadMale.Checked := True;
        RadFemale.Enabled := True;
        RadMale.Enabled := True;
      end;
    //pintar a img do bicho
    CarregaIMG(ImgPkmn,1,seq+1);
    //pintar e posicionar o(s) tipo(s)
    CarregaIMG(ImgTipo1,3,RegPokes.tipo_1);
    //quando tipo = 18 não tem, então não pinta
    if RegPokes.tipo_2 <> 18 then
      begin
        CarregaIMG(ImgTipo2,3,RegPokes.tipo_2);
        ImgTipo2.Visible := True;
        ImgTipo1.Left := 262;
      end
    else
      begin
        ImgTipo2.Visible := False;
        ImgTipo1.Left := 280;
      end;
    //buscando os golpes do bicho
    RestauraPokeGolpes(seq);
    //Atualizando todos atributos
    AtualizaAtributos(0,0,0,0,nil);
    //limpa barra de status
    mostraMsgBarraStatus(0,'');
  Except
  end;
end;

//buscar no arquivo de habilidades o nome ou a descrição
function TFrmPrincipal.RestauraTrait(opt: Integer; seq: Integer) : String;
begin
  //busca
  Seek(ArqTraits,seq-1);
  //le
  Read(ArqTraits,RegTraits);
  //retornando
  if opt = 0 then
    Result := RegTraits.Nome
  else
    Result := RegTraits.Descr;
end;

//conforme o parâmetro passado, vai buscar a imagem em uma dll
//e pinta a mesma em um TImage
procedure TFrmPrincipal.CarregaIMG(ImgDst: TImage; id: Integer; Cod: Integer);
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
        If ImgDst.Tag = 0 then //img normal
          if (not RadFemale.Enabled) or (not RadMale.Enabled) or RadMale.Checked then
            LibHandle := Loadlibrary('imgn1.dll') //macho ou assexuados
          else
            LibHandle := Loadlibrary('imgn2.dll') //fêmea
        else  //img shiny
          if (not RadFemale.Enabled) or (not RadMale.Enabled) or RadMale.Checked then
            LibHandle := Loadlibrary('imgs1.dll') //macho ou assexuados
          else
            LibHandle := Loadlibrary('imgs2.dll') //fêmea
      end;
    2 : LibHandle := Loadlibrary('imgm.dll'); //Miniaturas
    3 : LibHandle := Loadlibrary('imgt.dll'); //Tipo e Característica do golpe
    4 : LibHandle := LoadLibrary('imgi.dll');//Itens
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

//pintar a imagem de macho
procedure TFrmPrincipal.RadMaleClick(Sender: TObject);
begin
  CarregaIMG(ImgPkmn,1,CmbPokes.Tag+1);
end;

//pintar a imagem de fêmea
procedure TFrmPrincipal.RadFemaleClick(Sender: TObject);
begin
  CarregaIMG(ImgPkmn,1,CmbPokes.Tag+1);
end;

//Muda a tag da imagem, para alternar entre shiny ou não
procedure TFrmPrincipal.ImgPkmnClick(Sender: TObject);
begin
  if ImgPkmn.Tag = 0 then
    ImgPkmn.Tag := 1
  else
    ImgPkmn.Tag := 0;
  CarregaIMG(ImgPkmn,1,CmbPokes.Tag+1);
end;

//procedimento responsável por montar o combo box com os pokés a selecionar
procedure TFrmPrincipal.montaListagemPokes;
  var
    i : Integer;
    str : String[15];
begin
  //limpa o combo
  CmbPokes.Items.Clear;
  //verifica qual a opção que o cara selecionou
  if OptList = 0 then
    //alfa
    begin
      for i := 0 to 499 do
        begin
          //procurar
          seek(ArqPokes,vetAlfa[i]-1);
          //lendo
          read(ArqPokes,RegPokes);
          str :=  RegPokes.nom;
          if MostraNro = 0 then
            str := LPad(IntToStr(RegPokes.nro),3,'0') + '-' + str;
          //coloca no item
          CmbPokes.AddItem(str,Self);
        end;
    end
  else if OptList = 1 then
    //numerica
    begin
      for i := 0 to 499 do
        begin
          //procurar
          seek(ArqPokes,i);
          //lendo
          read(ArqPokes,RegPokes);
          str :=  RegPokes.nom;
          if MostraNro = 0 then
            str := LPad(IntToStr(RegPokes.nro),3,'0') + '-' + str;
          //coloca no item
          CmbPokes.AddItem(str,Self);
        end;
    end
  else
    begin
      //evolutiva
      for i := 0 to 499 do
        begin
          //procurar
          seek(ArqPokes,vetEvol[i]-1);
          //lendo
          read(ArqPokes,RegPokes);
          str :=  RegPokes.nom;
          if MostraNro = 0 then
            str :=  LPad(IntToStr(RegPokes.nro),3,'0') + '-' + str;
          //coloca no item
          CmbPokes.AddItem(str,Self);
        end;
    end;
  //ajuste da largura do campo
  if MostraNro = 0 then
    CmbPokes.width := 137
  else
    CmbPokes.width := 105;
  //seleciona o primeiro
  CmbPokes.ItemIndex := 0;
  //simula a seleção da opção
  CmbPokesChange(Self);
end;

//retorna o percentual de variação da nature selecionada para o atributo sendo calculado
function TFrmPrincipal.retVarNature(seqNature,seqAtribut: Integer): Real;
  var
    valRes : Real;
begin
  //inicializa valores
  valRes := 1;
  //De acordo com o atributo passado
  case seqAtribut of
    2: //atk
      begin
        if (seqNature in [1,2,3,4]) then
          valRes := 1.1
        else
          if (seqNature in [6,11,16,21]) then
            valRes := 0.9;
      end;
    3: //def
      begin
        if (seqNature in [6,7,8,9]) then
          valRes := 1.1
        else
          if (seqNature in [1,12,17,22]) then
            valRes := 0.9;
      end;
    4: //spe
      begin
        if (seqNature in [11,12,13,14]) then
          valRes := 1.1
        else
          if (seqNature in [2,7,18,23]) then
            valRes := 0.9;
      end;
    5: //sat
      begin
        if (seqNature in [16,17,18,19]) then
          valRes := 1.1
        else
          if (seqNature in [3,8,13,24]) then
            valRes := 0.9;
      end;
    6: //sdf
      begin
        if (seqNature in [21,22,23,24]) then
          valRes := 1.1
        else
          if (seqNature in [4,9,14,19]) then
            valRes := 0.9;
      end;
  end;
  //retorno
  Result := valRes;
end;

//função que retorna o valor do atributo calculado, já levando em consideração modificadores
function TFrmPrincipal.CalculaAtributo(seqPoke,seqAtribut,valLevel,valBase,valIV,valEV,seqNature: Integer) : Integer;
  var
    valCalc : Real;
begin
  if seqAtribut = 1 then {HP}
    begin
      {Somente para shedinja}
      if seqPoke = 291 then
        //HP fixo = 1
        valCalc := 1
      else
        begin
          {efetua o calculo de HP}
          valCalc := (((valLevel * ((valBase * 2) + valIV + Trunc(valEv / 4))) / 100) + 10 + valLevel);
        end;
    end
  else {Demais}
    begin
      {efetua o calculo geral}
      valCalc := ((valLevel * ( (valBase * 2) + valIV + Trunc(valEV/4) ) / 100) + 5 ) * retVarNature(seqNature,seqAtribut);
    end;
  Result := Trunc(valCalc);
end;

//procedimento que atualiza ou todos os atributos, ou apenas o atributo passado
procedure TFrmPrincipal.AtualizaAtributos(seqAtribut,valBase,valIV,valEV: Integer; labResult: TRxLabel);
begin
  if seqAtribut = 0 then //todos
    begin
      LabResultHP.Caption := IntToStr(CalculaAtributo(CmbPokes.Tag,1,StrToInt(EdtLevel.Text),StrToInt(EdtBaseHP.Text),StrToInt(CmbIVHP.Text),TBEvHP.Position,CmBNature.ItemIndex));
      LabResultATK.Caption := IntToStr(CalculaAtributo(CmbPokes.Tag,2,StrToInt(EdtLevel.Text),StrToInt(EdtBaseATK.Text),StrToInt(CmbIVATK.Text),TBEvATK.Position,CmBNature.ItemIndex));
      LabResultDEF.Caption := IntToStr(CalculaAtributo(CmbPokes.Tag,3,StrToInt(EdtLevel.Text),StrToInt(EdtBaseDEF.Text),StrToInt(CmbIVDEF.Text),TBEvDEF.Position,CmBNature.ItemIndex));
      LabResultSPE.Caption := IntToStr(CalculaAtributo(CmbPokes.Tag,4,StrToInt(EdtLevel.Text),StrToInt(EdtBaseSPE.Text),StrToInt(CmbIVSPE.Text),TBEvSPE.Position,CmBNature.ItemIndex));
      LabResultSAT.Caption := IntToStr(CalculaAtributo(CmbPokes.Tag,5,StrToInt(EdtLevel.Text),StrToInt(EdtBaseSAT.Text),StrToInt(CmbIVSAT.Text),TBEvSAT.Position,CmBNature.ItemIndex));
      LabResultSDF.Caption := IntToStr(CalculaAtributo(CmbPokes.Tag,6,StrToInt(EdtLevel.Text),StrToInt(EdtBaseSDF.Text),StrToInt(CmbIVSDF.Text),TBEvSDF.Position,CmBNature.ItemIndex));
    end
  else
    labResult.Caption := IntToStr(CalculaAtributo(CmbPokes.Tag,seqAtribut,StrToInt(EdtLevel.Text),valBase,valIV,valEV,CmBNature.ItemIndex));
  //calcula o poder do HP

end;

//função que retorna o total de EVs
function TFrmPrincipal.calculaTotalEVs(valHP,valATK,valDEF,valSAT,valSDF,valSPE : Integer) : Integer;
begin
  Result := ( 510 + ( - valHP - valATK - valDEF - valSAT - valSDF - valSPE));
end;

//função que retorna uma trackbar(atributo) que possa doar evs para suprir a falta
//por uma alteração em outra trackbar(atributo)
function TFrmPrincipal.retTBDisp(TBIgnore : TTrackBar) : Integer;
var
  TBAux : TTrackBar;
  i,j : Integer;
begin
  //Valor default, para caracterizar erro se não estiver diferente
  Result := -1;
  //Parte da ultima TB mechida
  if indUltTBAlt = 5 then
    j := 0
  else
    j := indUltTBAlt+1;
  //Interage sobre as Track Bars, procura em 6 intereções
  for i := 1 to 6 do
    begin
      TBAux := vEVTracks[j];
      if (TBAux.Position>1) and (TBAux<>TBIgnore) then
        begin
          Result := j;
          break;
        end
      else
        begin
          if j = 5 then
            j := 0
          else
            j := j + 1;
        end;
    end;
end;

//função que retorna o resto dos evs, desconsiderando o atributo sendo
//alterado altualmente
function TFrmPrincipal.retRestoEvs(TBAtual : TTrackBar): Integer;
var
  tot,i : Integer;
begin
  tot := 0;
  for i := 0 to 5 do
    if vEVTracks[i] <> TBAtual then
      tot := tot + vEVTracks[i].Position;
  Result := 510 - tot;
end;

//procedimendo que efetua todo o controle dos evs(effort values)
procedure TFrmPrincipal.controlaEVs(TBAtual : TTrackBar);
var
  i: Integer;
  strAux: String;
begin
  //retorna o total de evs já distribuídos e guarda na TAG e no label
  PBTotalEVs.Tag := calculaTotalEVs(TBEvHP.Position,TBEvATK.Position,TBEvDEF.Position,TBEvSAT.Position,TBEvSDF.Position,TBEvSPE.Position);
  LabTotalEVs.Caption := IntToStr(PBTotalEVs.Tag);
  //Quando maior ou igual a zero, ajusta o hint
  if PBTotalEVs.Tag >= 0 then
    begin
      LabTotalEVs.Caption := IntToStr(PBTotalEVs.Tag);
      LabTotalEVs.Hint := ('Total de Efforts restantes: ' +IntToStr(PBTotalEVs.Tag)+ ' ponto(s)');
      PBTotalEVs.Position := PBTotalEVs.Tag;
      TBAtual.Hint := IntToStr(TBAtual.Position);
    end
  else//deve ajustar o estouro
    begin
      //solicita o indice da barra que terá o desconto
      i := retTBDisp(TBAtual);
      //se veio -1 é pq não achou nenhuma
      if i <> -1 then
      begin
        //atualiza o valor para a barra
        vEVTracks[i].Position := RetRestoEVs(vEVTracks[i]);
        vEVTracks[i].Hint := IntToStr(vEVTracks[i].Position);
        //guarda a ultima barra alterada
        indUltTBAlt := i;
      end;
    end;
  //mostra na barra de status os evs distribuidos
  for i := 0 to 5 do
    if (vEVTracks[i].Position>1) then
      strAux := strAux + ' ' + UpperCase(Copy(vEvTracks[i].Name,5,3)) + ':' + IntToStr(vEVTracks[i].Position);
  mostraMsgBarraStatus(0,'EVs:'+strAux);
end;

//ao mudar o combo dos pokes
procedure TFrmPrincipal.CmbPokesChange(Sender: TObject);
var
  i : Integer;
begin
  if OptList = 0 then //Ordenação alfabética
    i := vetAlfa[CmbPokes.ItemIndex]
  else
    if OptList = 2 then //Ordenação eveolutiva
      i := vetEvol[CmbPokes.ItemIndex]
  else //Ordenação numérica
    i := CmbPokes.ItemIndex+1;
  CmbPokes.Tag := i-1;
  RestauraPoke(i-1);
end;

//ao sair do edit de level
procedure TFrmPrincipal.EdtLevelExit(Sender: TObject);
begin
  if EdtLevel.Text = '' then
    EdtLevel.Text := '1';
  if (StrToInt(EdtLevel.Text) <= 0) then
    EdtLevel.Text := '1'
  else if StrToInt(EdtLevel.Text) >= 100 then
    EdtLevel.Text := '100';
  //Recalcula todos os atributos
  AtualizaAtributos(0,0,0,0,nil);
end;

//somente aceitar numéros e enter, tab etc...
procedure TFrmPrincipal.EdtLevelKeyPress(Sender: TObject; var Key: Char);
begin
  If Not (Key in ['0'..'9',#8,#13,#27]) then
    Key := #0;
  if Key = #13 then
    EdtLevelExit(self);
end;

//botão para aumentar o level
procedure TFrmPrincipal.BtnLevelRightClick(Sender: TObject);
begin
  if Length(EdtLevel.Text)<>3 then
    begin
      //Aumenta em um nivel
      EdtLevel.Text := IntToStr( StrToInt(EdtLevel.Text) + 1);
      //Recalcula todos os atributos
      AtualizaAtributos(0,0,0,0,nil);
    end;
end;

//botão para diminuir o level
procedure TFrmPrincipal.BtnLevelLeftClick(Sender: TObject);
begin
  if StrToInt(EdtLevel.Text)> 1 then
    begin
      //Decrementa em um nível
      EdtLevel.Text := IntToStr( StrToInt(EdtLevel.Text) - 1);
      //Recalcula todos os atributos
      AtualizaAtributos(0,0,0,0,nil);
    end;
end;

//converte primeira letra em maiúscula
procedure TFrmPrincipal.CmbPokesKeyPress(Sender: TObject; var Key: Char);
begin
  if CmbPokes.SelStart = 0 then
    Key := AnsiUpperCase(Key)[1]
  else
    Key := AnsiLowerCase(Key)[1];
end;

//ao mudar a nature
procedure TFrmPrincipal.CmBNatureChange(Sender: TObject);
begin
  //Atualiza todos os atributos
  AtualizaAtributos(0,0,0,0,nil);
end;

//ao desenhar as células do string grid
procedure TFrmPrincipal.StringGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
Var
  jAux : Integer;
begin
  //se não tiver pelo menos um golpe
  if (sListaGolpe0.Count = 0) then
    exit
  else
    begin
      jAux := -1;
      case ACol of
        0: //
          begin
            if StrToInt(StringGrid.Cells[ACol,ARow]) < 0 then
              //mostra Checado
              ImageList.Draw(StringGrid.Canvas,Rect.Left,Rect.Top,1,True)
            else
              //mostra Não Checado
              ImageList.Draw(StringGrid.Canvas,Rect.Left,Rect.Top,0,True);
            //sai pq não precisa usar a função CarregaImg
            exit;
          end;
        1: //se for na coluna 1, é o tipo.
          jAux := StrToInt(sListaGolpe0.Strings[aRow]);
        2: //se for na colula 2, é a categoria
          jAux := StrToInt(sListaGolpe1.Strings[aRow])+20;
      end;
      //se jAux tá nullo cai fora
      if (jAux > -1) then
        begin
          //carrega a imagem
          CarregaIMG(ImgAux,3,jAux);
          //desenha
          StringGrid.Canvas.Draw(Rect.Left,Rect.Top,ImgAux.Picture.Graphic);
        end;  
  end;
end;

//procedimento para o carregamento dos itens numa combo
procedure TFrmPrincipal.RestauraItens;
begin
  seek(ArqItens,0);
  While not eof(ArqItens) do
  begin
    read(ArqItens,RegItens);
    //adiciona no ComboBox
    CmBItens.Items.Add(RegItens.nm_item);
    //adiciona na StringList
    sListaItens.Add(RegItens.ds_item);
  end;
  //seleciono a primeira posição
  CmBItens.ItemIndex := 0;
end;

//limpeza das tags dos golpes
procedure TFrmPrincipal.limpaEditGolpes;
var
  i : Integer;
begin
  //tag dos golpes selecionados
  for i := 0 to 3 do
  begin
    vEditGolpes[i].Tag := 0;
    vEditGolpes[i].Text := '';
  end;
  //tag de HP
  CmBTipoHP.Tag := 0;
end;

procedure TFrmPrincipal.RestauraPokeGolpes(seq: Integer);
Var
  iAux, jAux : Integer;
begin
  //limpar listas auxiliares
  sListaGolpe0.Clear;
  sListaGolpe1.Clear;
  sListaGolpe2.Clear;
  sListaGolpe3.Clear;
  sListaGolpe4.Clear;
  sListaGolpe5.Clear;
  sListaGolpe6.Clear;
  sListaGolpe7.Clear;
  sListaGolpe8.Clear;
  //limpa edits dos golpes
  limpaEditGolpes;
  //procurar os golpes do poké
  seek(ArqPokeGolpes,0);
  While not eof(ArqPokeGolpes) do
  begin
    read(ArqPokeGolpes,RegPokeGolpes);
    if (seq+1) = RegPokeGolpes.CodPkmn then
      begin
        iAux := RegPokeGolpes.CodAtk;
        seek(ArqGolpes,iAux);
        read(ArqGolpes,RegGolpes);
        sListaGolpe8.Add(IntToStr(iAux));
        sListaGolpe0.Add(IntToStr(RegGolpes.cd_tipo));
        sListaGolpe1.Add(IntToStr(RegGolpes.cd_categ));
        sListaGolpe2.Add(RegGolpes.nm_golpe);
        //se poder = 0, então escreve = traço '-'
        if RegGolpes.qt_poder > 0 then
          sListaGolpe3.Add(IntToStr(RegGolpes.qt_poder))
        else
          sListaGolpe3.Add('-');
        //se precisão = 0, então escreve = traço '-'
        If RegGolpes.qt_precisao > 0 then
          sListaGolpe4.Add(IntToStr(RegGolpes.qt_precisao))
        else
          sListaGolpe4.Add('-');
        sListaGolpe5.Add(IntToStr(RegGolpes.qt_pp));
        sListaGolpe6.Add(RegPokeGolpes.DesPor);
        sListaGolpe7.Add(RegGolpes.ds_golpe);
      end;
  end;
  //ajustando a quantidade de linhas do string grid
  StringGrid.RowCount := sListaGolpe0.Count;

  //se ele não tenha nenhuma linha, cai fora
  if sListaGolpe0.Count = 0 then
    Exit
  else
  begin
    //senão, para cada linha da StringList, ele adiciona os valores nas colunas.
    for jAux := 0 to (sListaGolpe0.Count - 1) do
    begin
      //seq
      StringGrid.Cells[0,jAux] := sListaGolpe8.Strings[jAux];
      //tipo
      StringGrid.Cells[1,jAux] := sListaGolpe0.Strings[jAux];
      //categoria
      StringGrid.Cells[2,jAux] := sListaGolpe1.Strings[jAux];
      //nome
      StringGrid.Cells[3,jAux] := sListaGolpe2.Strings[jAux];
      //poder
      StringGrid.Cells[4,jAux] := sListaGolpe3.Strings[jAux];
      //precisão
      StringGrid.Cells[5,jAux] := sListaGolpe4.Strings[jAux];
      //pp
      StringGrid.Cells[6,jAux] := sListaGolpe5.Strings[jAux];
      //aprende por
      StringGrid.Cells[7,jAux] := sListaGolpe6.Strings[jAux];
    end;
  end;
end;

//função para retornar um edit disponível para receber o golpe selecionado
//ou retorna o primeiro edit não selecionado, ou retorna o ultimo dos edits
function TFrmPrincipal.retEditGolpeDisp: TEdit;
var
  i : Integer;
  editAux : TEdit;
begin
  for i := 0 to 3 do
  begin
    editAux := vEditGolpes[i];
    if (editAux.Tag=0) then
      break;
  end;
  Result := editAux;
end;

//procedimento que seleciona ou des-seleciona um golpe
procedure TFrmPrincipal.controlaGolpes(duploClick : Boolean);
var
  i : Integer;
  editAux : TEdit;
  indAchou : Boolean;
begin
  //mostra mensagem na status bar
  mostraMsgBarraStatus(0,sListaGolpe7.Strings[StringGrid.Row]);
  //verifica se foi chamado pelo click
  if(not duploClick) then
  begin
    //clique simples, só continua se foi na celula 0
    if(StringGrid.Col <> 0) then
      exit
    else
      //seleciona outra coluna, senão dá bug a usar o scroll do mouse
      StringGrid.Col := 1;
  end;
  //se estiver des-selecionando, vai varrer todos os edits
  //e a partir do edit alterado, todos irão receber o valor que estava
  //no edit posterior
  if(StrToInt(StringGrid.Cells[0,StringGrid.Row])<0)then
  begin
    //variável para controlar quando achar
    indAchou := False;
    for i := 0 to 3 do
    begin
      //se ainda não achou o edit a alterar
      if(not indAchou)then
      begin
      	//se valor no edit corresponde a row, então des-seleciona
        if(Trunc((vEditGolpes[i].Tag-1)/1000) = StringGrid.Row) then
        begin
          indAchou := True;
          //reinicia valores do edit atual
          vEditGolpes[i].Tag := 0;
          vEditGolpes[i].Text := '';
          //des-seleciona coluna 0
          StringGrid.Cells[0,StringGrid.Row] := IntToStr(StrToInt(StringGrid.Cells[0,StringGrid.Row])*-1);
        end;
      end
      else
      //já encontrou o edit
      begin
        //Edit Anterior recebe o valor do atual
        vEditGolpes[i-1].Tag := vEditGolpes[i].Tag;
        vEditGolpes[i-1].Text := vEditGolpes[i].Text;
        //reinicia valores do edit atual
        vEditGolpes[i].Tag := 0;
        vEditGolpes[i].Text := '';
      end;
    end;
  end
  else
  begin
    //processo normal
    StringGrid.Cells[0,StringGrid.Row] := IntToStr(StrToInt(StringGrid.Cells[0,StringGrid.Row]) * -1);
    //retorna o Edit que receberá o golpe selecionado
    editAux := retEditGolpeDisp;
    //verifica se a tag está diferente de zero, caso sim tem de des-selecionar o golpe antigo
    if(editAux.Tag<>0)then
      StringGrid.Cells[0,(Trunc((editAux.Tag-1)/1000))] := IntToStr(StrToInt(StringGrid.Cells[0,(Trunc((editAux.Tag-1)/1000))])*-1);
    //A tag recebe na parte de milhar a row do string grid
    //e na parte da centena o código do golpe
    editAux.Tag := StrToInt(StringGrid.Cells[0,StringGrid.Row])+(StringGrid.Row+1)*1000;
    //atribui o texto
    editAux.Text := StringGrid.Cells[3,StringGrid.Row];
  end;
end;

//selecionar o golpe caso esteja na coluna 0
procedure TFrmPrincipal.StringGridClick(Sender: TObject);
begin
  //somente roda se tag estiver 0
  if(StringGrid.Tag=0)then
    controlaGolpes(False);
end;

//selecionar o golpe
procedure TFrmPrincipal.StringGridDblClick(Sender: TObject);
begin
  controlaGolpes(True);
end;

//ao digitar uma letra, procura na primeira letra do golpe
procedure TFrmPrincipal.StringGridKeyPress(Sender: TObject; var Key: Char);
  var
    iRow, iAux : Integer;
    achou : Boolean;
begin
  //somente continua se foi digitado uma letra
  If(UpCase(Key) in ['A'..'Z']) then
  begin
    //inicializa achou
    achou := False;
    //guarda o valor antes de procurar
    iRow := StringGrid.Row;
    //varre o bloco e procurar pela chave passada
    for iAux := iRow+1 to (StringGrid.RowCount-1) do
    begin
      //se chave digitado igual a primeira letra, para por aqui
      if(Copy(StringGrid.Cells[3,iAux],0,1)=UpCase(Key))then
      begin
        //indica que achou
        achou := True;
        //vai pra essa linha
        StringGrid.Row := iAux;
        //quebra o for
        break;
      end;
    end;
    //se não achou e o valor digitado era posterior ao golpe mostrado na tela
    //busca novamente, só que do início até a linha que estava antes
    if(UpCase(Key)>Copy(StringGrid.Cells[3,iAux],0,1))then
    begin
      //varre o bloco e procurar pela chave passada
      for iAux := 0 to iRow do
      begin
        //se chave digitado igual a primeira letra, para por aqui
        if(Copy(StringGrid.Cells[3,iAux],0,1)=UpCase(Key))then
        begin
          //indica que achou
          achou := True;
          //vai pra essa linha
          StringGrid.Row := iAux;
          //quebra o for
          break;
        end;
      end; 
    end;
    //se mesmo assim não achou volta
    if(not achou)then
      StringGrid.Row := iRow;
  end;    
end;

//procedimento para buscar no string grid o golpe do edit clicado
procedure TFrmPrincipal.GolpeClick(edtAtual: Tedit);
begin
  //se tag tá 0, então não tem nada no edit
  if edtAtual.Tag = 0 then
    exit
  else
  begin
    //seta focus no strig grid
    StringGrid.SetFocus;
    //pegar apenas a parte do milhar que é o row no string grid
    StringGrid.Row := Trunc((edtAtual.Tag-1)/1000);
    StringGrid.Col := 3;
  end;
end;

//selecionar golpe do edir no string grid
procedure TFrmPrincipal.EdtMove1Click(Sender: TObject);
begin
  GolpeClick(EdtMove1);
end;

//selecionar golpe do edir no string grid
procedure TFrmPrincipal.EdtMove2Click(Sender: TObject);
begin
  GolpeClick(EdtMove2);
end;

//selecionar golpe do edir no string grid
procedure TFrmPrincipal.EdtMove3Click(Sender: TObject);
begin
  GolpeClick(EdtMove3);
end;

//selecionar golpe do edir no string grid
procedure TFrmPrincipal.EdtMove4Click(Sender: TObject);
begin
  GolpeClick(EdtMove4);
end;

//ao mudar o iv de hp
procedure TFrmPrincipal.CmbIVHPChange(Sender: TObject);
begin
  //Atualiza somente este atributo
  AtualizaAtributos(1,StrToInt(EdtBaseHP.Text),StrToInt(CmbIVHP.Text),TBEvHP.Position,LabResultHP);
  //atualiza HP(Hidden Power)
  controlaHP(1);
end;

//ao mudar o iv de atk
procedure TFrmPrincipal.CmbIVATKChange(Sender: TObject);
begin
  //Atualiza somente este atributo
  AtualizaAtributos(2,StrToInt(EdtBaseATK.Text),StrToInt(CmbIVATK.Text),TBEvATK.Position,LabResultATK);
  //atualiza HP(Hidden Power)
  controlaHP(1);
end;

//ao mudar o iv de def
procedure TFrmPrincipal.CmbIVDEFChange(Sender: TObject);
begin
  //Atualiza somente este atributo
  AtualizaAtributos(3,StrToInt(EdtBaseDEF.Text),StrToInt(CmbIVDEF.Text),TBEvDEF.Position,LabResultDEF);
  //atualiza HP(Hidden Power)
  controlaHP(1);
end;

//ao mudar o iv de sat
procedure TFrmPrincipal.CmbIVSATChange(Sender: TObject);
begin
  //Atualiza somente este atributo
  AtualizaAtributos(4,StrToInt(EdtBaseSAT.Text),StrToInt(CmbIVSAT.Text),TBEvSAT.Position,LabResultSAT);
  //atualiza HP(Hidden Power)
  controlaHP(1);
end;

//ao mudar o iv de sdf
procedure TFrmPrincipal.CmbIVSDFChange(Sender: TObject);
begin
  //Atualiza somente este atributo
  AtualizaAtributos(5,StrToInt(EdtBaseSDF.Text),StrToInt(CmbIVSDF.Text),TBEvSDF.Position,LabResultSDF);
  //atualiza HP(Hidden Power)
  controlaHP(1);
end;

//ao mudar o iv de spe
procedure TFrmPrincipal.CmbIVSPEChange(Sender: TObject);
begin
  //Atualiza somente este atributo
  AtualizaAtributos(6,StrToInt(EdtBaseSPE.Text),StrToInt(CmbIVSPE.Text),TBEvSPE.Position,LabResultSPE);
  //atualiza HP(Hidden Power)
  controlaHP(1);
end;

//ao mudar os evs de hp
procedure TFrmPrincipal.TBEvHpChange(Sender: TObject);
begin
  //chama rotina para controle dos evs
  controlaEVs(TBEvHp);
  //Recalcula somente este atributo
  AtualizaAtributos(1,StrToInt(EdtBaseHP.Text),StrToInt(CmbIVHP.Text),TBEvHP.Position,LabResultHP);
end;

//ao mudar os evs de atk
procedure TFrmPrincipal.TBEvAtkChange(Sender: TObject);
begin
  //chama rotina para controle dos evs
  controlaEVs(TBEvAtk);
  //Recalcula somente este atributo
  AtualizaAtributos(2,StrToInt(EdtBaseATK.Text),StrToInt(CmbIVATK.Text),TBEvATK.Position,LabResultATK);
end;

//ao mudar os evs de def
procedure TFrmPrincipal.TBEvDefChange(Sender: TObject);
begin
  //chama rotina para controle dos evs
  controlaEVs(TBEvDef);
  //Recalcula somente este atributo
  AtualizaAtributos(3,StrToInt(EdtBaseDEF.Text),StrToInt(CmbIVDEF.Text),TBEvDEF.Position,LabResultDEF);
end;

//ao mudar os evs de sat
procedure TFrmPrincipal.TBEvSatChange(Sender: TObject);
begin
  //chama rotina para controle dos evs
  controlaEVs(TBEvSat);
  //Recalcula somente este atributo
  AtualizaAtributos(4,StrToInt(EdtBaseSAT.Text),StrToInt(CmbIVSAT.Text),TBEvSAT.Position,LabResultSAT);
end;

//ao mudar os evs de sdf
procedure TFrmPrincipal.TBEvSdfChange(Sender: TObject);
begin
  //chama rotina para controle dos evs
  controlaEVs(TBEvSdf);
  //Recalcula somente este atributo
  AtualizaAtributos(5,StrToInt(EdtBaseSDF.Text),StrToInt(CmbIVSDF.Text),TBEvSDF.Position,LabResultSDF);
end;

//ao mudar os evs de spe
procedure TFrmPrincipal.TBEvSpeChange(Sender: TObject);
begin
  //chama rotina para controle dos evs
  controlaEVs(TBEvSpe);
  //Recalcula somente este atributo
  AtualizaAtributos(6,StrToInt(EdtBaseSPE.Text),StrToInt(CmbIVSPE.Text),TBEvSPE.Position,LabResultSPE);
end;

//ao mudar o tipo do HP(Hidden Power)
procedure TFrmPrincipal.CmBTipoHPChange(Sender: TObject);
begin
  //chama rotina que controla HP
  controlaHP(0)
end;

//função para retornar o poder do HP
function TFrmPrincipal.calcPoderHP(valIVHP, valIVATK, valIVDEF, valIVSAT, valIVSDF, valIVSPE : Integer): Integer;
var
  iAux : Integer;
begin
  iAux := 0;
  if (valIVHP mod 4 = 2) or (valIVHP mod 4 = 3) then
    iAux := 1;
  if (valIVATK mod 4 = 2) or (valIVATK mod 4 = 3) then
    iAux := iAux + 2;
  if (valIVDEF mod 4 = 2) or (valIVDEF mod 4 = 3) then
    iAux := iAux + 4;
  if (valIVSPE mod 4 = 2) or (valIVSPE mod 4 = 3) then
    iAux := iAux + 8;
  if (valIVSAT mod 4 = 2) or (valIVSAT mod 4 = 3) then
    iAux := iAux + 16;
  if (valIVSDF mod 4 = 2) or (valIVSDF mod 4 = 3) then
    iAux := iAux + 32;
  Result := Trunc(30 + ( (40 * iAux) / 63));
end;

//função para retornar o tipo do HP
function TFrmPrincipal.calcTipoHP(valIVHP, valIVATK, valIVDEF, valIVSAT, valIVSDF, valIVSPE : Integer): Integer;
var
  iAux : Integer;
begin
  iAux := 0;
  if (valIVHP div 2) <> (valIVHP / 2) then
    iAux := 1;
  if (valIVATK div 2) <> (valIVATK / 2) then
    iAux := iAux + 2;
  if (valIVDEF div 2) <> (valIVDEF / 2) then
    iAux := iAux + 4;
  if (valIVSPE div 2) <> (valIVSPE / 2) then
    iAux := iAux + 8;
  if (valIVSAT div 2) <> (valIVSAT / 2) then
    iAux := iAux + 16;
  if (valIVSDF div 2) <> (valIVSDF / 2) then
    iAux := iAux + 32;
  iAux := Trunc((15 * iAux)/63);

  case iAux of
    0 : iAux := 5;
    1 : iAux := 8;
    2 : iAux := 6;
    3 : iAux := 7;
    4 : iAux := 11;
    5 : iAux := 10;
    6 : iAux := 12;
    7 : iAux := 15;
    8 : iAux := 0;
    9 : iAux := 1;
    10 : iAux := 3;
    11 : iAux := 2;
    12 : iAux := 9;
    13 : iAux := 4;
    14 : iAux := 13;
    15 : iAux := 14;
  end;
  
  Result := iAux;

end;

//procedimento que efetua todo o controle do HP(Hidden Power)
procedure TFrmPrincipal.controlaHP(tipExec : Integer);
begin
  //de acordo com o tipo da chamada
  if(tipExec = 0)then //mudou o tipo no combo de hps
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
    //atualiza todos atributos
    AtualizaAtributos(0,0,0,0,nil);
    //seta poder default(máximo) de HP
    EdtPowerHP.Text := '70';
  end
  else //mudou algum iv
  begin
    //ItemIndex recebe o tipo do HP
    CmBTipoHP.ItemIndex := calcTipoHP(StrToInt(CmBIVHP.Text),StrToInt(CmBIVATK.Text),StrToInt(CmBIVDEF.Text),StrToInt(CmBIVSAT.Text),StrToInt(CmBIVSDF.Text),StrToInt(CmBIVSPE.Text));
    //EditPoder recebe o cálculo do poder
    EdtPowerHP.Text := IntToStr(calcPoderHP(StrToInt(CmBIVHP.Text),StrToInt(CmBIVATK.Text),StrToInt(CmBIVDEF.Text),StrToInt(CmBIVSAT.Text),StrToInt(CmBIVSDF.Text),StrToInt(CmBIVSPE.Text)));
  end;
end;

function TFrmPrincipal.LPad(value:String; tamanho:Integer; caractere:Char): string;
var
  i : integer;
begin
  Result := value;
  if(Length(value) > tamanho)then
    exit;
  for i := 1 to (tamanho - Length(value)) do
    Result := caractere + Result;
end;

//Monta na barra de status determinada mensagem
procedure TFrmPrincipal.mostraMsgBarraStatus(ind: Integer; msg: String);
begin
  BarraStatus.Panels[ind].Text := msg;
end;

procedure TFrmPrincipal.RadTrait1Enter(Sender: TObject);
begin
  mostraMsgBarraStatus(0,RestauraTrait(1,RadTrait1.Tag));
end;

procedure TFrmPrincipal.RadTrait2Enter(Sender: TObject);
begin
  mostraMsgBarraStatus(0,RestauraTrait(1,RadTrait2.Tag));
end;

procedure TFrmPrincipal.CmBItensChange(Sender: TObject);
begin
  //mostra na status bar a descrição do item
  mostraMsgBarraStatus(0,sListaItens[CmBItens.ItemIndex]);
end;

//Procedimento para carregar em uma box os pokés da mesma
procedure TFrmPrincipal.carregaBox(indBox: Integer);
var
  i,x,y,qtd,lin,seq,qtdAux : Integer;
  img : TImage;
  strHint : String;
begin
  //limpa controle de seleção com shape
  ShapeContorno.Visible := False;
  ShapeContorno.Tag := -1;
  //itera sobra o vetor de imagens e libera elas da memória
  for i := 0 to 49 do
  begin
    //se tá nullo cai fora
    if(vImgBoxes[i] = Nil)then
      break;
    //liberar da memória
    vImgBoxes[i].Free;
    vImgBoxes[i] := Nil;
  end;
  //posicionamento x/y para desenho das imagens
  x := -15;
  y := 25;
  //outros controles
  qtd := 0;//qtd lida na linha
  lin := 1;//qtd linhas
  seq := 0;//seq do registro no arquivo
  //posiciona no header do arquivo
  seek(ArqBoxes,seq);
  //enquanto não chegar ao fim do arquivo
  while not eof(ArqBoxes) do
  begin
    //le o registro atual
    Read(ArqBoxes, RegBoxes);
    if RegBoxes.Box = indBox then
    begin
      //acrescenta quantidade lida
      inc(qtd);
      //incrementar x
      x := x + 32;
      //se quantidade já passou da qtd máxima por linha(3)
      if(qtd>9)then
      begin
        //incrementa linha
        inc(lin);
        //reiniciar quantidade
        qtd := 1;
        //reiniciar x e y
        x := 15;
        y := y + 32;
      end;
      //criar um TImage e colocá-lo na tab
      img := TImage.Create(nil);
      img.Visible := False;
      img.Parent  := TabBoxes;
      img.Left := x;
      img.Top  := y;
      img.Name := 'imgBox' + IntToStr(seq);
      img.Transparent := True;
      img.Visible := True;
      img.OnDragOver := DragOver;
      img.OnDragDrop := DragDrop;
      img.OnMouseDown := MouseDown;
      img.OnDblClick := onDblClick;
      img.OnClick := onClick;
      img.Tag := seq;
      //carrega a imagem pra dentro do TImage
      CarregaIMG(img,2,RegBoxes.CodPkmn+1);
      //montar o hint da imagem
      strHint := RegBoxes.Nick + '@' + RegBoxes.Item + #13#10
              +  CmBNature.Items.Strings[RegBoxes.IdxNature] + ' nature' + #13#10
              +  'EVs:';
      //evs, usa variável qtd_aux para por uma quebra a mostrar 3 evs
      qtdAux := 0;
      if(RegBoxes.ValEVHP>0)then
      begin
        //incrementa quantidade
        inc(qtdAux);
        //inclui evs de hp
        strHint := strHint + 'HP:'+IntToStr(RegBoxes.ValEVHP);
      end;
      if(RegBoxes.ValEVATK>0)then
      begin
        //incrementa quantidade
        inc(qtdAux);
        //inclui evs de atk
        strHint := strHint + ' ATK:'+IntToStr(RegBoxes.ValEVATK);
      end;
      if(RegBoxes.ValEVDEF>0)then
      begin
        //incrementa quantidade
        inc(qtdAux);
        //inclui evs de def
        strHint := strHint + ' DEF:'+IntToStr(RegBoxes.ValEVDEF);
      end;
      if(RegBoxes.ValEVSAT>0)then
      begin
        //incrementa quantidade
        inc(qtdAux);
        //a partir daki pode haver mais de 3 evs mostrados
        if(qtdAux > 3)then
        begin
          //zerar para não usar mais a quebra
          qtdAux := 0;
          //põe a quebra
          strHint := strHint + #13#10 + '    ';
        end;
        //inclui evs de sat
        strHint := strHint + ' SAT:'+IntToStr(RegBoxes.ValEVSAT);
      end;
      if(RegBoxes.ValEVSDF>0)then
      begin
        //incrementa quantidade
        inc(qtdAux);
        //a partir daki pode haver mais de 3 evs mostrados
        if(qtdAux > 3)then
        begin
          //põe a quebra
          strHint := strHint + #13#10 + '    ';
        end;
        //inclui evs de sdf
        strHint := strHint + ' SDF:'+IntToStr(RegBoxes.ValEVSDF);
      end;
      if(RegBoxes.ValEVSPE>0)then
      begin
        //incrementa quantidade
        inc(qtdAux);
        //a partir daki pode haver mais de 3 evs mostrados
        if(qtdAux > 3)then
        begin
          //põe a quebra
          strHint := strHint + #13#10 + '    ';
        end;
        //inclui evs de spe
        strHint := strHint + ' SPE:'+IntToStr(RegBoxes.ValEVSPE);
      end;
      //moves
      strHint := strHint + #13#10
              + '-' + RegBoxes.Move1 + #13#10
              + '-' + RegBoxes.Move2 + #13#10
              + '-' + RegBoxes.Move3 + #13#10
              + '-' + RegBoxes.Move4;
      //setando o hint da image
      img.Hint := strHint;
      img.ShowHint := True;
      //guarda a imagem num vetor, para depois destruí-la
      vImgBoxes[(lin*9)-(9-qtd)-1] := img;
    end;
    //acrescenta seq
    inc(seq);
  end;
end;

//restaura um poké salvo nas boxes
procedure TFrmPrincipal.restauraPokeDaBox(idxRegis: Integer);
var
  i : Integer;
begin
  //setar o ponteiro no arquivo
  Seek(ArqBoxes,idxRegis);
  //le o registro
  Read(ArqBoxes,RegBoxes);
  with RegBoxes do
  begin
    //seleciona o bicho respeitando a ordenação
    //que o Combo está montado
    if OptList = 1 then
      //numérica
      CmbPokes.ItemIndex := codPkmn-1
    else
    begin
      //deve procurar nos vetores
      if OptList = 0 then
      begin
        //alfabética
        for i := 0 to 499 do
        begin
          if vetAlfa[i] = codPkmn+1 then
          begin
            //achou
            CmbPokes.ItemIndex := i;
            break;
          end;
        end;
      end
      else
      begin
        //evolutiva
        for i := 0 to 499 do
        begin
          if vetEvol[i] = codPkmn+1 then
          begin
            //achou
            CmbPokes.ItemIndex := i;
            break;
          end;
        end;
      end;
    end;
    //simula a seleção
    CmbPokesChange(Self);
    //outros campos para a tela
    EdtNick.Text := Nick;
    ImgPkmn.Tag := TagImg;
    CmbIVHP.ItemIndex := IdxIVHP;
    CmbIVATK.ItemIndex := IdxIVATK;
    CmbIVDEF.ItemIndex := IdxIVDEF;
    CmbIVSAT.ItemIndex := IdxIVSAT;
    CmbIVSDF.ItemIndex := IdxIVSDF;
    CmbIVSPE.ItemIndex := IdxIVSPE;
    CmbIVSPEChange(Self); //Ajustes do HP
    TBEvHp.Position := ValEVHP;
    TBEvATK.Position := ValEVATK;
    TBEvDEF.Position := ValEVDEF;
    TBEvSAT.Position := ValEVSAT;
    TBEvSDF.Position := ValEVSDF;
    TBEvSPE.Position := ValEVSPE;
    controlaEVs(TBEvSpe); //apenas chama o controle
    CmBItens.ItemIndex := idxItem;
    CmBNature.ItemIndex := IdxNature;
    if Trait = 1 then
      RadTrait1.Checked := True
    else
      RadTrait2.Checked := True;

    if Gender = 1 then
      RadMale.Checked := True
    else
      if Gender = 2 then
        RadFemale.Checked := True
      else
        RadMale.Checked := False;
    //seleção dos golpes, faz o primeiro por ultimo
    //para ficar selecionado no mesmo
    golpeDaBox(tagGolpe1,Move1);
    golpeDaBox(tagGolpe2,Move2);
    golpeDaBox(tagGolpe3,Move3);
    golpeDaBox(tagGolpe4,Move4);
    //mostra na barra de status que recuperou
    mostraMsgBarraStatus(0,'Pokémon recuperado com sucesso!');
  end;
end;

//através da Tag gravada na box, seleciona no StringGrid
procedure TFrmPrincipal.golpeDaBox(valTagGolpe: Integer; desGolpe: String);
var
  indAchou : Boolean;
  i : Integer;
begin
  //formato novo
  if(valTagGolpe > 1000)then
  begin
    //A tag tem na parte de milhar a row do string grid
    //e na parte da centena o código do golpe
    if(  StrToInt(StringGrid.Cells[0,Trunc((valTagGolpe-1)/1000)]) = (valTagGolpe - Trunc((valTagGolpe-1)/1000)) )then
    begin
      //seta uma tag <> 0 pra não disparar os eventros do StringGrid
      StringGrid.Tag := 1;
      //achou
      StringGrid.Row := Trunc((valTagGolpe-1)/1000);
      //efetua seleção
      controlaGolpes(True);
      //indica que achou
      indAchou := True;
      //volta ao valor default
      StringGrid.Tag := 0;
    end
    else //Não achou
      indAchou := False;
  end;
  //se var indAchou tá false, vai varrer o StringGrid e procurar
  if(not indAChou)then
  begin
    //varredura
    for i := 0 to StringGrid.RowCount-1 do
    begin
      //se descrição for igual
      if(StringGrid.Cells[3,i]=desGolpe)then
      begin
        //seta uma tag <> 0 pra não disparar os eventros do StringGrid
        StringGrid.Tag := 1;
        //achou
        StringGrid.Row := i;
        //efetua seleção
        controlaGolpes(True);
        //volta ao valor default
        StringGrid.Tag := 0;
        //sai do loop
        break;
      end;
    end;
  end;
end;

//Muda a box selecionada
procedure TFrmPrincipal.TabBoxesChange(Sender: TObject);
begin
  carregaBox(TabBoxes.TabIndex+1);
end;

//Dropando se for uma imagem
procedure TFrmPrincipal.DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  //dropping an Image?
  if Source is TImage then
  begin
    //Nela mesmo
    if Sender is TImage then
    begin
      TImage(Source).Left := TImage(Source).Left + x - TheSpot.X;
      TImage(Source).Top := TImage(Source).Top + y  - TheSpot.Y;
    end
    else
    //ou em algum lugar do seu pai
    begin
      TImage(Source).Left := X - TheSpot.X;
      //não pintar fora das margens
      if(TheSpot.Y<25)then
        TImage(Source).Top := 25
      else
        TImage(Source).Top := Y - TheSpot.Y;
    end;
    //atualiza o shape
    TImage(Source).OnClick(Source);
  end;
end;

//Deixa efetuar drag drop se for uma imagem
procedure TFrmPrincipal.DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TImage);
end;

//Mousedown das imagens das boxes
procedure TFrmPrincipal.MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TheSpot.X := X;
  TheSpot.Y := Y;
  TImage(Sender).BeginDrag(True);
end;

//selecionar a image
procedure TFrmPrincipal.onClick(Sender: TObject);
begin
  //pintar o shape de seleção na box nas coordenadas da imagem chamadora
  ShapeContorno.Visible := True;
  ShapeContorno.Left := TImage(Sender).Left;
  ShapeContorno.Top  := TImage(Sender).Top+1;
  ShapeContorno.Tag  := TImage(Sender).Tag;
  //montar hint na barra de status
  mostraMsgBarraStatus(0,'Clique no botão ou dê um Duplo-Clique para restaurar o Poké');
end;

//duplo clique em um bicho na box
procedure TFrmPrincipal.onDblClick(Sender: TObject);
begin
  //restaurar o mesmo
  restauraPokeDaBox(TImage(Sender).Tag);
end;
//procedimento para montagem dos vetores para o deXpara cfme a opção
//de ordenação selecionada pelo usuário
procedure TFrmPrincipal.montaVetores;
begin
  //carrega vetores dos edits de golpes
  vEditGolpes[0] := EdtMove1;
  vEditGolpes[1] := EdtMove2;
  vEditGolpes[2] := EdtMove3;
  vEditGolpes[3] := EdtMove4;
  //barras de evs
  vEVTracks[0] := TBEvHp;
  vEVTracks[1] := TBEvAtk;
  vEVTracks[2] := TBEvDef;
  vEVTracks[3] := TBEvSat;
  vEVTracks[4] := TBEvSdf;
  vEVTracks[5] := TBEvSpe;
  //alfabético
  vetAlfa[0] := 467;
  vetAlfa[1] := 63;
  vetAlfa[2] := 359;
  vetAlfa[3] := 142;
  vetAlfa[4] := 306;
  vetAlfa[5] := 190;
  vetAlfa[6] := 65;
  vetAlfa[7] := 334;
  vetAlfa[8] := 431;
  vetAlfa[9] := 181;
  vetAlfa[10] := 347;
  vetAlfa[11] := 24;
  vetAlfa[12] := 59;
  vetAlfa[13] := 500;
  vetAlfa[14] := 168;
  vetAlfa[15] := 348;
  vetAlfa[16] := 304;
  vetAlfa[17] := 144;
  vetAlfa[18] := 489;
  vetAlfa[19] := 184;
  vetAlfa[20] := 298;
  vetAlfa[21] := 371;
  vetAlfa[22] := 343;
  vetAlfa[23] := 354;
  vetAlfa[24] := 339;
  vetAlfa[25] := 414;
  vetAlfa[26] := 153;
  vetAlfa[27] := 267;
  vetAlfa[28] := 15;
  vetAlfa[29] := 374;
  vetAlfa[30] := 182;
  vetAlfa[31] := 69;
  vetAlfa[32] := 403;
  vetAlfa[33] := 402;
  vetAlfa[34] := 9;
  vetAlfa[35] := 257;
  vetAlfa[36] := 242;
  vetAlfa[37] := 445;
  vetAlfa[38] := 286;
  vetAlfa[39] := 444;
  vetAlfa[40] := 443;
  vetAlfa[41] := 409;
  vetAlfa[42] := 425;
  vetAlfa[43] := 1;
  vetAlfa[44] := 434;
  vetAlfa[45] := 415;
  vetAlfa[46] := 417;
  vetAlfa[47] := 416;
  vetAlfa[48] := 12;
  vetAlfa[49] := 331;
  vetAlfa[50] := 332;
  vetAlfa[51] := 323;
  vetAlfa[52] := 462;
  vetAlfa[53] := 318;
  vetAlfa[54] := 268;
  vetAlfa[55] := 351;
  vetAlfa[56] := 10;
  vetAlfa[57] := 251;
  vetAlfa[58] := 113;
  vetAlfa[59] := 6;
  vetAlfa[60] := 4;
  vetAlfa[61] := 5;
  vetAlfa[62] := 448;
  vetAlfa[63] := 428;
  vetAlfa[64] := 427;
  vetAlfa[65] := 152;
  vetAlfa[66] := 393;
  vetAlfa[67] := 358;
  vetAlfa[68] := 170;
  vetAlfa[69] := 440;
  vetAlfa[70] := 366;
  vetAlfa[71] := 344;
  vetAlfa[72] := 36;
  vetAlfa[73] := 35;
  vetAlfa[74] := 173;
  vetAlfa[75] := 91;
  vetAlfa[76] := 422;
  vetAlfa[77] := 256;
  vetAlfa[78] := 341;
  vetAlfa[79] := 222;
  vetAlfa[80] := 346;
  vetAlfa[81] := 411;
  vetAlfa[82] := 342;
  vetAlfa[83] := 495;
  vetAlfa[84] := 460;
  vetAlfa[85] := 169;
  vetAlfa[86] := 159;
  vetAlfa[87] := 104;
  vetAlfa[88] := 155;
  vetAlfa[89] := 498;
  vetAlfa[90] := 301;
  vetAlfa[91] := 225;
  vetAlfa[92] := 389;
  vetAlfa[93] := 387;
  vetAlfa[94] := 388;
  vetAlfa[95] := 386;
  vetAlfa[96] := 87;
  vetAlfa[97] := 490;
  vetAlfa[98] := 50;
  vetAlfa[99] := 132;
  vetAlfa[100] := 85;
  vetAlfa[101] := 84;
  vetAlfa[102] := 232;
  vetAlfa[103] := 148;
  vetAlfa[104] := 149;
  vetAlfa[105] := 459;
  vetAlfa[106] := 147;
  vetAlfa[107] := 433;
  vetAlfa[108] := 432;
  vetAlfa[109] := 96;
  vetAlfa[110] := 51;
  vetAlfa[111] := 206;
  vetAlfa[112] := 356;
  vetAlfa[113] := 484;
  vetAlfa[114] := 355;
  vetAlfa[115] := 269;
  vetAlfa[116] := 133;
  vetAlfa[117] := 23;
  vetAlfa[118] := 125;
  vetAlfa[119] := 473;
  vetAlfa[120] := 309;
  vetAlfa[121] := 101;
  vetAlfa[122] := 239;
  vetAlfa[123] := 398;
  vetAlfa[124] := 244;
  vetAlfa[125] := 196;
  vetAlfa[126] := 102;
  vetAlfa[127] := 103;
  vetAlfa[128] := 295;
  vetAlfa[129] := 83;
  vetAlfa[130] := 22;
  vetAlfa[131] := 349;
  vetAlfa[132] := 160;
  vetAlfa[133] := 463;
  vetAlfa[134] := 180;
  vetAlfa[135] := 136;
  vetAlfa[136] := 426;
  vetAlfa[137] := 330;
  vetAlfa[138] := 205;
  vetAlfa[139] := 485;
  vetAlfa[140] := 162;
  vetAlfa[141] := 451;
  vetAlfa[142] := 482;
  vetAlfa[143] := 452;
  vetAlfa[144] := 282;
  vetAlfa[145] := 92;
  vetAlfa[146] := 430;
  vetAlfa[147] := 94;
  vetAlfa[148] := 74;
  vetAlfa[149] := 450;
  vetAlfa[150] := 203;
  vetAlfa[151] := 494;
  vetAlfa[152] := 478;
  vetAlfa[153] := 362;
  vetAlfa[154] := 438;
  vetAlfa[155] := 207;
  vetAlfa[156] := 479;
  vetAlfa[157] := 44;
  vetAlfa[158] := 42;
  vetAlfa[159] := 118;
  vetAlfa[160] := 55;
  vetAlfa[161] := 76;
  vetAlfa[162] := 368;
  vetAlfa[163] := 210;
  vetAlfa[164] := 75;
  vetAlfa[165] := 88;
  vetAlfa[166] := 391;
  vetAlfa[167] := 383;
  vetAlfa[168] := 253;
  vetAlfa[169] := 58;
  vetAlfa[170] := 326;
  vetAlfa[171] := 316;
  vetAlfa[172] := 130;
  vetAlfa[173] := 447;
  vetAlfa[174] := 297;
  vetAlfa[175] := 93;
  vetAlfa[176] := 492;
  vetAlfa[177] := 214;
  vetAlfa[178] := 456;
  vetAlfa[179] := 457;
  vetAlfa[180] := 107;
  vetAlfa[181] := 106;
  vetAlfa[182] := 237;
  vetAlfa[183] := 250;
  vetAlfa[184] := 437;
  vetAlfa[185] := 163;
  vetAlfa[186] := 187;
  vetAlfa[187] := 116;
  vetAlfa[188] := 229;
  vetAlfa[189] := 228;
  vetAlfa[190] := 367;
  vetAlfa[191] := 97;
  vetAlfa[192] := 174;
  vetAlfa[193] := 314;
  vetAlfa[194] := 395;
  vetAlfa[195] := 2;
  vetAlfa[196] := 39;
  vetAlfa[197] := 385;
  vetAlfa[198] := 135;
  vetAlfa[199] := 189;
  vetAlfa[200] := 124;
  vetAlfa[201] := 140;
  vetAlfa[202] := 141;
  vetAlfa[203] := 64;
  vetAlfa[204] := 14;
  vetAlfa[205] := 115;
  vetAlfa[206] := 352;
  vetAlfa[207] := 230;
  vetAlfa[208] := 99;
  vetAlfa[209] := 281;
  vetAlfa[210] := 109;
  vetAlfa[211] := 98;
  vetAlfa[212] := 404;
  vetAlfa[213] := 405;
  vetAlfa[214] := 382;
  vetAlfa[215] := 305;
  vetAlfa[216] := 171;
  vetAlfa[217] := 131;
  vetAlfa[218] := 246;
  vetAlfa[219] := 380;
  vetAlfa[220] := 381;
  vetAlfa[221] := 477;
  vetAlfa[222] := 166;
  vetAlfa[223] := 165;
  vetAlfa[224] := 470;
  vetAlfa[225] := 108;
  vetAlfa[226] := 345;
  vetAlfa[227] := 264;
  vetAlfa[228] := 271;
  vetAlfa[229] := 435;
  vetAlfa[230] := 270;
  vetAlfa[231] := 294;
  vetAlfa[232] := 455;
  vetAlfa[233] := 272;
  vetAlfa[234] := 249;
  vetAlfa[235] := 464;
  vetAlfa[236] := 337;
  vetAlfa[237] := 370;
  vetAlfa[238] := 407;
  vetAlfa[239] := 408;
  vetAlfa[240] := 68;
  vetAlfa[241] := 67;
  vetAlfa[242] := 66;
  vetAlfa[243] := 240;
  vetAlfa[244] := 219;
  vetAlfa[245] := 129;
  vetAlfa[246] := 126;
  vetAlfa[247] := 474;
  vetAlfa[248] := 81;
  vetAlfa[249] := 82;
  vetAlfa[250] := 469;
  vetAlfa[251] := 296;
  vetAlfa[252] := 480;
  vetAlfa[253] := 497;
  vetAlfa[254] := 310;
  vetAlfa[255] := 56;
  vetAlfa[256] := 226;
  vetAlfa[257] := 465;
  vetAlfa[258] := 179;
  vetAlfa[259] := 183;
  vetAlfa[260] := 105;
  vetAlfa[261] := 259;
  vetAlfa[262] := 284;
  vetAlfa[263] := 303;
  vetAlfa[264] := 308;
  vetAlfa[265] := 307;
  vetAlfa[266] := 154;
  vetAlfa[267] := 52;
  vetAlfa[268] := 488;
  vetAlfa[269] := 376;
  vetAlfa[270] := 375;
  vetAlfa[271] := 11;
  vetAlfa[272] := 151;
  vetAlfa[273] := 150;
  vetAlfa[274] := 262;
  vetAlfa[275] := 350;
  vetAlfa[276] := 241;
  vetAlfa[277] := 446;
  vetAlfa[278] := 312;
  vetAlfa[279] := 200;
  vetAlfa[280] := 436;
  vetAlfa[281] := 146;
  vetAlfa[282] := 394;
  vetAlfa[283] := 421;
  vetAlfa[284] := 122;
  vetAlfa[285] := 258;
  vetAlfa[286] := 89;
  vetAlfa[287] := 453;
  vetAlfa[288] := 198;
  vetAlfa[289] := 177;
  vetAlfa[290] := 34;
  vetAlfa[291] := 31;
  vetAlfa[292] := 29;
  vetAlfa[293] := 32;
  vetAlfa[294] := 30;
  vetAlfa[295] := 33;
  vetAlfa[296] := 290;
  vetAlfa[297] := 38;
  vetAlfa[298] := 291;
  vetAlfa[299] := 164;
  vetAlfa[300] := 299;
  vetAlfa[301] := 322;
  vetAlfa[302] := 274;
  vetAlfa[303] := 224;
  vetAlfa[304] := 43;
  vetAlfa[305] := 138;
  vetAlfa[306] := 139;
  vetAlfa[307] := 95;
  vetAlfa[308] := 424;
  vetAlfa[309] := 491;
  vetAlfa[310] := 46;
  vetAlfa[311] := 47;
  vetAlfa[312] := 279;
  vetAlfa[313] := 53;
  vetAlfa[314] := 231;
  vetAlfa[315] := 496;
  vetAlfa[316] := 172;
  vetAlfa[317] := 18;
  vetAlfa[318] := 17;
  vetAlfa[319] := 16;
  vetAlfa[320] := 25;
  vetAlfa[321] := 221;
  vetAlfa[322] := 204;
  vetAlfa[323] := 127;
  vetAlfa[324] := 396;
  vetAlfa[325] := 311;
  vetAlfa[326] := 186;
  vetAlfa[327] := 60;
  vetAlfa[328] := 61;
  vetAlfa[329] := 62;
  vetAlfa[330] := 77;
  vetAlfa[331] := 261;
  vetAlfa[332] := 137;
  vetAlfa[333] := 481;
  vetAlfa[334] := 233;
  vetAlfa[335] := 57;
  vetAlfa[336] := 397;
  vetAlfa[337] := 483;
  vetAlfa[338] := 54;
  vetAlfa[339] := 247;
  vetAlfa[340] := 439;
  vetAlfa[341] := 195;
  vetAlfa[342] := 156;
  vetAlfa[343] := 211;
  vetAlfa[344] := 26;
  vetAlfa[345] := 243;
  vetAlfa[346] := 280;
  vetAlfa[347] := 412;
  vetAlfa[348] := 78;
  vetAlfa[349] := 20;
  vetAlfa[350] := 19;
  vetAlfa[351] := 384;
  vetAlfa[352] := 378;
  vetAlfa[353] := 493;
  vetAlfa[354] := 377;
  vetAlfa[355] := 379;
  vetAlfa[356] := 369;
  vetAlfa[357] := 223;
  vetAlfa[358] := 112;
  vetAlfa[359] := 111;
  vetAlfa[360] := 471;
  vetAlfa[361] := 454;
  vetAlfa[362] := 315;
  vetAlfa[363] := 410;
  vetAlfa[364] := 486;
  vetAlfa[365] := 302;
  vetAlfa[366] := 373;
  vetAlfa[367] := 27;
  vetAlfa[368] := 28;
  vetAlfa[369] := 254;
  vetAlfa[370] := 212;
  vetAlfa[371] := 123;
  vetAlfa[372] := 117;
  vetAlfa[373] := 119;
  vetAlfa[374] := 364;
  vetAlfa[375] := 273;
  vetAlfa[376] := 86;
  vetAlfa[377] := 161;
  vetAlfa[378] := 336;
  vetAlfa[379] := 319;
  vetAlfa[380] := 499;
  vetAlfa[381] := 292;
  vetAlfa[382] := 372;
  vetAlfa[383] := 90;
  vetAlfa[384] := 429;
  vetAlfa[385] := 413;
  vetAlfa[386] := 275;
  vetAlfa[387] := 406;
  vetAlfa[388] := 285;
  vetAlfa[389] := 213;
  vetAlfa[390] := 353;
  vetAlfa[391] := 266;
  vetAlfa[392] := 227;
  vetAlfa[393] := 188;
  vetAlfa[394] := 300;
  vetAlfa[395] := 458;
  vetAlfa[396] := 442;
  vetAlfa[397] := 289;
  vetAlfa[398] := 287;
  vetAlfa[399] := 80;
  vetAlfa[400] := 199;
  vetAlfa[401] := 79;
  vetAlfa[402] := 218;
  vetAlfa[403] := 235;
  vetAlfa[404] := 238;
  vetAlfa[405] := 215;
  vetAlfa[406] := 143;
  vetAlfa[407] := 361;
  vetAlfa[408] := 466;
  vetAlfa[409] := 209;
  vetAlfa[410] := 338;
  vetAlfa[411] := 21;
  vetAlfa[412] := 363;
  vetAlfa[413] := 167;
  vetAlfa[414] := 327;
  vetAlfa[415] := 449;
  vetAlfa[416] := 325;
  vetAlfa[417] := 7;
  vetAlfa[418] := 234;
  vetAlfa[419] := 401;
  vetAlfa[420] := 400;
  vetAlfa[421] := 399;
  vetAlfa[422] := 121;
  vetAlfa[423] := 120;
  vetAlfa[424] := 208;
  vetAlfa[425] := 441;
  vetAlfa[426] := 185;
  vetAlfa[427] := 245;
  vetAlfa[428] := 192;
  vetAlfa[429] := 191;
  vetAlfa[430] := 283;
  vetAlfa[431] := 333;
  vetAlfa[432] := 317;
  vetAlfa[433] := 260;
  vetAlfa[434] := 277;
  vetAlfa[435] := 220;
  vetAlfa[436] := 276;
  vetAlfa[437] := 114;
  vetAlfa[438] := 472;
  vetAlfa[439] := 128;
  vetAlfa[440] := 216;
  vetAlfa[441] := 72;
  vetAlfa[442] := 73;
  vetAlfa[443] := 475;
  vetAlfa[444] := 175;
  vetAlfa[445] := 176;
  vetAlfa[446] := 255;
  vetAlfa[447] := 324;
  vetAlfa[448] := 392;
  vetAlfa[449] := 158;
  vetAlfa[450] := 461;
  vetAlfa[451] := 328;
  vetAlfa[452] := 252;
  vetAlfa[453] := 357;
  vetAlfa[454] := 390;
  vetAlfa[455] := 157;
  vetAlfa[456] := 248;
  vetAlfa[457] := 236;
  vetAlfa[458] := 197;
  vetAlfa[459] := 201;
  vetAlfa[460] := 217;
  vetAlfa[461] := 487;
  vetAlfa[462] := 134;
  vetAlfa[463] := 49;
  vetAlfa[464] := 48;
  vetAlfa[465] := 3;
  vetAlfa[466] := 423;
  vetAlfa[467] := 329;
  vetAlfa[468] := 71;
  vetAlfa[469] := 288;
  vetAlfa[470] := 45;
  vetAlfa[471] := 313;
  vetAlfa[472] := 100;
  vetAlfa[473] := 37;
  vetAlfa[474] := 320;
  vetAlfa[475] := 321;
  vetAlfa[476] := 365;
  vetAlfa[477] := 8;
  vetAlfa[478] := 468;
  vetAlfa[479] := 13;
  vetAlfa[480] := 70;
  vetAlfa[481] := 110;
  vetAlfa[482] := 340;
  vetAlfa[483] := 293;
  vetAlfa[484] := 40;
  vetAlfa[485] := 278;
  vetAlfa[486] := 202;
  vetAlfa[487] := 194;
  vetAlfa[488] := 418;
  vetAlfa[489] := 420;
  vetAlfa[490] := 419;
  vetAlfa[491] := 265;
  vetAlfa[492] := 360;
  vetAlfa[493] := 178;
  vetAlfa[494] := 193;
  vetAlfa[495] := 476;
  vetAlfa[496] := 335;
  vetAlfa[497] := 145;
  vetAlfa[498] := 263;
  vetAlfa[499] := 41;
  //ordenação Evolutiva
  vetEvol[0] := 1;
  vetEvol[1] := 2;
  vetEvol[2] := 3;
  vetEvol[3] := 4;
  vetEvol[4] := 5;
  vetEvol[5] := 6;
  vetEvol[6] := 7;
  vetEvol[7] := 8;
  vetEvol[8] := 9;
  vetEvol[9] := 10;
  vetEvol[10] := 11;
  vetEvol[11] := 12;
  vetEvol[12] := 13;
  vetEvol[13] := 14;
  vetEvol[14] := 15;
  vetEvol[15] := 16;
  vetEvol[16] := 17;
  vetEvol[17] := 18;
  vetEvol[18] := 19;
  vetEvol[19] := 20;
  vetEvol[20] := 21;
  vetEvol[21] := 22;
  vetEvol[22] := 23;
  vetEvol[23] := 24;
  vetEvol[24] := 172;
  vetEvol[25] := 25;
  vetEvol[26] := 26;
  vetEvol[27] := 27;
  vetEvol[28] := 28;
  vetEvol[29] := 29;
  vetEvol[30] := 30;
  vetEvol[31] := 31;
  vetEvol[32] := 32;
  vetEvol[33] := 33;
  vetEvol[34] := 34;
  vetEvol[35] := 173;
  vetEvol[36] := 35;
  vetEvol[37] := 36;
  vetEvol[38] := 37;
  vetEvol[39] := 38;
  vetEvol[40] := 174;
  vetEvol[41] := 39;
  vetEvol[42] := 40;
  vetEvol[43] := 41;
  vetEvol[44] := 42;
  vetEvol[45] := 169;
  vetEvol[46] := 43;
  vetEvol[47] := 44;
  vetEvol[48] := 45;
  vetEvol[49] := 182;
  vetEvol[50] := 46;
  vetEvol[51] := 47;
  vetEvol[52] := 48;
  vetEvol[53] := 49;
  vetEvol[54] := 50;
  vetEvol[55] := 51;
  vetEvol[56] := 52;
  vetEvol[57] := 53;
  vetEvol[58] := 54;
  vetEvol[59] := 55;
  vetEvol[60] := 56;
  vetEvol[61] := 57;
  vetEvol[62] := 58;
  vetEvol[63] := 59;
  vetEvol[64] := 60;
  vetEvol[65] := 61;
  vetEvol[66] := 62;
  vetEvol[67] := 186;
  vetEvol[68] := 63;
  vetEvol[69] := 64;
  vetEvol[70] := 65;
  vetEvol[71] := 66;
  vetEvol[72] := 67;
  vetEvol[73] := 68;
  vetEvol[74] := 69;
  vetEvol[75] := 70;
  vetEvol[76] := 71;
  vetEvol[77] := 72;
  vetEvol[78] := 73;
  vetEvol[79] := 74;
  vetEvol[80] := 75;
  vetEvol[81] := 76;
  vetEvol[82] := 77;
  vetEvol[83] := 78;
  vetEvol[84] := 79;
  vetEvol[85] := 80;
  vetEvol[86] := 199;
  vetEvol[87] := 81;
  vetEvol[88] := 82;
  vetEvol[89] := 469;
  vetEvol[90] := 83;
  vetEvol[91] := 84;
  vetEvol[92] := 85;
  vetEvol[93] := 86;
  vetEvol[94] := 87;
  vetEvol[95] := 88;
  vetEvol[96] := 89;
  vetEvol[97] := 90;
  vetEvol[98] := 91;
  vetEvol[99] := 92;
  vetEvol[100] := 93;
  vetEvol[101] := 94;
  vetEvol[102] := 95;
  vetEvol[103] := 208;
  vetEvol[104] := 96;
  vetEvol[105] := 97;
  vetEvol[106] := 98;
  vetEvol[107] := 99;
  vetEvol[108] := 100;
  vetEvol[109] := 101;
  vetEvol[110] := 102;
  vetEvol[111] := 103;
  vetEvol[112] := 104;
  vetEvol[113] := 105;
  vetEvol[114] := 236;
  vetEvol[115] := 106;
  vetEvol[116] := 107;
  vetEvol[117] := 237;
  vetEvol[118] := 108;
  vetEvol[119] := 470;
  vetEvol[120] := 109;
  vetEvol[121] := 110;
  vetEvol[122] := 111;
  vetEvol[123] := 112;
  vetEvol[124] := 471;
  vetEvol[125] := 447;
  vetEvol[126] := 113;
  vetEvol[127] := 242;
  vetEvol[128] := 114;
  vetEvol[129] := 472;
  vetEvol[130] := 115;
  vetEvol[131] := 116;
  vetEvol[132] := 117;
  vetEvol[133] := 230;
  vetEvol[134] := 118;
  vetEvol[135] := 119;
  vetEvol[136] := 120;
  vetEvol[137] := 121;
  vetEvol[138] := 446;
  vetEvol[139] := 122;
  vetEvol[140] := 123;
  vetEvol[141] := 212;
  vetEvol[142] := 238;
  vetEvol[143] := 124;
  vetEvol[144] := 239;
  vetEvol[145] := 125;
  vetEvol[146] := 473;
  vetEvol[147] := 240;
  vetEvol[148] := 126;
  vetEvol[149] := 474;
  vetEvol[150] := 127;
  vetEvol[151] := 128;
  vetEvol[152] := 129;
  vetEvol[153] := 130;
  vetEvol[154] := 131;
  vetEvol[155] := 132;
  vetEvol[156] := 133;
  vetEvol[157] := 134;
  vetEvol[158] := 135;
  vetEvol[159] := 136;
  vetEvol[160] := 196;
  vetEvol[161] := 197;
  vetEvol[162] := 477;
  vetEvol[163] := 478;
  vetEvol[164] := 137;
  vetEvol[165] := 233;
  vetEvol[166] := 481;
  vetEvol[167] := 138;
  vetEvol[168] := 139;
  vetEvol[169] := 140;
  vetEvol[170] := 141;
  vetEvol[171] := 142;
  vetEvol[172] := 453;
  vetEvol[173] := 143;
  vetEvol[174] := 144;
  vetEvol[175] := 145;
  vetEvol[176] := 146;
  vetEvol[177] := 147;
  vetEvol[178] := 148;
  vetEvol[179] := 149;
  vetEvol[180] := 150;
  vetEvol[181] := 151;
  vetEvol[182] := 152;
  vetEvol[183] := 153;
  vetEvol[184] := 154;
  vetEvol[185] := 155;
  vetEvol[186] := 156;
  vetEvol[187] := 157;
  vetEvol[188] := 158;
  vetEvol[189] := 159;
  vetEvol[190] := 160;
  vetEvol[191] := 161;
  vetEvol[192] := 162;
  vetEvol[193] := 163;
  vetEvol[194] := 164;
  vetEvol[195] := 165;
  vetEvol[196] := 166;
  vetEvol[197] := 167;
  vetEvol[198] := 168;
  vetEvol[199] := 170;
  vetEvol[200] := 171;
  vetEvol[201] := 175;
  vetEvol[202] := 176;
  vetEvol[203] := 475;
  vetEvol[204] := 177;
  vetEvol[205] := 178;
  vetEvol[206] := 179;
  vetEvol[207] := 180;
  vetEvol[208] := 181;
  vetEvol[209] := 298;
  vetEvol[210] := 183;
  vetEvol[211] := 184;
  vetEvol[212] := 445;
  vetEvol[213] := 185;
  vetEvol[214] := 187;
  vetEvol[215] := 188;
  vetEvol[216] := 189;
  vetEvol[217] := 190;
  vetEvol[218] := 431;
  vetEvol[219] := 191;
  vetEvol[220] := 192;
  vetEvol[221] := 193;
  vetEvol[222] := 476;
  vetEvol[223] := 194;
  vetEvol[224] := 195;
  vetEvol[225] := 198;
  vetEvol[226] := 437;
  vetEvol[227] := 200;
  vetEvol[228] := 436;
  vetEvol[229] := 201;
  vetEvol[230] := 360;
  vetEvol[231] := 202;
  vetEvol[232] := 203;
  vetEvol[233] := 204;
  vetEvol[234] := 205;
  vetEvol[235] := 206;
  vetEvol[236] := 207;
  vetEvol[237] := 479;
  vetEvol[238] := 209;
  vetEvol[239] := 210;
  vetEvol[240] := 211;
  vetEvol[241] := 213;
  vetEvol[242] := 214;
  vetEvol[243] := 215;
  vetEvol[244] := 468;
  vetEvol[245] := 216;
  vetEvol[246] := 217;
  vetEvol[247] := 218;
  vetEvol[248] := 219;
  vetEvol[249] := 220;
  vetEvol[250] := 221;
  vetEvol[251] := 480;
  vetEvol[252] := 222;
  vetEvol[253] := 223;
  vetEvol[254] := 224;
  vetEvol[255] := 225;
  vetEvol[256] := 465;
  vetEvol[257] := 226;
  vetEvol[258] := 227;
  vetEvol[259] := 228;
  vetEvol[260] := 229;
  vetEvol[261] := 231;
  vetEvol[262] := 232;
  vetEvol[263] := 234;
  vetEvol[264] := 235;
  vetEvol[265] := 241;
  vetEvol[266] := 243;
  vetEvol[267] := 244;
  vetEvol[268] := 245;
  vetEvol[269] := 246;
  vetEvol[270] := 247;
  vetEvol[271] := 248;
  vetEvol[272] := 249;
  vetEvol[273] := 250;
  vetEvol[274] := 251;
  vetEvol[275] := 252;
  vetEvol[276] := 253;
  vetEvol[277] := 254;
  vetEvol[278] := 255;
  vetEvol[279] := 256;
  vetEvol[280] := 257;
  vetEvol[281] := 258;
  vetEvol[282] := 259;
  vetEvol[283] := 260;
  vetEvol[284] := 261;
  vetEvol[285] := 262;
  vetEvol[286] := 263;
  vetEvol[287] := 264;
  vetEvol[288] := 265;
  vetEvol[289] := 266;
  vetEvol[290] := 267;
  vetEvol[291] := 268;
  vetEvol[292] := 269;
  vetEvol[293] := 270;
  vetEvol[294] := 271;
  vetEvol[295] := 272;
  vetEvol[296] := 273;
  vetEvol[297] := 274;
  vetEvol[298] := 275;
  vetEvol[299] := 276;
  vetEvol[300] := 277;
  vetEvol[301] := 278;
  vetEvol[302] := 279;
  vetEvol[303] := 280;
  vetEvol[304] := 281;
  vetEvol[305] := 282;
  vetEvol[306] := 482;
  vetEvol[307] := 283;
  vetEvol[308] := 284;
  vetEvol[309] := 285;
  vetEvol[310] := 286;
  vetEvol[311] := 287;
  vetEvol[312] := 288;
  vetEvol[313] := 289;
  vetEvol[314] := 290;
  vetEvol[315] := 291;
  vetEvol[316] := 292;
  vetEvol[317] := 293;
  vetEvol[318] := 294;
  vetEvol[319] := 295;
  vetEvol[320] := 296;
  vetEvol[321] := 297;
  vetEvol[322] := 299;
  vetEvol[323] := 483;
  vetEvol[324] := 300;
  vetEvol[325] := 301;
  vetEvol[326] := 302;
  vetEvol[327] := 303;
  vetEvol[328] := 304;
  vetEvol[329] := 305;
  vetEvol[330] := 306;
  vetEvol[331] := 307;
  vetEvol[332] := 308;
  vetEvol[333] := 309;
  vetEvol[334] := 310;
  vetEvol[335] := 311;
  vetEvol[336] := 312;
  vetEvol[337] := 313;
  vetEvol[338] := 314;
  vetEvol[339] := 409;
  vetEvol[340] := 315;
  vetEvol[341] := 410;
  vetEvol[342] := 316;
  vetEvol[343] := 317;
  vetEvol[344] := 318;
  vetEvol[345] := 319;
  vetEvol[346] := 320;
  vetEvol[347] := 321;
  vetEvol[348] := 322;
  vetEvol[349] := 323;
  vetEvol[350] := 324;
  vetEvol[351] := 325;
  vetEvol[352] := 326;
  vetEvol[353] := 327;
  vetEvol[354] := 328;
  vetEvol[355] := 329;
  vetEvol[356] := 330;
  vetEvol[357] := 331;
  vetEvol[358] := 332;
  vetEvol[359] := 333;
  vetEvol[360] := 334;
  vetEvol[361] := 335;
  vetEvol[362] := 336;
  vetEvol[363] := 337;
  vetEvol[364] := 338;
  vetEvol[365] := 339;
  vetEvol[366] := 340;
  vetEvol[367] := 341;
  vetEvol[368] := 342;
  vetEvol[369] := 343;
  vetEvol[370] := 344;
  vetEvol[371] := 345;
  vetEvol[372] := 346;
  vetEvol[373] := 347;
  vetEvol[374] := 348;
  vetEvol[375] := 349;
  vetEvol[376] := 350;
  vetEvol[377] := 351;
  vetEvol[378] := 352;
  vetEvol[379] := 353;
  vetEvol[380] := 354;
  vetEvol[381] := 355;
  vetEvol[382] := 356;
  vetEvol[383] := 484;
  vetEvol[384] := 357;
  vetEvol[385] := 440;
  vetEvol[386] := 358;
  vetEvol[387] := 359;
  vetEvol[388] := 361;
  vetEvol[389] := 362;
  vetEvol[390] := 485;
  vetEvol[391] := 363;
  vetEvol[392] := 364;
  vetEvol[393] := 365;
  vetEvol[394] := 366;
  vetEvol[395] := 367;
  vetEvol[396] := 368;
  vetEvol[397] := 369;
  vetEvol[398] := 370;
  vetEvol[399] := 371;
  vetEvol[400] := 372;
  vetEvol[401] := 373;
  vetEvol[402] := 374;
  vetEvol[403] := 375;
  vetEvol[404] := 376;
  vetEvol[405] := 377;
  vetEvol[406] := 378;
  vetEvol[407] := 379;
  vetEvol[408] := 380;
  vetEvol[409] := 381;
  vetEvol[410] := 382;
  vetEvol[411] := 383;
  vetEvol[412] := 384;
  vetEvol[413] := 385;
  vetEvol[414] := 386;
  vetEvol[415] := 387;
  vetEvol[416] := 388;
  vetEvol[417] := 389;
  vetEvol[418] := 390;
  vetEvol[419] := 391;
  vetEvol[420] := 392;
  vetEvol[421] := 393;
  vetEvol[422] := 394;
  vetEvol[423] := 395;
  vetEvol[424] := 396;
  vetEvol[425] := 397;
  vetEvol[426] := 398;
  vetEvol[427] := 399;
  vetEvol[428] := 400;
  vetEvol[429] := 401;
  vetEvol[430] := 402;
  vetEvol[431] := 403;
  vetEvol[432] := 404;
  vetEvol[433] := 405;
  vetEvol[434] := 406;
  vetEvol[435] := 407;
  vetEvol[436] := 408;
  vetEvol[437] := 411;
  vetEvol[438] := 412;
  vetEvol[439] := 413;
  vetEvol[440] := 414;
  vetEvol[441] := 415;
  vetEvol[442] := 416;
  vetEvol[443] := 417;
  vetEvol[444] := 418;
  vetEvol[445] := 419;
  vetEvol[446] := 420;
  vetEvol[447] := 421;
  vetEvol[448] := 422;
  vetEvol[449] := 423;
  vetEvol[450] := 424;
  vetEvol[451] := 425;
  vetEvol[452] := 426;
  vetEvol[453] := 427;
  vetEvol[454] := 428;
  vetEvol[455] := 429;
  vetEvol[456] := 430;
  vetEvol[457] := 432;
  vetEvol[458] := 433;
  vetEvol[459] := 434;
  vetEvol[460] := 435;
  vetEvol[461] := 438;
  vetEvol[462] := 439;
  vetEvol[463] := 441;
  vetEvol[464] := 442;
  vetEvol[465] := 443;
  vetEvol[466] := 444;
  vetEvol[467] := 448;
  vetEvol[468] := 449;
  vetEvol[469] := 450;
  vetEvol[470] := 451;
  vetEvol[471] := 452;
  vetEvol[472] := 454;
  vetEvol[473] := 455;
  vetEvol[474] := 456;
  vetEvol[475] := 457;
  vetEvol[476] := 458;
  vetEvol[477] := 459;
  vetEvol[478] := 460;
  vetEvol[479] := 461;
  vetEvol[480] := 462;
  vetEvol[481] := 463;
  vetEvol[482] := 464;
  vetEvol[483] := 466;
  vetEvol[484] := 467;
  vetEvol[485] := 486;
  vetEvol[486] := 487;
  vetEvol[487] := 488;
  vetEvol[488] := 489;
  vetEvol[489] := 490;
  vetEvol[490] := 491;
  vetEvol[491] := 492;
  vetEvol[492] := 493;
  vetEvol[493] := 494;
  vetEvol[494] := 495;
  vetEvol[495] := 496;
  vetEvol[496] := 497;
  vetEvol[497] := 498;
  vetEvol[498] := 499;
  vetEvol[499] := 500;
end;

end.


