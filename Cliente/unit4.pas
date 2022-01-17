unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls;

type

  { Tjanela_senha }

  Tjanela_senha = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private

  public

  end;

var
  janela_senha: Tjanela_senha;

implementation

{$R *.lfm}

{ Tjanela_senha }



procedure Tjanela_senha.BitBtn1Click(Sender: TObject);
begin

end;

procedure Tjanela_senha.BitBtn2Click(Sender: TObject);
begin

end;

end.

