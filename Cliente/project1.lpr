program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lnetvisual, unit1, Unit3, Unit4
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Cliente';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tjanela_login, janela_login);
  Application.CreateForm(Ttelalogado, telalogado);
  Application.CreateForm(Tjanela_senha, janela_senha);
  Application.Run;
end.

