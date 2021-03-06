unit UntTransf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, RXCtrls;

type
  TFrmTransf = class(TForm)
    ImgFundoTransf: TImage;
    CmBBoxes: TComboBox;
    BtnFechar: TSpeedButton;
    BtnConfirma: TSpeedButton;
    RxLabel26: TRxLabel;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTransf: TFrmTransf;

implementation

uses UntExpert;

{$R *.dfm}

procedure TFrmTransf.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTransf.BtnConfirmaClick(Sender: TObject);
begin
  FrmSimulation.BtnTransfere.Tag := CmBBoxes.ItemIndex + 1;
  ModalResult := mrOk;
end;

procedure TFrmTransf.FormCreate(Sender: TObject);
begin
   FrmSimulation.CarregaIMG(ImgFundoTransf,3,112);
end;

end.
