unit u_util;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzLstBox,
  RzDBList, RzLabel, RzButton, ComCtrls, RzTreeVw, RzTabs, DB,
  DBCtrls, GridsEh, DBGridEh, DBCtrlsEh, ImgList,
  ExtCtrls, RzDBNav, Oracle, OracleData, RzRadChk, Grids, DBGrids,
  RzShellDialogs, RzPanel, RzSplit, Menus, RzPrgres, RzStatus, AxCtrls,
  OleCtrls, VCF1, OleServer, ExcelXP, ADODB;

 function MyGetStrPiece(instr, delim: string; ordn: integer): string;
 function StrToHex(S: String): Byte;
 Function HexToStr(B: Byte): String;
 Procedure DefaultInterface;
 procedure RefreshCounts;


implementation
	  uses u_main;
//?????????? ????? ?????? ?? ?????? instr, ? ??????? ????? ????????? delim ? ?????
//???????????? ????? = ordn
 function MyGetStrPiece(instr, delim: string; ordn: integer): string;

var
  CurPos: integer;
  LStr: integer;
  IStr: integer;
  DlCnt: integer;
  BStr: integer;
  LOutStr: integer;
  OutStr: String;


begin
  LStr := Length(instr);
  if (LStr > 0) and (delim <> '') and (ordn > 0) then begin
    BStr := 1;
    DlCnt := 0;
    LOutStr := -1;
    for IStr := 1 to LStr do begin
      if Copy(instr, IStr, 1) = delim then begin
        DlCnt := DlCnt + 1;
        if DlCnt < ordn then
          BStr := IStr + 1;
        if DlCnt = ordn then
          LOutStr := IStr - BStr;
      end;
    end;
    if LOutStr = -1 then
      LOutStr := IStr - BStr + 1;
    if DlCnt + 1 < ordn then
      OutStr := ''
    else
      OutStr := Copy(instr, BStr, LOutStr);
  end else
    OutStr := '';
  Result := OutStr;
end;

procedure RefreshCounts;
Begin
//????????? ?????????? ????????? ?????????? ?????
// Main.ODSConsCnt.Refresh; Main.ODSConcentratorsCnt.Refresh; Main.ODSCountersCnt.Refresh;

{ Main.Label1.Caption:='???-?? ??????: '+Main.ODSConsCnt.FieldByName('CNT').AsString;
 Main.Label2.Caption:='???-?? ??????????????: '+Main.ODSConcentratorsCnt.FieldByName('CNT').AsString;
 Main.Label3.Caption:='???-?? ?????????: '+Main.ODSCountersCnt.FieldByName('CNT').AsString;}
End;

Function StrToHex(S: String): Byte;
Begin
  StrToHex := ((StrToInt(Copy(S, 1, 1))) shl 4) or
				  (StrToInt(Copy(S, 2, 1)));
End;

Function HexToStr(B: Byte): String;
Begin
  HexToStr := IntToStr(B div 16) + IntToStr(B mod 16);
End;

Procedure DefaultInterface;
var
CBFlagStr,PrecCBStr:string;
Begin
CBFlagStr:=''; PrecCBStr:='';
If Main.CBFlag.Checked=true then
CBFlagStr:='/00:00';
If Main.PrecCB.Checked=true then
PrecCBStr:='; PREC=0';
//????????? ??????????? ?????? ?????????? "?? ?????????"
//??? PLC
If Main.RGType.ItemIndex=0 then
 begin
  Main.WorkFileMemo.Lines.Add(chr(13));
  Main.WorkFileMemo.Lines.Add('INTERFACE');
  Main.WorkFileMemo.Lines.Add(chr(9)+'TYPE=TABLE');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=20; TITLE=?; VALUE=NUM');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=40; TITLE=PLC-?????; VALUE=PROPERTY; FILTER=ADDR');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=100; TITLE=?????; VALUE=PROPERTY; FILTER=?????');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=30; TITLE=???; VALUE=PROPERTY; FILTER=???');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=60; TITLE=?????????; VALUE=PROPERTY; FILTER=?????????');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=40; TITLE=????.; VALUE=PROPERTY; FILTER=????.');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=120; TITLE=????????? ???.; VALUE=BINDATA; FILTER=SUM'+CBFlagStr);
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=60; TITLE=????????? ???.; VALUE=CALC; FILTER=G'+PrecCBStr);
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=120; TITLE=????????? T1; VALUE=BINDATA; FILTER=T1'+CBFlagStr);
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=120; TITLE=????????? T2; VALUE=BINDATA; FILTER=T2'+CBFlagStr);
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=120; TITLE=????????? T3; VALUE=BINDATA; FILTER=T3'+CBFlagStr);
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=120; TITLE=????????? T4; VALUE=BINDATA; FILTER=T4'+CBFlagStr);
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=50; TITLE=??; VALUE=PROPERTY; FILTER=??'+CBFlagStr);
 end;
//??? CAN
If Main.RGType.ItemIndex=2 then
 begin
  Main.WorkFileMemo.Lines.Add(chr(13));
  Main.WorkFileMemo.Lines.Add('INTERFACE');
  Main.WorkFileMemo.Lines.Add(chr(9)+'TYPE=TABLE; TITLE=???????; NAME=M230ENERGY; NAMEMETER=MERCURY_230');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=20; TITLE=?; VALUE=NUM');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=55; TITLE=ADDR; VALUE=PROPERTY; FILTER=ADDR');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=100; TITLE=?????; VALUE=PROPERTY; FILTER=?????');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=157; TITLE=???; VALUE=PROPERTY; FILTER=???');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=157; TITLE=?????????; VALUE=BINDATA; FILTER=SN');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=160; TITLE=?????????; VALUE=BINDATA; FILTER=A+ FILTER=T0');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=160; TITLE=????????? T1; VALUE=BINDATA; FILTER=T1');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=160; TITLE=????????? T2; VALUE=BINDATA; FILTER=T2');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=160; TITLE=????????? T3; VALUE=BINDATA; FILTER=T3');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=160; TITLE=????????? T4; VALUE=BINDATA; FILTER=T4');
 end;
//??? ????
If Main.RGType.ItemIndex=1 then
 begin
  Main.WorkFileMemo.Lines.Add(chr(13));
  Main.WorkFileMemo.Lines.Add('INTERFACE');
  Main.WorkFileMemo.Lines.Add(chr(9)+'TYPE=TABLE');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=20; TITLE=?; VALUE=NUM');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=55; TITLE=PLC-?????; VALUE=PROPERTY; FILTER=ADDR');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=100; TITLE=?????; VALUE=PROPERTY; FILTER=?????');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=157; TITLE=???; VALUE=PROPERTY; FILTER=???');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=157; TITLE=?????????????; VALUE=PROPERTY; FILTER=?????????????');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=103; TITLE=????????? ?????????; VALUE=PROPERTY; FILTER=????????? ?????????');

  //Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=10');

  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=185; TITLE=????; VALUE=BINDATA; FILTER=COLD_A');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=50; TITLE=???????; VALUE=CALC; FILTER=G*N*10+M'+PrecCBStr);
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=185; TITLE=????; VALUE=BINDATA; FILTER=COLD_B');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=185; TITLE=????; VALUE=BINDATA; FILTER=HOT_A');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=185; TITLE=????; VALUE=BINDATA; FILTER=HOT_B');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=30; TITLE=****; VALUE=PROPERTY; FILTER=****');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=50; TITLE=???; VALUE=PROPERTY; FILTER=?????');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=50; TITLE=????; VALUE=PROPERTY; FILTER=????');
  Main.WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN; WIDTH=100; TITLE=????.; VALUE=PROPERTY; FILTER=????.');
 end;
End;

end.

 
