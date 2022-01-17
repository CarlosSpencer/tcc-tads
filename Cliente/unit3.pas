unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  StdCtrls;

type

  { Ttelalogado }

  Ttelalogado = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    tempo_usado: TEdit;
    saldo_tempo: TEdit;
    hora_atual: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
  private

  public

  end;

var
  telalogado: Ttelalogado;

implementation

{$R *.lfm}

end.

