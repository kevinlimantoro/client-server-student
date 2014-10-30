unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, Grids;

type
  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    Label1: TLabel;
    Button1: TButton;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  temp:string;
  i:integer=0;
  j,k:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
serversocket1.Port:=2000;
serversocket1.Open;
end;
procedure DeleteStringGrid(AStringGrid:TStringGrid;Arow:Integer);
var
  i,j:integer;
begin
  for i := Arow to AStringGrid.RowCount - 2 do
  begin
    for j := 0 to AStringGrid.ColCount - 1 do
    begin
      AStringGrid.Cells[j,i] := AStringGrid.Cells[j,i+1];
    end;
  end;
  AStringGrid.RowCount := AStringGrid.RowCount-1;
end;
procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
      temp:=socket.ReceiveText;
   if copy(temp,1,1)='!' then
   begin
   i:=i+1;
   stringgrid1.Cells[0,i]:=copy(temp,2,8);
   stringgrid1.Cells[1,i]:=copy(temp,10,pos('@',temp)-10);
   stringgrid1.Cells[2,i]:=copy(temp,pos('@',temp)+1,length(temp)-pos('@',temp));
   end

   else if copy(temp,1,4)='view' then
   begin
   k:=0;
   for j:=1 to i do
    if stringgrid1.Cells[0,j]=copy(temp,5,8) then
    k:=j;

   if k<>0 then
   serversocket1.Socket.Connections[0].SendText('!'+stringgrid1.Cells[1,k]+'@'+stringgrid1.cells[2,k])
   else
   serversocket1.Socket.Connections[0].SendText('takada');
   end

   else if copy(temp,1,4)='edit' then
   begin
   k:=0;
   for j:=1 to i do
   if stringgrid1.Cells[0,j]=copy(temp,5,8) then
    k:=j;

    if k<>0 then
    begin
    stringgrid1.Cells[1,k]:=copy(temp,13,pos('@',temp)-13);
    stringgrid1.Cells[2,k]:=copy(temp,pos('@',temp)+1,length(temp)-pos('@',temp));
    serversocket1.Socket.Connections[0].SendText('o');
    end
    else
    serversocket1.Socket.Connections[0].SendText('takada');
    end

    else if copy(temp,1,3)='del' then
    begin
    k:=0;
   for j:=1 to i do
   if stringgrid1.Cells[0,j]=copy(temp,4,8) then
    k:=j;
    if k<>0 then
    begin
   deletestringgrid(stringgrid1,k);
   serversocket1.Socket.Connections[0].SendText('berhasildelete');
   i:=i-1;
    end
    else
    serversocket1.Socket.Connections[0].SendText('takada');
    end;


end;



procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
serversocket1.Socket.Connections[0].SendText('TALK'+key);
end;

end.
