unit UntInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, shellapi, Buttons, RXCtrls;

type
  TFrmInfo = class(TForm)
    ImgInfo: TImage;
    BtnFechar: TSpeedButton;
    RxLabel26: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    procedure BtnFecharClick(Sender: TObject);
    procedure ImgInfoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure RxLabel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInfo: TFrmInfo;

implementation

uses UntExpert;

{$R *.dfm}

procedure TFrmInfo.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmInfo.ImgInfoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TFrmInfo.FormCreate(Sender: TObject);
begin
   FrmSimulation.CarregaIMG(imgInfo,3,105);
end;

procedure TFrmInfo.RxLabel1Click(Sender: TObject);
begin
  shellexecute(handle,'open','mailto:mpc.lalau@gmail.com',nil,nil,sw_show);
end;



end.
