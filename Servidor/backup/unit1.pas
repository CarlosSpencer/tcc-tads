unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql57conn, DB, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Buttons, DBGrids, ZConnection, ZDataset, ZStoredProcedure,
  ZSqlProcessor, lNetComponents, lNet, VirtualTrees, Menus, Windows, Winsock, lclproc;

type

  { TSERVIDOR }

  TSERVIDOR = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnLigar: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    edtIP: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    Memo2: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MySQL57Connection1: TMySQL57Connection;
    PageControl1: TPageControl;
    Porta: TLabel;
    servidortcp: TLTCPComponent;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ZConnection1: TZConnection;
    SQLaux: TZQuery;
    ZTable1: TZTable;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnLigarClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure servidortcpConnect(aSocket: TLSocket);
    procedure servidortcpDisconnect(aSocket: TLSocket);
    procedure servidortcpError(const msg: string; aSocket: TLSocket);
    procedure servidortcpReceive(aSocket: TLSocket);
    function Login(plogin_cliente, psenha_cliente: string): integer;
    function Registro_login(pCodigo: integer; pMaquina, pIP: string): integer;
    function logout(pIP: string): integer;
    procedure Quero_Conectar(s: string);
    procedure Quero_Desconectar(s: string);
  private

  public

  end;

var
  SERVIDOR: TSERVIDOR;

implementation

{$R *.lfm}

{ TSERVIDOR }

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




procedure TSERVIDOR.btnLigarClick(Sender: TObject);
begin
  if (servidortcp.Connected = False) then
  begin
    servidortcp.Host := edtIP.Text;
    servidortcp.Listen;
    btnligar.Kind := bkNO;
    btnLigar.Caption := 'DESLIGAR';
  end
  else
  begin
    btnligar.Kind := bkYes;
    btnLigar.Caption := 'LIGAR';
    servidortcp.Disconnect(True);
  end;
end;

procedure TSERVIDOR.Memo1Change(Sender: TObject);
begin
  IF (MEMO1.Lines.Count>10) then
     begin
       memo1.Lines.Delete(0);
     end;
end;

procedure TSERVIDOR.MenuItem1Click(Sender: TObject);
begin
  PageControl1.PageIndex:=0;
end;

procedure TSERVIDOR.MenuItem2Click(Sender: TObject);
begin
    PageControl1.PageIndex:=1;
end;

procedure TSERVIDOR.BitBtn2Click(Sender: TObject);
begin
  edtIP.Text := GetIP;
end;

procedure TSERVIDOR.servidortcpConnect(aSocket: TLSocket);
begin

end;

procedure TSERVIDOR.servidortcpDisconnect(aSocket: TLSocket);
begin
  logout(aSocket.PeerAddress);
end;

procedure TSERVIDOR.servidortcpError(const msg: string; aSocket: TLSocket);
begin
  memo1.Lines.add('ERRO = ' + msg);
end;

function TSERVIDOR.logout(pIP: string): integer;
var
  resposta: integer;
begin
  resposta := -1;
  SQLaux.Close;
  SQLaux.SQL.Clear;
  sqlAux.SQL.Add('select func_logout(' + QuotedStr(pIP) + ') as resposta');
  sqlAux.Open;
  if (SQLaux.RecordCount > 0) then
  begin
    resposta := SQLaux.FieldByName('resposta').AsInteger;
  end;
  logout := resposta;
end;

procedure TSERVIDOR.Quero_Desconectar(s: string);
var
  ip_cliente: string;
begin
  ip_cliente := GetPart('(', ')', s);
  logout(ip_cliente);
end;

function TSERVIDOR.Login(plogin_cliente, psenha_cliente: string): integer;
var
  codigo_cliente: integer;
begin
  codigo_cliente := -1;
  SQLaux.Close;
  SQLaux.SQL.Clear;
  sqlAux.SQL.Add('select func_login(' + QuotedStr(plogin_cliente) +
    ',' + QuotedStr(psenha_cliente) + ') as resposta');
  sqlAux.Open;
  if (SQLaux.RecordCount > 0) then
  begin
    codigo_cliente := SQLaux.FieldByName('resposta').AsInteger;
  end;
  Login := codigo_cliente;
end;

function TSERVIDOR.Registro_login(pCodigo: integer; pMaquina, pIP: string): integer;
var
  resposta: integer;
begin
  resposta := -1;
  SQLaux.Close;
  SQLaux.SQL.Clear;
  sqlAux.SQL.Add('select func_registra_log(' + IntToStr(pCodigo) +
    ',' + QuotedStr(pMaquina) + ',' + QuotedStr(pIP) + ') as resposta');
  sqlAux.Open;
  if (SQLaux.RecordCount > 0) then
  begin
    resposta := SQLaux.FieldByName('resposta').AsInteger;
  end;
  Registro_login := resposta;
end;

procedure TSERVIDOR.Quero_Conectar(s: string);
var
  ip_cliente, maquina_cliente, login_cliente, senha_cliente: string;
  codigo_cliente: integer;
begin
  maquina_cliente := '';
  ip_cliente := '';
  login_cliente := '';
  senha_cliente := '';
  ip_cliente := GetPart('(', ')', s);
  maquina_cliente := GetPart('[', ']', s);
  login_cliente := GetPart('<', '>', s);
  senha_cliente := GetPart('{', '}', s);

  if ((ip_cliente <> '') and (maquina_cliente <> '') and
    (login_cliente <> '') and (senha_cliente <> '')) then
  begin
    codigo_cliente := Login(login_cliente, senha_cliente);
    if (codigo_cliente <> -1) then
    begin
      codigo_cliente := Registro_login(codigo_cliente, maquina_cliente, ip_cliente);
      if (codigo_cliente <> -1) then
      begin
        s := 'OK';
        servidortcp.SendMessage(s);
      end
      else
      begin
        //Erro de registro de login
        s := 'ERRO';
        servidortcp.SendMessage(s);
      end;
    end
    else
    begin
      //Erro de usuario ou senha
      s := 'ERRO';
      servidortcp.SendMessage(s);
    end;
  end
  else
  begin
    //Dados recebidos errados ou inclompletos
    s := 'ERRO';
    servidortcp.SendMessage(s);
  end;
end;




procedure TSERVIDOR.servidortcpReceive(aSocket: TLSocket);
var
  s, msgcode: string;
begin
  msgcode := '';
  if aSocket.GetMessage(s) > 0 then
  begin
    msgcode := GetPart('#', '#', s);
    if (msgcode = '1') then
    begin
      Quero_Conectar(s);
      ZTable1.Refresh;
    end;

    if (msgcode = '2') then
    begin
      Quero_Desconectar(s);
      ZTable1.Refresh;
    end;

  end;
end;

end.
