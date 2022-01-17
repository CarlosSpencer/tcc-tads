unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  lNetComponents;

type

  { Tdados }

  Tdados = class(TForm)
    ClienteTCP: TLTCPComponent;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    PopupMenu1: TPopupMenu;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    procedure MenuItem1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  dados: Tdados;

implementation

{$R *.lfm}

{ Tdados }

procedure Tdados.Timer1Timer(Sender: TObject);
begin
  //DATA E HORA no STATUSBAR
//  unit1.janela_login.painel_login.Panels[2].Text:= 'Dia: ' + DateToStr(date) + ' / Hora: ' + TimeToStr(now);


  //FORÇA PROGRAMA NÃO SER FINALIZADO
 // if ((unit1.janela_login.Active = false) and (unit3.telalogado.Visible = FALSE)) then
//begin
 //   unit1.janela_login.Show;
// end;


end;

procedure Tdados.MenuItem1Click(Sender: TObject);
begin
  telalogado.Show;
end;

end.

