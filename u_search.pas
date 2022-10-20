unit u_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzLstBox,
  RzDBList, RzLabel, RzButton, ComCtrls, RzTreeVw, RzTabs, DB,
  DBCtrls, GridsEh, DBGridEh, DBCtrlsEh, ImgList,
  ExtCtrls, RzDBNav, Oracle, OracleData, RzRadChk, Grids, DBGrids,
  RzShellDialogs, RzPanel, RzSplit, Menus, RzPrgres, RzStatus, AxCtrls,
  OleCtrls, VCF1, OleServer, ExcelXP, ADODB, Buttons, IWControl, IWExtCtrls,
  RzLaunch,DateUtils, RzRadGrp, ExtDlgs, DBTables, JPEG, ActnList;
type
  TSearchForm = class(TForm)      
	 DBGridEh1: TDBGridEh;
    SearchButt: TRzBitBtn;
    AddressEdit: TRzEdit;
    NumberEdit: TRzEdit;
    CountersSet: TOracleDataSet;
    DataSource1: TDataSource;
    RzLabel2: TRzLabel;
	 RzLabel3: TRzLabel;
    CountersSetID_COUNTER: TIntegerField;
    CountersSetID_CONCENTRATOR: TIntegerField;
    CountersSetID_CON: TIntegerField;
    CountersSetCOUNTER_NAME: TStringField;
    CountersSetTYPE_ID: TIntegerField;
    CountersSetSTREET: TStringField;
    CountersSetDOM: TStringField;
    CountersSetFLAT: TStringField;
    CountersSetSERIAL_NUMBER: TStringField;
    CountersSetCOUNTER_ADDRESS: TIntegerField;
    CountersSetCOMMENTS: TStringField;
    CountersSetTEHN_ADDRESS: TWideStringField;
    CountersSetOVERFLOW_RATE: TIntegerField;
    CountersSetIS_CAN: TIntegerField;
    CountersSetFLAG: TFloatField;
    CountersSetIS_WATER: TFloatField;
	 CountersSetDATE_CREATE: TDateTimeField;
    CountersSetCON_NAME: TStringField;
    ActionList1: TActionList;
    SearchButtClickAct: TAction;
    TransferAll: TRzBitBtn;
    QntyLabel: TRzLabel;
    PB: TRzProgressBar;
    HouseEdit: TRzEdit;
    RzLabel1: TRzLabel;
    Panel1: TPanel;
    SimEdit: TRzEdit;
    FindSimButt: TRzBitBtn;
    SimLabel: TRzLabel;
    OQ: TOracleQuery;
    Label1: TLabel;
    procedure DBGridEh1CellClick(Column: TColumnEh);
	 procedure DBGridEh1DblClick(Sender: TObject);
	 procedure CreateTaskAfterReport(ser_num:string);
    procedure AddressEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NumberEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchButtClickActExecute(Sender: TObject);
    procedure TransferAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HouseEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddressEditChange(Sender: TObject);
    procedure FindSimButtClick(Sender: TObject);

  private
    { Private declarations }
  public
	 { Public declarations }
  end;

var
  SearchForm: TSearchForm;

implementation

uses u_main;
type MyColumnType=TColumnEh;
{$R *.dfm}

procedure TSearchForm.DBGridEh1CellClick(Column: TColumnEh);
var
x:integer;
stroka:string;
NodeToSearch:TTreeNode;

begin
Main.FocusedTree:=Main.StructureTree;

  stroka:= CountersSet.FieldByName('STREET').AsString+' '+CountersSet.FieldByName('DOM').AsString
			+' '+'('+CountersSet.FieldByName('COUNTER_ADDRESS').AsString+')';
							 
For x:=0 to Main.StructureTree.Items.Count-1 do
 begin
  if Main.StructureTree.Items.Item[x].Text=Stroka then
	begin
	 NodeToSearch:=Main.StructureTree.Items.Item[x];
	 Main.StructureTree.Select(NodeToSearch);
	 Break;
	end;
 end;
end;                            

procedure TSearchForm.DBGridEh1DblClick(Sender: TObject);
begin

Main.ODSTochka.DisableControls;
If CountersSet.Active=true then
  If CountersSet.RecordCount>0 then
	Main.Transfer 
  else
	Exit;

If CountersSet.Active=false then
 Exit;
Main.ODSTochka.EnableControls;

end;

procedure TSearchForm.CreateTaskAfterReport(ser_num:string);
var
Col:MyColumnType;
begin
//подкидываем серийный номер
 NumberEdit.Text:=ser_num;
//ищем счетчик
  SearchButt.Click;
//имитируем нажатие на грид
  DBGridEh1CellClick(Col);        

If CountersSet.RecordCount=1 then
	Begin
	 CountersSet.First;
	 Main.Transfer;
	End
  else
	Exit; 

end;

procedure TSearchForm.AddressEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=$D then 
  SearchButt.Click;
end;

procedure TSearchForm.NumberEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=$D then 
  SearchButt.Click;
end;

procedure TSearchForm.SearchButtClickActExecute(Sender: TObject);
begin

if CountersSet.Active=true then CountersSet.close;

 CountersSet.filter:='';
//формируем фильтры
//адрес  (без серийного и дома)
If (AddressEdit.Text<>'') and  (NumberEdit.Text='') and (HouseEdit.Text='') then
  CountersSet.filter:=CountersSet.filter+'street = ''*'+AddressEdit.Text+'*''';
 //серийный номер (без адреса и дома)
If (AddressEdit.Text='') and  (NumberEdit.Text<>'') and (HouseEdit.Text='') then
  CountersSet.filter:=CountersSet.filter+'serial_number = ''*'+NUmberEdit.Text+'*''';
//адрес и серийный (без дома)
If (AddressEdit.Text<>'') and  (NumberEdit.Text<>'') and (HouseEdit.Text='') then
  CountersSet.filter:=CountersSet.filter+'(street = ''*'+AddressEdit.Text+'*'')'
 +' and (serial_number = ''*'+NUmberEdit.Text+'*'')';
//дом с адресом  (без серийника)
If (HouseEdit.text<>'') and (AddressEdit.Text<>'') and (NumberEdit.Text='') then
  CountersSet.filter:=CountersSet.filter+'(street = ''*'+AddressEdit.Text+'*'')'
 +' and (dom = ''*'+HouseEdit.Text+'*'')';
//дом, адрес и серийник
If (HouseEdit.text<>'') and (AddressEdit.Text<>'') and (NumberEdit.Text<>'') then
  CountersSet.filter:=CountersSet.filter+'(street = ''*'+AddressEdit.Text+'*'')'
 +' and (dom = ''*'+HouseEdit.Text+'*'')'+ ' and (serial_number = ''*'+NumberEdit.Text+'*'')';

 CountersSet.Open;
 CountersSet.filtered:=true;

QntyLabel.Caption:='Количество: '+IntToStr(CountersSet.RecordCount);
end;

procedure TSearchForm.TransferAllClick(Sender: TObject);
var
Col:MyColumnType;
begin

try
 //Main.ODSTochka.DisableControls;

If CountersSet.RecordCount>0 then
	Begin
	 PB.PartsComplete:=0;
	 PB.TotalParts:=CountersSet.RecordCount;

	 CountersSet.First;
		While not CountersSet.EOF do
		 Begin
			//DBGridEh1CellMouseClick(Col);
		  DBGridEh1CellClick(Col); 
		  Main.Transfer;
		  CountersSet.Next;
			
		  PB.IncPartsByOne;
		 End;
	End;
//Main.ODSTochka.EnableControls;
except
 ShowMessage('Это неправильно');
end;
 Main.StructureTreeCur.Refresh;
end;

procedure TSearchForm.FormShow(Sender: TObject);
begin
 AddressEdit.SetFocus;
end;

procedure TSearchForm.HouseEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=$D then 
  SearchButt.Click;
end;

procedure TSearchForm.AddressEditChange(Sender: TObject);
begin
 If AddressEdit.Text<>'' then 
  HouseEdit.Enabled:=true
 else 
  Begin
	HouseEdit.Enabled:=false;
   HouseEdit.Text:='';
  End;
end;

procedure TSearchForm.FindSimButtClick(Sender: TObject);
begin
 OQ.SQL.Text:='Select con_name from bqrk.con_points where phone_number='''+SimEdit.Text+'''';
 OQ.Execute;
 
 If OQ.RowCount<>0 then
  SimLabel.Caption:='ТП '+OQ.Field('con_name')
 else
  SimLabel.Caption:='X';

end;

end.
																						
