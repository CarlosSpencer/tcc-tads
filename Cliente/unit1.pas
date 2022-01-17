unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ComCtrls, Menus, lNetComponents, Windows, Winsock, Unit3, unit4, lNet;

type

  { Tjanela_login }

  Tjanela_login = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Image1: TImage;
    campo_login: TLabeledEdit;
    campo_senha: TLabeledEdit;
    caixa_login: TPanel;
    ClienteTCP: TLTCPComponent;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    painel_login: TStatusBar;
    PopupMenu1: TPopupMenu;
    TrayIcon1: TTrayIcon;
    wallpaper_login: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ClienteTCPReceive(aSocket: TLSocket);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure wallpaper_loginClick(Sender: TObject);
  private

  public

  end;

var
  janela_login: Tjanela_login;
  IP, COMPUTADOR, STATUS, USUARIO, ENTRADA, SAIDA: string;

implementation

{$R *.lfm}

{ Tjanela_login }


//função para buscar NOME DO COMPUTADOR da maquina cliente
function GetNomeComputador: string;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
var
  lpBuffer: PChar;
  nSize: DWord;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer, nSize);
  Result := string(lpBuffer);
  StrDispose(lpBuffer);
end;

//função para buscar IP DO COMPUTADOR da maquina cliente
function GetIP: string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name: string;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PChar(Name), 255);
  SetLength(Name, StrLen(PChar(Name)));
  HostEnt := gethostbyname(PChar(Name));
  with HostEnt^ do
  begin
    Result := Format('%d.%d.%d.%d', [byte(h_addr^[0]), byte(h_addr^[1]),
      byte(h_addr^[2]), byte(h_addr^[3])]);
  end;
  WSACleanup;
end;


procedure Tjanela_login.BitBtn1Click(Sender: TObject);
var
  msg: string;
  tentativas: integer;
begin
  caixa_login.Enabled := False;
  tentativas := 0;
  repeat
    if (clientetcp.Connected = False) then
    begin
      clientetcp.Connect(IP, 667);
      Sleep(3000);
      tentativas := tentativas + 1;
    end;



  until ((tentativas > 3) or (clientetcp.Connected = True));
  caixa_login.Enabled := True;
  if clientetcp.Connected = True then
  begin
    msg := '#1#';
    msg := msg + '(' + IP + ')';
    msg := msg + '[' + COMPUTADOR + ']';
    msg := msg + '<' + campo_login.Text + '>';
    msg := msg + '{' + campo_senha.Text + '}';
    clientetcp.SendMessage(msg);
  end
  else
  begin
    ShowMessage('VOCÊ NÃO ESTA CONECTADO AO SERVIDOR!');
  end;
end;

procedure Tjanela_login.BitBtn3Click(Sender: TObject);
begin
  if (clientetcp.Connected = True) then
  begin
    clientetcp.Disconnect(True);
  end;
  Close;

end;

procedure Tjanela_login.ClienteTCPReceive(aSocket: TLSocket);
var
  s: string;
begin
  if (ClienteTCP.GetMessage(s) > 0) then
  begin
    if (s = 'ERRO') then
    begin
      ShowMessage(
        'Login de usuário ou senha está incorreto, ou você não tem permissões');
      campo_senha.Text := '';
      campo_login.SetFocus;
    end
    else
    begin
      TrayIcon1.Visible := True;
      janela_login.Visible := False;
      janela_senha.Visible := False;
      telalogado.Visible := False;
    end;
  end;
end;

procedure Tjanela_login.FormCreate(Sender: TObject);
begin
  IP := GetIP;
  COMPUTADOR := GetNomeComputador;
  painel_login.Panels[0].Text := 'IP: ' + IP + ' / Status do Servidor: ';
  painel_login.Panels[1].Text := 'Nome do Computador: ' + COMPUTADOR;
  if (clientetcp.Connected = False) then
  begin
    clientetcp.Connect(IP, 667);
  end;
end;

procedure Tjanela_login.MenuItem1Click(Sender: TObject);
begin
  janela_login.Visible := False;
  telalogado.Visible := False;
  janela_senha.Top := Screen.Height - janela_senha.Height - 60;
  janela_senha.Left := screen.Width - janela_senha.Width;
  janela_senha.Show;
end;

procedure Tjanela_login.MenuItem2Click(Sender: TObject);
begin
  janela_login.Visible := False;
  janela_senha.Visible := False;
  telalogado.Top := Screen.Height - telalogado.Height - 60;
  telalogado.Left := screen.Width - telalogado.Width;
  telalogado.Show;

end;

procedure Tjanela_login.MenuItem3Click(Sender: TObject);
var
  msg: string;
begin
  telalogado.Visible := False;
  janela_senha.Visible := False;
  janela_login.Visible := True;
  janela_login.campo_senha.Text := '';
  janela_login.campo_login.Text := '';
  msg := '#2#';
  msg := msg + '(' + IP + ')';
  ClienteTCP.SendMessage(msg);
end;

procedure Tjanela_login.MenuItem4Click(Sender: TObject);
begin

end;

procedure Tjanela_login.wallpaper_loginClick(Sender: TObject);
begin

end;

end.
