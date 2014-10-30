unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp;

type
  TForm1 = class(TForm)
    ClientSocket1: TClientSocket;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  temp:string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
clientsocket1.Address:=edit1.Text;
clientsocket1.port:=2000;
clientsocket1.Open;
end;

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
temp:=socket.ReceiveText;
if copy(temp,1,6)='takada' then
  showmessage('data tak diketemukan')
  else if copy(temp,1,1)='o' then
  showmessage('Update successful')
  else if temp='berhasildelete' then
  showmessage('delete berhasil dilakukan')
  else if copy(temp,1,1)='!' then
  showmessage('Nama: '+copy(temp,2,pos('@',temp)-2)+' Nilai: '+copy(temp,pos('@',temp)+1,length(temp)-pos('@',temp)));
end;

procedure TForm1.memo1KeyPress(Sender: TObject; var Key: Char);
begin
clientsocket1.Socket.SendText('TALK'+key)
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
clientsocket1.Socket.SendText('!'+edit2.Text+edit3.Text+'@'+edit4.Text)
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
clientsocket1.Socket.SendText('view'+edit2.Text);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
clientsocket1.Socket.SendText('edit'+edit2.Text+edit3.Text+'@'+edit4.Text);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
clientsocket1.Socket.SendText('del'+edit2.Text)
end;

end.
