program PrjSimulador;

uses
  Forms,
  UntPrincipal in 'UntPrincipal.pas' {FrmPrincipal},
  UntOptions in 'UntOptions.pas' {FrmOptions};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Simulador Pokémon D/P';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
