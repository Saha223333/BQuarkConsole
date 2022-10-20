unit u_main;
				
interface
	
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzLstBox,
  RzDBList, RzLabel, RzButton, ComCtrls, RzTreeVw, RzTabs, DB,
  DBCtrls, GridsEh, DBGridEh, DBCtrlsEh, ImgList,
  ExtCtrls, RzDBNav, Oracle, OracleData, RzRadChk, Grids, DBGrids,
  RzShellDialogs, RzPanel, RzSplit, Menus, RzPrgres, RzStatus, AxCtrls,
  OleCtrls, VCF1, OleServer, ExcelXP, ADODB, Buttons, IWControl, IWExtCtrls,
  RzLaunch,DateUtils, RzRadGrp, ExtDlgs, DBTables, JPEG, ActnList, frxDock,
  RzFilSys, RzBorder, FileCtrl, RzSpnEdt, RzTrkBar, Unit2, RXShell;
  
type
  TMain = class(TForm)
	 generation_tab: TRzPageControl;
	 TabSheet1: TRzTabSheet;
	 TabSheet2: TRzTabSheet;
	 StructureTreeCur: TRzTreeView;
	 RzLabel3: TRzLabel;
	 DSTochka: TDataSource;
	 RzPageControl1: TRzPageControl;
	 TabSheet4: TRzTabSheet;
	 TabSheet3: TRzTabSheet;
	 AddNodeButt: TRzBitBtn;
	 NodeProps: TDBGridEh;
	 NodeTypeList: TRzDBLookupComboBox;
	 ObjectsDS: TDataSource;
	 RzLabel1: TRzLabel;
	 RzLabel2: TRzLabel;
	 NameEdit: TRzEdit;
	 RzLabel4: TRzLabel;
	 ImageList: TImageList;
	 StreetDS: TDataSource;
	 RzLabel6: TRzLabel;
	 SerNumEdit: TRzEdit;
	 RzLabel7: TRzLabel;
	 AddressEdit: TRzEdit;
	 RzLabel8: TRzLabel;
	 DomEdit: TRzEdit;
	 RzLabel9: TRzLabel;
	 IstPitEdit: TRzDBLookupComboBox;
	 RzLabel10: TRzLabel;
	 DSIstPit: TDataSource;
	 AddValsList: TDBGridEh;
	 RzLabel11: TRzLabel;
	 DSAddFields: TDataSource;
	 RzDBNavigator1: TRzDBNavigator;
	 DSProps: TDataSource;
	 DSPropVals: TDataSource;
	 ODSObjects: TOracleDataSet;
	 OS: TOracleSession;
	 ODSTochka: TOracleDataSet;
	 ODSStreet: TOracleDataSet;
	 SeqODS: TOracleDataSet;
	 ODSIstPit: TOracleDataSet;
	 ODSAddFieldsSprav: TOracleDataSet;
	 ODSPropVals: TOracleDataSet;
	 ODSProps: TOracleDataSet;
	 Qry: TOracleQuery;
	 ODSAddFieldsSpravID_NODE: TIntegerField;
	 ODSAddFieldsSpravID_PROP: TIntegerField;
	 ODSAddFieldsSpravID_OBJECT: TIntegerField;
	 ODSAddFieldsSpravpropname: TStringField;
	 ODSAddFieldsSpravpropvals: TStringField;
	 ODSCons: TOracleDataSet;
	 ODSConcentrators: TOracleDataSet;
	 ODSCounters: TOracleDataSet;
	 ODSCountersID_COUNTER: TIntegerField;
	 ODSCountersID_CONCENTRATOR: TIntegerField;
	 ODSCountersID_CON: TIntegerField;
	 ODSCountersCOUNTER_NAME: TStringField;
	 ODSCountersDOM: TStringField;
	 ODSCountersFLAT: TStringField;
	 ODSCountersSERIAL_NUMBER: TStringField;
	 ODSCountersCOMMENTS: TStringField;
	 ODSAddObjs: TOracleDataSet;
	 TabSheet5: TRzTabSheet;
	 WorkFileMemo: TRzRichEdit;
	 PhoneEdit: TRzEdit;
	 IPEdit: TRzEdit;
	 PortEdit: TRzEdit;
	 RzLabel13: TRzLabel;
	 RzLabel14: TRzLabel;
	 RzLabel15: TRzLabel;
	 ODSAddFlds: TOracleDataSet;
	 ODSAddFieldsSpravNAME: TStringField;
	 SD: TSaveDialog;
	 RzSizePanel1: TRzSizePanel;
	 StructureTree: TRzTreeView;
	 RzLabel12: TRzLabel;
	 RzTabSheet1: TRzTabSheet;
	 RzLabel22: TRzLabel;
	 RzLabel23: TRzLabel;
	 RzTreeView2: TRzTreeView;
	 RzPageControl2: TRzPageControl;
	 RzTabSheet2: TRzTabSheet;
	 RzLabel24: TRzLabel;
	 RzLabel25: TRzLabel;
	 RzLabel26: TRzLabel;
	 RzLabel27: TRzLabel;
	 RzLabel28: TRzLabel;
	 RzLabel29: TRzLabel;
	 RzLabel30: TRzLabel;
	 RzLabel31: TRzLabel;
	 RzLabel32: TRzLabel;
	 RzLabel33: TRzLabel;
	 RzBitBtn1: TRzBitBtn;
	 RzDBLookupComboBox1: TRzDBLookupComboBox;
	 RzEdit1: TRzEdit;
	 RzDBLookupComboBox2: TRzDBLookupComboBox;
	 RzEdit2: TRzEdit;
	 RzEdit3: TRzEdit;
	 RzEdit4: TRzEdit;
	 RzDBLookupComboBox3: TRzDBLookupComboBox;
	 RzBitBtn2: TRzBitBtn;
	 RzBitBtn3: TRzBitBtn;
	 RzEdit5: TRzEdit;
	 RzEdit6: TRzEdit;
	 RzEdit7: TRzEdit;
	 RzTabSheet3: TRzTabSheet;
	 RzLabel34: TRzLabel;
	 RzLabel35: TRzLabel;
	 DBGridEh1: TDBGridEh;
	 DBGridEh2: TDBGridEh;
	 RzDBNavigator3: TRzDBNavigator;
	 RzCheckBox2: TRzCheckBox;
	 RzBitBtn4: TRzBitBtn;
	 RzBitBtn5: TRzBitBtn;
	 rzdbnvgtr1: TRzDBNavigator;
	 ODSConsID_IST: TIntegerField;
	 ODSConsID_CON: TIntegerField;
	 ODSConsCON_NAME: TStringField;
	 ODSConsPHONE_NUMBER: TStringField;
	 ODSConsIP_ADDRESS: TStringField;
	 ODSConsPORT_NUM: TStringField;
	 ODSConsDOM: TStringField;
	 ODSConcentratorsID_CON: TIntegerField;
	 ODSConcentratorsID_CONCENTRATOR: TIntegerField;
	 ODSConcentratorsCOMMENTS: TStringField;
	 ODSCountersTYPE_ID: TIntegerField;
	 ODSCountersCOUNTER_ADDRESS: TIntegerField;
	 ODSConsCON_TYPE: TStringField;
	 ODSAddFldsID_NODE: TIntegerField;
	 ODSAddFldsID_PROP: TIntegerField;
	 ODSAddFldsID_OBJECT: TIntegerField;
	 ODSAddFldsVALUE: TStringField;
	 ODSAddObjsID_ADDOBJ: TIntegerField;
	 ODSAddObjsID_PARENT: TIntegerField;
	 ODSAddObjsID_OBJECT: TIntegerField;
	 ODSAddFieldsSpravVALUE: TStringField;
	 ODSConcentratorsCONCENTRATOR_ADDRESS: TStringField;
	 ODSConcentratorsTYPE: TStringField;
	 ODSConcentratorsNAME_CONCENTRATOR: TStringField;
	 ODSAddFldsNAME: TStringField;
	 ODSAddFldsVALUE2: TStringField;
	 ODSAddFieldsSpravVALUE2: TStringField;
	 PopupMenu1: TPopupMenu;
	 N1: TMenuItem;
	 PopupMenu2: TPopupMenu;
	 N2: TMenuItem;
	 N3: TMenuItem;
	 RzDBRichEdit1: TRzDBRichEdit;
	 StatusStr: TRzStatusPane;
	 SearchCounter: TRzEdit;
	 RzBitBtn7: TRzBitBtn;
	 GenObjButt: TRzBitBtn;
	 RzPanel1: TRzPanel;
	 RzLabel21: TRzLabel;
	 InterfaceGrid: TDBGridEh;
	 RzDBNavigator2: TRzDBNavigator;
	 ODSInterface: TOracleDataSet;
	 DSInterface: TDataSource;
	 GenIntButt: TRzBitBtn;
	 RzGroupBox1: TRzGroupBox;
	 OVed: TRzEdit;
	 TTSHed: TRzEdit;
	 NDFNed: TRzEdit;
	 TLed: TRzEdit;
	 RzLabel5: TRzLabel;
	 RzLabel16: TRzLabel;
	 RzLabel17: TRzLabel;
	 RzLabel18: TRzLabel;
	 ODSInterfaceID_INTERFACE: TIntegerField;
	 ODSInterfaceNUM_ROW: TIntegerField;
	 ODSInterfaceID_SCHEDULE: TIntegerField;
	 ODSInterfaceCOL_TITLE: TStringField;
	 ODSInterfaceWIDTH: TIntegerField;
	 ODSInterfaceVAL: TStringField;
	 ODSInterfaceALIGN: TStringField;
	 ODSInterfaceFILTR: TStringField;
	 ODSInterfaceMON: TIntegerField;
	 ODSInterfaceGOD: TIntegerField;
	 ODSInterfacePREC: TIntegerField;
	 ODSInterfaceGRUP: TStringField;
	 ODSInterfacePERCENT: TStringField;
	 ODSCountersSTREET: TStringField;
	 ODSPropsID_PROP: TIntegerField;
	 ODSPropsID_OBJECT: TIntegerField;
	 ODSPropsNAME_PROP: TStringField;
	 RzBitBtn8: TRzBitBtn;
	 ODSConsSTREET: TStringField;
	 ODSConsIST_PIT: TStringField;
	 TabSheet6: TRzTabSheet;
	 OD: TOpenDialog;
	 RzBitBtn9: TRzBitBtn;
	 RzDBNavigator4: TRzDBNavigator;
	 RzBitBtn10: TRzBitBtn;
	 RE: TRzRichEdit;
	 ODSpokaz_temp: TOracleDataSet;
	 DSpokaz_temp: TDataSource;
	 DBGridEh3: TDBGridEh;
	 RichErrors: TRzRichEdit;
	 Label4: TLabel;
	 RzBitBtn11: TRzBitBtn;
	 MainMenu1: TMainMenu;
	 InStar1: TMenuItem;
	 N9: TMenuItem;
	 ComboList: TRzComboBox;
	 RzBitBtn12: TRzBitBtn;
	 RzToolbar1: TRzToolbar;
	 transferbutt: TRzToolbarButton;
    CollapseButt: TRzToolbarButton;
	 RzToolbar2: TRzToolbar;
	 RzToolbarButton5: TRzToolbarButton;
	 RzToolbarButton6: TRzToolbarButton;
	 ODSAddFieldsSpravID_FIELD: TIntegerField;
	 OP: TOraclePackage;
	 ODSConsCnt: TOracleDataSet;
	 ODSConcentratorsCnt: TOracleDataSet;
	 ODSCountersCnt: TOracleDataSet;
	 Launcher: TRzLauncher;
	 N4: TMenuItem;
	 RzCheckBox1: TRzCheckBox;
	 RzCheckBox3: TRzCheckBox;
	 RzBitBtn6: TRzBitBtn;
	 PB: TRzProgressBar;
	 RzBitBtn13: TRzBitBtn;
	 ODSErrors_temp: TOracleDataSet;
	 DBGridEh4: TDBGridEh;
	 DSErrors_temp: TDataSource;
	 ODSErrors_tempSERIAL_NUMBER: TStringField;
	 ODSErrors_tempCOUNTER_NAME: TStringField;
	 ODSErrors_tempERROR_TEXT: TStringField;
	 ODSErrors_tempWDATE: TDateTimeField;
	 Label6: TLabel;
	 Label7: TLabel;
	 Label8: TLabel;
	 ODSAddFldsList: TOracleDataSet;
	 ODSIstPitID_IST: TIntegerField;
	 ODSIstPitTP: TStringField;
	 ODSIstPitCOMMENTS: TStringField;
	 N5: TMenuItem;
	 RzLabel19: TRzLabel;
	 RzLabel20: TRzLabel;
	 RzLabel37: TRzLabel;
	 Label9: TLabel;
	 RzBitBtn15: TRzBitBtn;
    ShowLastLogButt: TRzBitBtn;
	 ODSConsCntCNT: TFloatField;
	 ODSConcentratorsCntCNT: TFloatField;
	 ODSCountersCntCNT: TFloatField;
	 ErrorsDetailG: TDBGridEh;
	 ODSErrorsDetail: TOracleDataSet;
	 DSErrorsDetail: TDataSource;
	 ODSPokazTempDetail: TOracleDataSet;
	 DSPokazTempDetail: TDataSource;
	 PokazTempDetialGrid: TDBGridEh;
	 StreetEdit: TRzEdit;
	 opros10001: TMenuItem;
	 opros10002: TMenuItem;
	 opros10003: TMenuItem;
	 AutoAnalizerMemo: TRzRichEdit;
	 N100020041: TMenuItem;
	 Jghjc1: TMenuItem;
	 ODSErrorsDetailLAST_POK: TFloatField;
	 ODSErrorsDetailDATE_LAST_POK: TDateTimeField;
	 ODSPokazTempDetailTEHN_ADDRESS: TWideStringField;
	 ODSPokazTempDetailLAST_POK: TFloatField;
	 ODSPokazTempDetailDATE_LAST_POK: TDateTimeField;
	 ODSErrorsDetailID_CONCENTRATOR: TStringField;
	 ODSPokazTempDetailID_CONCENTRATOR: TStringField;
	 ODSObjectsID_OBJECT: TIntegerField;
	 ODSObjectsNAME_OBJ: TStringField;
	 ODSObjectsCOMMENTS: TStringField;
	 ODSObjectsSHORT_NAME: TStringField;
	 N7: TMenuItem;
	 N8: TMenuItem;
	 N12: TMenuItem;
	 N10: TMenuItem;
	 ODSConsDIST: TStringField;
	 ODSCountersDIST: TStringField;
    RefreshButt: TRzToolbarButton;
	 OPD: TOpenPictureDialog;
	 Foto: TRzTabSheet;
	 SPD: TSavePictureDialog;
	 SaveBLOB: TRzBitBtn;
	 ODSAddObjsVALUE2: TStringField;
	 ODSAddObjsNAME: TStringField;
	 ODSErrorsDetailLAST_CONC: TStringField;
    ReDialButt: TRzBitBtn;
	 qwerty: TMenuItem;
	 N11: TMenuItem;
	 ODSErrorsDetailSTREET: TStringField;
	 ODSErrorsDetailDOM: TStringField;
	 ODSErrorsDetailCOUNTER_ADDRESS: TIntegerField;
	 N2007: TMenuItem;
	 ODSCountersACTUAL: TFloatField;
	 RzBitBtn18: TRzBitBtn;
	 Label1: TLabel;
	 DeleteAllExcept: TMenuItem;
	 CopyCB: TRzCheckBox;
	 ActionList1: TActionList;
	 DeleteFromSchedule: TAction;
	 ClearTask: TAction;
	 DeleteAllExceptOneAct: TAction;
	 QuickDialAct: TAction;
	 TransferAct: TAction;
	 SearchFormShowAct: TAction;
	 CBDextActivate: TAction;
	 OpenAfterDialCB: TRzCheckBox;
    OpenLogNotepad: TRzBitBtn;
	 Launcher2: TRzLauncher;
	 RzGroupBox2: TRzGroupBox;
	 CBFlag: TRzCheckBox;
	 RGType: TRzRadioGroup;
	 PrecCB: TRzCheckBox;
	 CBDext: TRzCheckBox;
	 OpenExcel: TRzBitBtn;
	 AdditionalODS: TOracleDataSet;
    RzLabel36: TRzLabel;
    Qry2: TOracleQuery;
    N13: TMenuItem;
    GPRS1: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Qry3: TOracleQuery;
    N1231: TMenuItem;
    RzLabel39: TRzLabel;
    CloneEdit: TRzEdit;
    NameSched: TRzLabel;
    DistFilter: TRzEdit;
    NameFilter: TRzEdit;
    RzLabel40: TRzLabel;
    RzLabel41: TRzLabel;
    StatusList: TOracleDataSet;
    ODSStatus: TOracleDataSet;
    ODSStatusID_STATUS: TIntegerField;
    ODSStatusNAME_STATUS: TWideStringField;
    StatusGrid: TDBGridEh;
    DSStatus: TDataSource;
    StatusListID_STATUS: TIntegerField;
    StatusListNAME_STATUS: TWideStringField;
    TrackBar: TRzTrackBar;
    ErrorAnalyzeTab: TRzTabSheet;
    ErrorGrid: TDBGridEh;
    ErrorNav: TRzDBNavigator;
    DSErrorsAnal: TDataSource;
    ODSErrorAnal: TOracleDataSet;
    ndate: TRzDateTimeEdit;
    kdate: TRzDateTimeEdit;
    RzLabel42: TRzLabel;
    RzLabel43: TRzLabel;
    ODSErrorAnalSERIAL_NUMBER: TStringField;
    ODSErrorAnalCOUNTER_NAME: TStringField;
    ODSErrorAnalERROR_TEXT: TStringField;
    ODSErrorAnalWDATE: TDateTimeField;
    ODSErrorAnalSUMM: TStringField;
    ErrorsCount: TLabel;
    AnalButt: TRzBitBtn;
    ErrorsAnalQry: TOracleQuery;
    TrayIcon: TRxTrayIcon;
    RGGateType: TRzRadioGroup;
    AnalizeLogButt: TRzBitBtn;
    LogAnalizeMemo: TRzRichEdit;
    LogAnalizeLabel: TRzLabel;
    NumberDaysEdit: TRzNumericEdit;
    ODSpokaz_tempID_COUNTER: TIntegerField;
    ODSpokaz_tempID_CONCENTRATOR: TIntegerField;
    ODSpokaz_tempID_CON: TIntegerField;
    ODSpokaz_tempDATE_POK: TDateTimeField;
    ODSpokaz_tempTARIF1: TFloatField;
    ODSpokaz_tempTARIF2: TFloatField;
    ODSpokaz_tempTARIF3: TFloatField;
    ODSpokaz_tempTARIF4: TFloatField;
    ODSpokaz_tempTARIF5: TFloatField;
    ODSpokaz_tempSUMM: TFloatField;
    ODSpokaz_tempCOMMENTS: TStringField;
    ODSpokaz_tempSERIAL_NUMBER: TStringField;
    ODSpokaz_tempRASHOD: TFloatField;
    ODSpokaz_tempFNP: TFloatField;
    ODSpokaz_tempDELTA_DAYS: TFloatField;
    ODSpokaz_tempCOUNTER_NAME: TStringField;
    ODSpokaz_tempSTREET: TStringField;
    ODSpokaz_tempDOM: TStringField;
    ODSpokaz_tempCOUNTER_ADDRESS: TIntegerField;
    ODSpokaz_tempCONCENTRATOR_ADDRESS: TStringField;
    ReDialsQtyEdit: TRzNumericEdit;
    PokazLoadedLabel: TRzLabel;
    AutoLoadCB: TRzCheckBox;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Bevel1: TBevel;
    Image1: TImage;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    SaveImageToFileButt: TRzBitBtn;
    Button1: TButton;
    RzBitBtn14: TRzBitBtn;
    Bevel7: TBevel;
    Image7: TImage;
    Bevel8: TBevel;
    Image8: TImage;
	 procedure AddNodeButtClick(Sender: TObject);
	 procedure NodeTypeListCloseUp(Sender: TObject);
	 procedure StructureTreeCurChange(Sender: TObject; Node: TTreeNode);
	 procedure FormShow(Sender: TObject);
	 procedure FormClose(Sender: TObject; var Action: TCloseAction);
	 procedure ODSAddFieldsSpravBeforePost(DataSet: TDataSet);
	 procedure LoadWholeTree;
	 procedure GenObjButtClick(Sender: TObject);
	 procedure LoadButtClick(Sender: TObject);
	 procedure StructureTreeCurGetSelectedIndex(Sender: TObject;
		Node: TTreeNode);
	 procedure NewSchedule(Overwrite:boolean; SchedName:string);
	 procedure StructureTreeGetSelectedIndex(Sender: TObject; Node: TTreeNode);
	 procedure ChangeNode(Tree:TRzTreeView);
	 procedure StructureTreeChange(Sender: TObject; Node: TTreeNode);
	 procedure Delete(Tree:TRzTreeView);
	 procedure N2Click(Sender: TObject);
	 procedure Search(Tree:TRzTreeView);
	 procedure RzBitBtn7Click(Sender: TObject);
	 procedure ODSInterfaceAfterInsert(DataSet: TDataSet);
	 procedure ODSInterfaceAfterOpen(DataSet: TDataSet);
	 procedure GenIntButtClick(Sender: TObject);
	 procedure RzBitBtn8Click(Sender: TObject);
	 procedure StructureTreeCurClick(Sender: TObject);
	 procedure StructureTreeClick(Sender: TObject);
	 procedure InterfacegridColumns5UpdateData(Sender: TObject;
					var Text: String; var Value: Variant; var UseText, Handled: Boolean);
	 procedure RzBitBtn9Click(Sender: TObject);
	 procedure RzBitBtn10Click(Sender: TObject);
	 procedure FormCreate(Sender: TObject);
	 procedure FormDestroy(Sender: TObject);
	 procedure PokazToDataBase;
	 procedure RzBitBtn11Click(Sender: TObject);
	 procedure InStar1Click(Sender: TObject);
	 procedure RzBitBtn13Click(Sender: TObject);
	 procedure Transfer;
	 procedure RefreshButtClick(Sender: TObject);
	 procedure CollapseButtClick(Sender: TObject);
	 procedure RzToolbarButton3Click(Sender: TObject);
	 procedure ExpandTree(Tree:TRzTreeView);
	 procedure CollapseTree(Tree:TRzTreeView);
	 procedure RzToolbarButton4Click(Sender: TObject);
	 procedure RzToolbarButton7Click(Sender: TObject);
	 procedure RzToolbarButton5Click(Sender: TObject);
	 procedure RzToolbarButton6Click(Sender: TObject);
	 procedure TrimWorkingSet;
	 procedure QuickDial(To1000:boolean);
	 procedure RzBitBtn6Click(Sender: TObject);
	 procedure OpenFile(FTL:string;QDF:boolean);
	 procedure LauncherFinished(Sender: TObject);
	 procedure RzSizePanel1HotSpotClick(Sender: TObject);
	 procedure N5Click(Sender: TObject);
	 procedure testClick(Sender: TObject);
	 procedure FixNUpdate(Serial:string; CurrentPokaz,LastPokaz:real; 
					var ResultPokaz,Rashod:real);
	 procedure RzBitBtn15Click(Sender: TObject);

	 procedure StructureTreeDragDrop(Sender, Source: TObject; X,
		Y: Integer);
	 procedure MoveNode(TargetNode, SourceNode: TTreeNode; TargetConcAddr:Integer);
	 procedure MoveNodeCur(TargetNode, SourceNode: TTreeNode);
	 procedure StructureTreeDragOver(Sender, Source: TObject; X, Y: Integer;
		State: TDragState; var Accept: Boolean);
	 procedure StructureTreeCurDragDrop(Sender, Source: TObject; X,
		Y: Integer);
	 procedure StructureTreeCurDragOver(Sender, Source: TObject; X,
		Y: Integer; State: TDragState; var Accept: Boolean);
	 procedure ODSTochkaAfterPost(DataSet: TDataSet);
	 procedure StructureTreeCurNodeContextMenu(aSender: TObject;
		aNode: TTreeNode; var aPos: TPoint; var aMenu: TPopupMenu);
	 procedure opros10001Click(Sender: TObject);
	 procedure opros10002Click(Sender: TObject);
	 procedure opros10003Click(Sender: TObject);
	 procedure N100020041Click(Sender: TObject);
	 procedure Jghjc1Click(Sender: TObject);
	 procedure StructureTreeDblClick(Sender: TObject);
	 procedure N7Click(Sender: TObject);
	 procedure N8Click(Sender: TObject);
	 procedure N12Click(Sender: TObject);
	 procedure PopupMenu2Popup(Sender: TObject);
	 procedure PopupMenu1Popup(Sender: TObject);
	 procedure StructureTreeNodeContextMenu(aSender: TObject;
		aNode: TTreeNode; var aPos: TPoint; var aMenu: TPopupMenu);
	 procedure N9Click(Sender: TObject);
	 procedure N10Click(Sender: TObject);
	 procedure BitBtn1Click(Sender: TObject);
	 procedure ShowLastLogButtClick(Sender: TObject);
	 procedure ReDialButtClick(Sender: TObject);
	 procedure LoadLog(var Success:boolean;Regular:boolean);
	 procedure qwertyClick(Sender: TObject);
	 procedure N11Click(Sender: TObject);
	 procedure N2007Click(Sender: TObject);
	 procedure RzBitBtn18Click(Sender: TObject);
	 procedure secondClick(Sender: TObject);
	 procedure firstClick(Sender: TObject);
	 procedure DeleteAllExceptOne;
	 procedure DeleteFromScheduleExecute(Sender: TObject);
	 procedure ClearTaskExecute(Sender: TObject);
	 procedure DeleteAllExceptOneActExecute(Sender: TObject);
	 procedure QuickDialActExecute(Sender: TObject);
	 procedure TransferActExecute(Sender: TObject);
	 procedure SearchFormShowActExecute(Sender: TObject);
	 procedure CBDextActivateExecute(Sender: TObject);
	 procedure generation_tabChange(Sender: TObject);
	 procedure FormResize(Sender: TObject);
	 procedure OpenLogNotepadClick(Sender: TObject);
	 procedure OpenExcelClick(Sender: TObject);
	 procedure ODSTochkaBeforePost(DataSet: TDataSet);
    procedure ODSTochkaBeforeEdit(DataSet: TDataSet);
    procedure N13Click(Sender: TObject);
    procedure ODSAddFieldsSpravpropnameChange(Sender: TField);
    procedure GPRS1Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
	 procedure N15Click(Sender: TObject);
	 procedure N1231Click(Sender: TObject);
	 procedure CopyNodeAuto2;
	 procedure OnOffConstraints(State:integer);
	 procedure CopyCounterInfo(IdTarget,IdSource:integer);
	 procedure OprosConcentrators (NomConc: integer);
    procedure DistFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NameFilterKeyDown(Sender: TObject; var Key: Word;
		Shift: TShiftState);
	 procedure ShowMeTheImage(img: TImage; imgNo: string);
    procedure TrackBarChanging(Sender: TObject; NewPos: Integer;
      var AllowChange: Boolean);
    procedure ODSErrorAnalBeforeRefresh(DataSet: TDataSet);
    procedure ODSErrorAnalBeforeOpen(DataSet: TDataSet);
    procedure AnalButtClick(Sender: TObject);
    procedure ODSErrorAnalAfterRefresh(DataSet: TDataSet);
    procedure TimerTimer(Sender: TObject);
    procedure ApplicationMinimize(Sender : TObject);
    procedure TrayIconClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
	 procedure AnalizeLogButtClick(Sender: TObject);
	 procedure ReDial(CurrentEdit:TRZRichEdit);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
	 procedure SaveImageToOracle(imgNo: string);
    procedure SaveBLOBClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
	 procedure SaveImageToFile(img: TImage);
    procedure SaveImageToFileButtClick(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure Image3DblClick(Sender: TObject);
    procedure Image4DblClick(Sender: TObject);
    procedure Image5DblClick(Sender: TObject);
    procedure Image6DblClick(Sender: TObject);
	 procedure SaveImageToOracle2;
	 procedure LoadImagesFormOracle;
    procedure Button1Click(Sender: TObject);
	 procedure CopyCountersFromTaskFile;
    procedure RzBitBtn14Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image7DblClick(Sender: TObject);
    procedure Image8DblClick(Sender: TObject);

  private
	 { Private declarations }
  public
	IdSchToWW,GloSchedID,kol_osh:integer;
	FocusedTree:TRzTreeView;
	
	 { Public declarations }
  end;


var
  Main: TMain;
  StatList:TLookUpList;
  SeqConnVal,SeqConcVal,SeqCounterVal,
					InterfaceID,SeqAddObjVal,ParentNode,SeqSchedVal:integer;
  Query,Opros1000Number:string;
  SelectedImageBoxNo:string;
  SelectedImageBox: TImage;

  ForMN_CGH_LOGid_counter,ForMN_CGH_LOGcounter_name,ForMN_CGH_LOGstreet,
  ForMN_CGH_LOGdom,ForMN_CGH_LOGserial_number,ForMN_CGH_LOGcounter_address,
  ForMN_CGH_LOGlast_pok,ForMN_CGH_LOGdate_last_pok,ForMN_CGH_LOGlast_pokt1,
  ForMN_CGH_LOGlast_pokt2,ForMN_CGH_LOGlast_pokt3,ForMN_CGH_LOGlast_pokt4:string;
	
  
const
 bquark_vers:string='BQuark.3.0.exe';
  
  type                            
  PNodeItemRec = ^NodeItemRec;

	NodeItemRec = record
	ID_Node:integer;
	ID_Parent:integer;
	Object_id:integer;
  end;
  //список полей
  TSL=TStrings;
  //список ист.пит.
  IPL=TStrings;
  //дата посл.пок.
  LPD=TDate;

implementation

uses u_loadsch,u_util,u_transfer,QStrings, u_reports,u_loginfrom, u_search,
  ReadMe, u_stats, u_photo;

var
PropList:TSL;
IstList:IPL;
TimeStamp,FileToExcel:string;
Save_Cursor:TCursor;

{$R *.dfm}
{$DEBUGINFO ON} 
{$WARN SYMBOL_DEPRECATED OFF}

procedure TMain.ShowMeTheImage(img: TImage; imgNo: string);
var
Blob: TStream; 
pic:TPicture;
Code:Word;

Begin
 //вытаскиваем сохраненную картинку

//грузим картинку в потом
if imgNo = '0' then imgNo := '';
 Blob := ODSTochka.CreateBlobStream(ODSTochka.FieldByName('PIC'+imgNo), bmRead);
//если нет картинки и поток пуст то ничего не рисуем
 if Blob.Size=0 then 
  begin
	img.Picture.Graphic:=nil;
	Exit;
  end;

  try 
	 BLOB.Read(Code,SizeOf(Code)); BLOB.Seek(0,0);
case Code of 
$4D42: begin
 img.Picture.Graphic:=TBitmap.Create; 
 img.Picture.Graphic.LoadFromStream(BLOB); 
end; 
 $D8FF: 
begin 
 img.Picture.Graphic:=TJPEGImage.Create; 
 img.Picture.Graphic.LoadFromStream(BLOB); 
end;

end;
 finally
  Blob.free;
end;

End;

procedure TMain.LoadWholeTree;
var
 N1,NewNode,RootConNode,RootConcentratorNode,RootCounterNode:TTreeNode;
 ObjType,i,j,k,m,is_can:integer;
 NodeRec:NodeItemRec;
 NodePtr:PNodeItemRec;
 NodeName:string; 
Begin
Save_Cursor := Screen.Cursor;
Screen.Cursor := crHourGlass;

StructureTree.Selected:=nil; StructureTree.Items.Clear;

If ODSCons.Active=true then ODSCons.Close;

If DistFilter.Text='' then
 ODSCons.SetVariable('dist','%')
else
 ODSCons.SetVariable('dist','%'+DistFilter.Text+'%');

If NameFilter.Text='' then
 ODSCons.SetVariable('name','%')
else
 ODSCons.SetVariable('name','%'+NameFilter.Text+'%');

ODSCons.Open;

ODSCons.Refresh;
ODSConcentrators.Refresh;
ODSCounters.Refresh;

PB.PartsComplete:=0;
PB.TotalParts:=ODSCountersCnt.FieldByName('cnt').AsInteger;	
	
ODSCons.First;
 //шлюзы
 For i:=0 to ODSCons.RecordCount-1 do
  Begin
	NodePtr:=@NodeRec; New(NodePtr);
	NodePtr^.ID_Node:=ODSCons.FieldByName('id_con').asInteger; NodePtr^.ID_Parent:=0;
	NodePtr^.Object_id:=ODSCons.FieldByName('con_type').asInteger;
	NewNode:=StructureTree.Items.AddChildObject(nil,ODSCons.FieldByName
													 ('con_name').asString+'\'+
		ODSCons.FieldByName('dist').asString,NodePtr);

	NewNode.ImageIndex:=LoadSchedForm.SelectImageForNode(PNodeItemRec(NewNode.Data)^.Object_id);
	RootConNode:=NewNode;
	ODSConcentrators.Close;
	ODSConcentrators.SetVariable('id_con',ODSCons.FieldByName('id_con').asInteger);
	ODSConcentrators.Open; ODSConcentrators.First;
	  //концентраторы
	 For j:=0 to ODSConcentrators.RecordCount-1 do
	  Begin
		NodePtr:=@NodeRec; New(NodePtr);
		NodePtr^.ID_Node:=ODSConcentrators.FieldByName('id_concentrator').asInteger;
		NodePtr^.ID_Parent:=PNodeItemRec(RootConNode.Data)^.ID_Node;
		NodePtr^.Object_id:=ODSConcentrators.FieldByName('type').asInteger;;
		NewNode:=StructureTree.Items.AddChildObject
					 (RootConNode,ODSConcentrators.FieldByName('concentrator_address').asString,NodePtr);
		RootConcentratorNode:=NewNode; 
		NewNode.ImageIndex:=LoadSchedForm.SelectImageForNode(PNodeItemRec(NewNode.Data)^.Object_id);
		ODSCounters.Close;
		ODSCounters.SetVariable('id_con',ODSConcentrators.FieldByName('id_con').asInteger);
		ODSCounters.SetVariable('id_concentrator',ODSConcentrators.FieldByName('id_concentrator').asInteger);

		ODSCounters.Open; ODSCounters.First;
		//счетчики
		 For k:=0 to ODSCounters.RecordCount-1 do
		  Begin
			NodePtr:=@NodeRec; New(NodePtr);
			NodePtr^.ID_Node:=ODSCounters.FieldByName('id_counter').asInteger;
			NodePtr^.ID_Parent:=PNodeItemRec(RootConcentratorNode.Data)^.ID_Node;
			NodePtr^.Object_id:=2003;

			NodeName:=ODSCounters.FieldByName('street').asString+' '+
			ODSCounters.FieldByName('dom').asString+' ('
			+ODSCounters.FieldByName('counter_address').asString+')';

			NewNode:=StructureTree.Items.AddChildObject(RootConcentratorNode,
						ODSCounters.FieldByName('street').asString+' '+
			ODSCounters.FieldByName('dom').asString+' ('
			+ODSCounters.FieldByName('counter_address').asString+')',NodePtr);

			NewNode.ImageIndex:=LoadSchedForm.SelectImageForNode(PNodeItemRec(NewNode.Data)^.Object_id);
			RootCounterNode:=NewNode;
			ODSCounters.Next; 
			pb.IncPartsByOne; m:=pb.PartsComplete; 
			re.Lines.add(inttostr(m)+' '+inttostr(pb.Percent));
		  End;
		  ODSConcentrators.Next;
	  End;
	ODSCons.Next;
  End;

  For i:=0 to StructureTree.Items.Count-1 do
	Begin
	 N1:=StructureTree.Items.Item[i];
	  Query:='Select a.*,b.* from bqrk.AddObjects a,bqrk.Addfields b where a.id_parent='
				+IntToStr(PNodeItemRec(N1.Data)^.Id_node)+ ' and a.id_addobj=b.id_node';
	  ODSAddObjs.Close; ODSAddObjs.SQL.Clear;
	  ODSAddObjs.SQL.Add(Query); ODSAddObjs.Open;
		If ODSAddObjs.RecordCount>0 then
		 Begin
		  ODSAddObjs.First;	
			While not ODSAddObjs.Eof do
			 Begin
			  NodePtr:=@NodeRec; New(NodePtr);
			  NodePtr^.ID_Node:=ODSAddObjs.FieldByName('id_addobj').asInteger;
			  NodePtr^.ID_Parent:=ODSAddObjs.FieldByName('id_parent').asInteger;
			  NodePtr^.Object_id:=ODSAddObjs.FieldByName('id_object').asInteger;
			  NewNode:=StructureTree.Items.AddChildObjectFirst(N1,
				 ODSAddObjs.FieldByName('value2').asString,NodePtr);
			  ObjType:=PNodeItemRec(NewNode.Data)^.Object_id;
			  NewNode.ImageIndex:=LoadSchedForm.SelectImageForNode(PNodeItemRec(NewNode.Data)^.Object_id);
			  ODSAddObjs.Next; 
			End;
		 End;
	
	End;
 RefreshCounts;
Screen.Cursor := Save_Cursor;
End;

procedure TMain.AddNodeButtClick(Sender: TObject);
var
 N1,N2,NewNode,RootNode:TTreeNode;
 SeqVal,ObjType:integer;
  NodeRec:NodeItemRec;
	NodePtr:PNodeItemRec;

begin
 If NodeTypeList.KeyValue=Null then
  Begin
	ShowMessage('Выберите тип объекта.');
	Screen.Cursor := Save_Cursor;
	Exit;
  End;

If SeqODS.Active=true then SeqODS.Close;
N1:=StructureTree.Selected;

ObjType:=NodeTypeList.KeyValue;

NodePtr:=@NodeRec;

Query:='select bqrk.GlobalNum.Nextval as Val from dual';

SeqODS.SQL.Clear; SeqODS.SQL.Text:=Query;
SeqODS.Open; SeqVal:=SeqODS.FieldByName('Val').AsInteger;

Case ObjType of
 1001,1002,1003:
		Begin
		If (NameEdit.Text='') or (StreetEdit.Text='') //or (IstPitEdit.KeyValue=null)
 then
		 Begin
		  ShowMessage('Возможно одно из полей не заполнено.'); Exit;
		 End;

		 SeqConnVal:=SeqVal; New(NodePtr);
		 NodePtr^.ID_Node:=SeqConnVal;  NodePtr^.ID_Parent:=0;
		 NodePtr^.Object_id:=ObjType;
		 NewNode:=StructureTree.Items.AddChildObject(nil,NameEdit.Text,NodePtr);
		  RootNode:=NewNode.Parent;
			If RootNode<>nil then
			  Begin
				NewNode.Delete; Dispose(NodePtr);
				ShowMessage('Неверный корневой узел'); Exit;
			  End;
		 NewNode.ImageIndex:=LoadSchedForm.SelectImageForNode(ObjType);
		 Query:='Insert into bqrk.CON_POINTS (ID_CON,CON_NAME,STREET,IST_PIT,PHONE_NUMBER,IP_ADDRESS,PORT_NUM,CON_TYPE) values ('+IntToStr(SeqConnVal)
					 +','''+NameEdit.Text+''','''+StreetEdit.Text+''','''+IstPitEdit.Text+
					 ''','''+PhoneEdit.Text+''','+''''+IPEdit.Text+''','+''''+PortEdit.Text+''','''+IntToStr(ObjType)+''')';
		
		Qry.SQL.Clear; Qry.SQL.Text:=Query; Qry.Execute;
		NewNode.Selected:=true;
		End;
 //-----------------------------------------------------------------------------
 2001,2005:
		Begin
		 If (NameEdit.Text='') or (AddressEdit.Text='') then
		 Begin
		  ShowMessage('Возможно одно из полей не заполнено.');
		  Exit;
		 End;
		  SeqConcVal:=SeqVal; New(NodePtr);
		  NodePtr^.ID_Node:=SeqConcVal; NodePtr^.ID_Parent:=PNodeItemRec(N1.Data)^.ID_Node;
		  NodePtr^.Object_id:=ObjType;
		  NewNode:=StructureTree.Items.AddChildObject(N1,NameEdit.Text,NodePtr);
			RootNode:=NewNode.Parent;
			 If RootNode=nil then
			  Begin
				NewNode.Delete; Dispose(NodePtr);
				ShowMessage('Неверный корневой узел'); Exit;
			  End else
				If (PNodeItemRec(RootNode.Data)^.Object_id <> 1001)
				 and (PNodeItemRec(RootNode.Data)^.Object_id <> 1002)
				  and (PNodeItemRec(RootNode.Data)^.Object_id <> 1003) then
					Begin
					 ShowMessage('Неверный корневой узел'); Exit;
					End;

		 NewNode.ImageIndex:=LoadSchedForm.SelectImageForNode(Objtype);
		 Query:='Insert into bqrk.CONCENTRATOR_POINTS (ID_CONCENTRATOR,ID_CON,NAME_CONCENTRATOR,CONCENTRATOR_ADDRESS,TYPE)'
		 +' values ('+IntToStr(SeqConcVal)+','+IntToStr(PNodeItemRec(N1.Data)^.ID_Node)+','''+NameEdit.Text+''','''+AddressEdit.Text+''','+IntToStr(ObjType)+')';
		
		Qry.SQL.Clear; Qry.SQL.Text:=Query; Qry.Execute;
		NewNode.Selected:=true;
		End;
  //-----------------------------------------------------------------------------
 2003:
	Begin
	  If (NameEdit.Text='') or (StreetEdit.Text='') 
//or (IstPitEdit.KeyValue=null) 
or (AddressEdit.Text='') then
		 Begin
		  ShowMessage('Возможно одно из полей не заполнено.');
		  Exit;
		 End;
		 N2:=N1.Parent;
		 SeqCounterVal:=SeqVal; New(NodePtr);
		 NodePtr^.ID_Node:=SeqCounterVal;  NodePtr^.ID_Parent:=PNodeItemRec(N1.Data)^.ID_Node;
		 NodePtr^.Object_id:=ObjType;
		 NewNode:=StructureTree.Items.AddChildObject(N1,NameEdit.Text,NodePtr);
		  RootNode:=NewNode.Parent;
			If RootNode=nil then
			  Begin
				NewNode.Delete; Dispose(NodePtr);
				ShowMessage('Неверный корневой узел'); Exit;
			  End else
				If (PNodeItemRec(RootNode.Data)^.Object_id <> 2001)
				and (PNodeItemRec(RootNode.Data)^.Object_id <> 2005) then
				 Begin
				  ShowMessage('Неверный корневой узел'); Exit;
				 End;
		NewNode.ImageIndex:=LoadSchedForm.SelectImageForNode(ObjType);
		 Query:='Insert into bqrk.COUNTERS (ID_COUNTER,ID_CONCENTRATOR,ID_CON,COUNTER_NAME,STREET,SERIAL_NUMBER,COUNTER_ADDRESS,DOM)'
		 +'values ('+IntToStr(SeqCounterVal)+','+IntToStr(PNodeItemRec(N1.Data)^.ID_Node)+','+
		  IntToStr(PNodeItemRec(N2.Data)^.ID_Node)+','''+NameEdit.Text+''','''+StreetEdit.Text+
		  ''','''+SerNumEdit.Text+''','''+AddressEdit.Text+''','''+DomEdit.Text+''')';
	
	 Qry.SQL.Clear; Qry.SQL.Text:=Query; Qry.Execute;	
	  
	 OS.Commit;
	 
	 Query:='Update bqrk.counters b set b.counter_name=(select a.con_name '+
	  'from bqrk.con_points a where b.id_con=a.id_con and a.id_con='+ IntToStr(PNodeItemRec(N2.Data)^.ID_Node)+')'
	 +' where id_counter='+IntToStr(SeqCounterVal);
	
	 Qry.SQL.Clear; Qry.SQL.Text:=Query; Qry.Execute;
	 NewNode.Selected:=true;


	End;

 2002,2004,2006..2009:
	Begin
	 If (NameEdit.Text='') then
		 Begin  ShowMessage('Возможно одно из полей не заполнено.'); Exit; End;

		 SeqAddObjVal:=SeqVal; New(NodePtr);
		 NodePtr^.ID_Node:=SeqAddObjVal; NodePtr^.Object_id:=ObjType;
		 NodePtr^.ID_Parent:=ParentNode;
		 NewNode:=StructureTree.Items.AddChildObjectFirst(N1,NameEdit.Text,NodePtr);
		 RootNode:=NewNode.Parent;
		 //проверка иерархии
		  If RootNode=nil then
			  Begin
				NewNode.Delete; Dispose(NodePtr);
				ShowMessage('Неверный корневой узел'); Exit;
			  End                        
			 else
			  Begin
				if ObjType=2002 then
				 Begin
				  If (PNodeItemRec(RootNode.Data)^.Object_id <> 2001) then
					Begin
					 NewNode.Delete; Dispose(NodePtr);
					 ShowMessage('Неверный корневой узел'); Exit;
					End 
			else 
			 NewNode.ImageIndex:=LoadSchedForm.SelectImageForNode(ObjType);
				 End;

				if ObjType=2004 then
				 Begin
				  If (PNodeItemRec(RootNode.Data)^.Object_id <> 2003) then
					Begin
					 NewNode.Delete; Dispose(NodePtr);
					 ShowMessage('Неверный корневой узел'); Exit;
					End else NewNode.ImageIndex:=4;
				 End;

			 if ObjType=2006 then
				 Begin
				  If (PNodeItemRec(RootNode.Data)^.Object_id <> 2005) then
					Begin
					 NewNode.Delete; Dispose(NodePtr);
					 ShowMessage('Неверный корневой узел'); Exit;
					End else NewNode.ImageIndex:=4;
				 End;

				if ObjType=2007 then
				 Begin
				  If (PNodeItemRec(RootNode.Data)^.Object_id <> 2005) then
					Begin
					 NewNode.Delete; Dispose(NodePtr);
					 ShowMessage('Неверный корневой узел'); Exit;
					End else NewNode.ImageIndex:=5;
				 End;

				if ObjType=2008 then
				 Begin
				  If (PNodeItemRec(RootNode.Data)^.Object_id <> 2005) then
					Begin
					 NewNode.Delete; Dispose(NodePtr);
					 ShowMessage('Неверный корневой узел'); Exit;
					End else NewNode.ImageIndex:=6;
				 End;

			 if ObjType=2009 then
				 Begin
				  If (PNodeItemRec(RootNode.Data)^.Object_id <> 2005) then
					Begin
					 NewNode.Delete; Dispose(NodePtr);
					 ShowMessage('Неверный корневой узел'); Exit;
					End else NewNode.ImageIndex:=4;
				 End;
				End; 

		 Query:='Insert into bqrk.AddObjects (ID_ADDOBJ,ID_PARENT,ID_OBJECT) '+
		 ' values ('''+IntToStr(SeqAddObjVal)+''','''+IntToStr(ParentNode)+''','''+IntToStr(ObjType)+''')';
	
		Qry.SQL.Clear; Qry.SQL.Text:=Query; Qry.Execute;
		End;
  End;

  OS.Commit;

RefreshCounts;

end;

procedure TMain.NodeTypeListCloseUp(Sender: TObject);
var
ObjType:integer;

begin

If NodeTypeList.KeyValue=null then Exit;

ObjType:=NodeTypeList.KeyValue;
  Case ObjType of
	 1001,1002,1003:
		Begin
		 StreetEdit.Visible:=true;  RzLabel6.Visible:=true;
		 SerNumEdit.Visible:=false;  RzLabel7.Visible:=false;
		 AddressEdit.Visible:=false;  RzLabel8.Visible:=false;
		 DomEdit.Visible:=false;   RzLabel9.Visible:=false;
		 IstPitEdit.Visible:=true; RzLabel10.Visible:=true;

		  If (ObjType=1001) or (ObjType=1002) then
			Begin
			 PhoneEdit.Visible:=true; RzLabel13.Visible:=true;
			 IPEdit.Visible:=false; RzLabel14.Visible:=false;
			 PortEdit.Visible:=false; RzLabel15.Visible:=false;
			End;

		  If (ObjType=1003) then
			Begin
			 PhoneEdit.Visible:=false; RzLabel13.Visible:=false;			 
			 IPEdit.Visible:=true; RzLabel14.Visible:=true;
			 PortEdit.Visible:=true; RzLabel15.Visible:=true;
			End;
		end;

	 2001,2005:
		Begin
		 SerNumEdit.Visible:=false;  RzLabel7.Visible:=false;
		 AddressEdit.Visible:=true;  RzLabel8.Visible:=true;
		 StreetEdit.Visible:=false; RzLabel6.Visible:=false;
		 DomEdit.Visible:=false; RzLabel9.Visible:=false;
		 IstPitEdit.Visible:=false; RzLabel10.Visible:=false;
		 PhoneEdit.Visible:=false; RzLabel13.Visible:=false;
		 IPEdit.Visible:=false; RzLabel14.Visible:=false;
		 PortEdit.Visible:=false;  RzLabel15.Visible:=false;
		End;

	 2003:
		Begin
		 AddressEdit.Visible:=true; RzLabel8.Visible:=true;
		 StreetEdit.Visible:=true; RzLabel6.Visible:=true;
		 SerNumEdit.Visible:=true; RzLabel7.Visible:=true;
		 DomEdit.Visible:=true; RzLabel9.Visible:=true;
		 IstPitEdit.Visible:=false; RzLabel10.Visible:=false;
		 PhoneEdit.Visible:=false; RzLabel13.Visible:=false;
		 IPEdit.Visible:=false;  RzLabel14.Visible:=false;
		 PortEdit.Visible:=false;  RzLabel15.Visible:=false;
		End;

	2002,2004,2006..2009:
		Begin
		 AddressEdit.Visible:=false; RzLabel8.Visible:=false;
		 StreetEdit.Visible:=false; RzLabel6.Visible:=false;
		 SerNumEdit.Visible:=false; RzLabel7.Visible:=false;
		 DomEdit.Visible:=false; RzLabel9.Visible:=false;
		 IstPitEdit.Visible:=false; RzLabel10.Visible:=false;
		 PhoneEdit.Visible:=false; RzLabel13.Visible:=false;
		 IPEdit.Visible:=false;  RzLabel14.Visible:=false;
		 PortEdit.Visible:=false;  RzLabel15.Visible:=false;
		End;
	End;
end;

procedure TMain.StructureTreeCurChange(Sender: TObject; Node: TTreeNode);
begin
if node=nil then 
exit; 
 ChangeNode(StructureTreeCur);
end;

procedure TMain.FormShow(Sender: TObject);
begin

if OS.Connected=true then OS.Connected:=false;
OS.LogonDatabase:=OracleString;
if OS.Connected=false then OS.Connected:=true;
//значения по умолчанию
 IstPitEdit.KeyValue:=0;

 ODSProps.Open; ODSPropVals.Open;
 ODSObjects.Open; ODSStreet.Open; 
 ODSIstPit.Open; ODSCons.Open; 
 ODSConcentrators.Open; ODSCounters.Open;
 StatusList.Open; 
 //для анализа ошибок по-умолчанию ставим текущую дату
 ndate.Date:= Date;
 ODSErrorAnal.Open; 

 LoadWholeTree;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ODSProps.Close; ODSPropVals.Close;
 ODSObjects.Close; ODSStreet.Close; 
 ODSIstPit.Close; ODSCons.Close; 
 ODSConcentrators.Close; ODSCounters.Close;
 StatusList.Close;

 Action:=caFree;

//if  GetTime>StrToTime('15:00:00') then
// if MessageDlg('Перед выходом рекомендуется сохранить общий файл задания.',
//  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
//	begin
	 CBDext.Checked:=true;
	 PrecCB.Checked:=true;
	 CBFlag.Checked:=false;
	 Main.Hide;
	 RzBitBtn18.Click;
//	end;
end;

procedure TMain.ODSAddFieldsSpravBeforePost(DataSet: TDataSet);
var
SeqVal:integer;

begin
 
If FocusedTree=StructureTree then
 Begin
  ODSAddFieldsSprav.FieldByName('id_object').AsInteger:=PNodeItemRec(StructureTree.Selected.Data)^.Object_id;
  ODSAddFieldsSprav.FieldByName('id_prop').AsInteger:=ODSProps.FieldByName('id_prop').AsInteger;
  ODSAddFieldsSprav.FieldByName('id_node').AsInteger:=PNodeItemRec(StructureTree.Selected.Data)^.ID_Node;
 End;

If FocusedTree=StructureTreeCur then
 Begin
  ODSAddFieldsSprav.FieldByName('id_object').AsInteger:=PNodeItemRec(StructureTreeCur.Selected.Data)^.Object_id;
  ODSAddFieldsSprav.FieldByName('id_prop').AsInteger:=ODSProps.FieldByName('id_prop').AsInteger;
  ODSAddFieldsSprav.FieldByName('id_node').AsInteger:=PNodeItemRec(StructureTreeCur.Selected.Data)^.ID_Node;
 End;      
  
Query:='select bqrk.GlobalNum.Nextval as Val from dual';
SeqODS.Close;
SeqODS.SQL.Clear; SeqODS.SQL.Text:=Query;
SeqODS.Open; SeqVal:=SeqODS.FieldByName('Val').AsInteger;

ODSAddFieldsSprav.FieldByName('id_field').AsInteger:=SeqVal;
//определяем заполнение полей данными в зависимости 
//от наличия предопределенного набора значений свойств
 If ODSPropVals.RecordCount<>0 then
	 ODSAddFieldsSprav.FieldByName('value2').AsString:=
	 ODSAddFieldsSprav.FieldByName('propvals').AsString;

 If ODSAddFieldsSprav.FieldByName('propname').AsString<>'ПРОИЗВОЛЬНО' then
	 ODSAddFieldsSprav.FieldByName('name').asstring:=
	 ODSAddFieldsSprav.FieldByName('propname').AsString;
 //заполняем выпадающий список новыми значениями для быстрого выбора впоследствии
 If ODSAddFieldsSprav.FieldByName('propname').AsString='ПРОИЗВОЛЬНО' then
  Begin
	If PropList.IndexOf(ODSAddFieldsSprav.FieldByName('name').AsString)<0  then
		PropList.Add(ODSAddFieldsSprav.FieldByName('name').AsString);
	If ComboList.IndexOf(ODSAddFieldsSprav.FieldByName('name').AsString)<0 then
	   ComboList.Add(ODSAddFieldsSprav.FieldByName('name').AsString);
  End;

 If PropList.Count<>0 then
  begin
	 InterfaceGrid.Columns.Items[7].PickList:=PropList;
	 InterfaceGrid.Columns.Items[7].KeyList:=PropList;
  end;

 If (ComboList.ItemIndex<>-1) and 
	 (ODSAddFieldsSprav.FieldByName('propname').AsString='ПРОИЗВОЛЬНО') then
  ODSAddFieldsSprav.FieldByName('name').AsString:=ComboList.Text;	

end;

procedure TMain.GenObjButtClick(Sender: TObject);
var
 i,j,ObjType,ObjTypeFG:integer;
 y,m,d:word;
 CurNode:TTreeNode;
 StrToAdd,Mprfx,Dprfx,StrToAddDOP,dext,ConcAddr,BaudRateConc:String;
begin
BaudRateConc:='';

Generation_tab.Enabled:=false;
//--Генерация текстового файла, секция объектов
if Main.cbdext.Checked=false then
dext:='' else dext:='; DEXT=YES';

Main.pb.PartsComplete:=0;
Main.pb.TotalParts:=Main.StructureTreeCur.Items.Count;
Main.WorkFileMemo.Clear;

 If Main.StructureTreeCur.Items.Count=0 then
  Begin
	ShowMessage('В дереве нет ни одного элемента!');
   Main.Generation_tab.Enabled:=true;
	Exit;
  End;

  Main.WorkFileMemo.Lines.Add('OBJECTS');

 If RGGateType.ItemIndex = 0 then
  Main.WorkFileMemo.Lines.Add(chr(9)+'TYPE=GSM_TERMINAL; BAUDRATE=9600');

  For i:=0 to Main.StructureTreeCur.Items.Count-1 do
	Begin
	//берем текущий узел
	 CurNode:=Main.StructureTreeCur.Items.Item[i];
	//проверяем есть ли в нем данные (проверка нужна для виртуальных концетраторов)
	If CurNode.Data<>nil then
	 ObjType:=PNodeItemRec(CurNode.Data)^.Object_id
	else //если данных нет, значит концентратор виртуальный
		  //и искусствено присваиваем тип объекта
	 ObjType:=2001;
	//определяем тип объекта и генерим соответствующие строки
	  Case ObjType of
		1001,1002,1003:
			  Begin
			  Query:='Select * from bqrk.con_points where id_con='+
						 IntToStr(PNodeItemRec(CurNode.Data)^.id_node);
			  Main.ODSTochka.Close; 
			  Main.ODSTochka.SQL.Clear;
			  Main.ODSTochka.SQL.Add(Query); 
			  Main.ODSTochka.Open;
				If Main.ODSTochka.FieldByName('Con_type').Asinteger=1001 then
				 Begin
				  StrToAdd:=chr(9)+chr(9)+'TYPE=GSM_MODEM'+'; NUMBER='+
				  Main.ODSTochka.FieldByName('PHONE_NUMBER').AsString;
				  BaudRateConc:='; BAUDRATE=9600';
				 End;
				If Main.ODSTochka.FieldByName('Con_type').Asinteger=1002 then
				 Begin
				  StrToAdd:=chr(9)+chr(9)+'TYPE=GSM_GATE; '+'NUMBER='+
				  Main.ODSTochka.FieldByName('PHONE_NUMBER').AsString;
				  BaudRateConc:='';
				 End;
				If Main.ODSTochka.FieldByName('Con_type').Asinteger=1003 then
				 Begin
				  StrToAdd:=chr(9)+'TYPE=GPRS/TCP_MODEM; '+'IP='+
				  Main.ODSTochka.FieldByName('IP_ADDRESS').AsString+'; PORT='+
				  Main.ODSTochka.FieldByName('PORT_NUM').AsString;
				  BaudRateConc:='';
				End;
				ObjTypeFG:=ObjType;
			  End;

		2001:
		 Begin
		  //проверка на виртуальный концентратор: если виртуальный то не делаем 
		 If (Main.RGType.ItemIndex=0) or (Main.RGType.ItemIndex=1) then
		  Begin
			 ConcAddr:=CurNode.Text;
			If RGGateType.ItemIndex=0 then	
			 StrToAdd:=chr(9)+chr(9)+chr(9)+'TYPE=PLC_I_CONCENTRATOR'+BaudRateConc+'; ADDR='+
					ConcAddr
				else
			 StrToAdd:=chr(9)+chr(9)+'TYPE=PLC_I_CONCENTRATOR'+BaudRateConc+'; ADDR='+
					ConcAddr;

		  End
		  //если CAN
		else StrToAdd:='';
	  End;

		2002,2006: Begin
						If RGGateType.ItemIndex=0 then	
							StrToAdd:=chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=COMMAND'
						else
							StrToAdd:=chr(9)+chr(9)+chr(9)+'TYPE=COMMAND';
					   End;
		2003:
		  Begin
		  WorkFileMemo.Refresh;
		  y:=0; m:=0; d:=0; Mprfx:=''; Dprfx:='';
		  Query:='Select a.*,b.con_name from bqrk.counters a,bqrk.con_points b where a.id_counter='+
						 IntToStr(PNodeItemRec(CurNode.Data)^.id_node)+' and a.id_con=b.id_con';
		  Main.ODSTochka.Close;
		  Main.ODSTochka.SQL.Clear;
		  Main.ODSTochka.SQL.Add(Query); 
		  Main.ODSTochka.Open;
		//определяем тип счетчиков для соответствующей генерации
		If Main.RGType.ItemIndex=0 then  
		 Begin //PLC
		  //разбиваем дату на части чтоб представить в правильном формате для бикварка	
			If Main.ODSTochka.FieldByName('DATE_LAST_POK').AsString<>'' then
			DecodeDate(StrToDate(Main.ODSTochka.FieldByName('DATE_LAST_POK').AsString),y,m,d);
			//добавочные нули для месяца и даты (Decode возвращает целое число)
			If m<10 then Mprfx:='0';
			If d<10 then Dprfx:='0';
			
			If length(inttostr(y))=2 then y:=y+2000;
			
		 If RGGateType.ItemIndex=0 then //если генерация для GSM
			StrToAdd:=chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=PLC_I_METER; '+'ADDR='
		  +Main.ODSTochka.FieldByName('COUNTER_ADDRESS').AsString+'; ТП='+Main.ODSTochka.FieldByName('CON_NAME').AsString+'; Улица='+Main.ODSTochka.FieldByName('street').AsString
		  +'; Дом='+Main.ODSTochka.FieldByName('DOM').AsString+'; №счетчика='+Main.ODSTochka.FieldByName('SERIAL_NUMBER').AsString
			+'; Конц.='+ConcAddr
			+dext else //если генерация для GPRS
			StrToAdd:=chr(9)+chr(9)+chr(9)+'TYPE=PLC_I_METER; '+'ADDR='
		  +Main.ODSTochka.FieldByName('COUNTER_ADDRESS').AsString+'; ТП='+Main.ODSTochka.FieldByName('CON_NAME').AsString+'; Улица='+Main.ODSTochka.FieldByName('street').AsString
		  +'; Дом='+Main.ODSTochka.FieldByName('DOM').AsString+'; №счетчика='+Main.ODSTochka.FieldByName('SERIAL_NUMBER').AsString
			+'; Конц.='+ConcAddr
		 End;
		//CAN 
		If Main.RGType.ItemIndex=2 then  
		 Begin       			 
			//доп строка если gprs шлюз 
			 If ObjTypeFG=1001 then
				StrToAddDOP:='BAUDRATE=9600; INTERFRAMETIMEOUTSCALE=10; RESPONSETIMEOUTSCALE=50'
			 else
				StrToAddDOP:='';

				StrToAdd:=chr(9)+chr(9)+chr(9)+'TYPE=MERCURY_230; ADDR=' +
				Main.ODSTochka.FieldByName('COUNTER_ADDRESS').AsString+'; '+StrToAddDOP+
				'; Улица='+Main.ODSTochka.FieldByName('street').AsString
				 +'; Дом='+Main.ODSTochka.FieldByName('DOM').AsString+
				'; №счетчика='+Main.ODSTochka.FieldByName('SERIAL_NUMBER').AsString
				+'; '+'; 0000'+chr(13)
				+chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=COMMAND; RUN=OPEN_CHANNEL; PARAM=01010101010101;'+chr(13)
				+chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=COMMAND; RUN=GET_SERNUM; PARAM=00;'+chr(13)
				+chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=COMMAND; RUN=GET_TIME; PARAM=00;'+chr(13)
				+chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=COMMAND; RUN=GET_VERSION; PARAM=03;'+chr(13)
				+chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=COMMAND; RUN=GET_VARIANT; PARAM=12;'+chr(13)
				+chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=COMMAND; RUN=GET_ENERGY; PARAM=0001;'+chr(13);
		 End;
		//вода
		If Main.RGType.ItemIndex=1 then  
		 Begin       			 
			  //разбиваем дату на части чтоб представить в правильном формате для бикварка	
			If Main.ODSTochka.FieldByName('DATE_LAST_POK').AsString<>'' then
			DecodeDate(StrToDate(Main.ODSTochka.FieldByName('DATE_LAST_POK').AsString),y,m,d);
			//добавочные нули для для месяца и даты (Decode возвращает целое число)
			If m<10 then Mprfx:='0';
			If d<10 then Dprfx:='0';
			
			If length(inttostr(y))=2 then y:=y+2000;
			
			StrToAdd:=chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=PLC_I_METER; '+'ADDR='
		  +Main.ODSTochka.FieldByName('COUNTER_ADDRESS').AsString+'; Улица='+Main.ODSTochka.FieldByName('street').AsString
		  +'; Дом='+Main.ODSTochka.FieldByName('DOM').AsString+'; №Водосчетчика='+Main.ODSTochka.FieldByName('SERIAL_NUMBER').AsString
			+'; №счетчика импульсов=00000000'+'; Добав='+Main.ODSTochka.FieldByName('DOBAV').AsString+'; Коэф='+Main.ODSTochka.FieldByName('KOEF').AsString+'; Конц.='+ConcAddr
			+dext
		 End;
		End;                   

		2004,2009:StrToAdd:=chr(9)+chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=BALANCE; ';
		2005:StrToAdd:=chr(9)+chr(9)+chr(9)+'TYPE=PLC_II_CONCENTRATOR; ';
		2007:StrToAdd:=chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=MAILBOX; ';
		2008:StrToAdd:=chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=SEGMENT; ';
	  End;
	//очередная проверка на виртуальность узла (концентраторы могут быть виртуальными)
	If CurNode.Data<>nil then
	 Begin
	  Main.ODSAddFlds.Close;
	  Main.ODSAddFlds.SetVariable('id_node',PNodeItemRec(CurNode.Data)^.id_node);
	  
	  Main.ODSAddFlds.Open; Main.ODSAddFlds.First;
	 
		For j:=0 to Main.ODSAddFlds.RecordCount-1 do
		 Begin
			StrToAdd:=StrToAdd+'; '+Main.ODSAddFlds.FieldByName('NAME').AsString+'='
			+Main.ODSAddFlds.FieldByName('value2').AsString; Main.ODSAddFlds.Next;
		 End;
	 End;

	  Main.WorkFileMemo.Lines.Add(StrToAdd);
	  Main.PB.IncPartsByOne;
	End; //--конец цикла по дереву For i:=0 to StructureTree.Items.Count-1 do
//процедура формирующая секцию интерфейса "по умолчанию". Чекбокс инвизибл
If Main.RzCheckBox1.checked=true then U_Util.DefaultInterface;	

Main.Generation_tab.Enabled:=true;
end;

procedure TMain.LoadButtClick(Sender: TObject);
begin
 LoadWholeTree;
end;

procedure TMain.StructureTreeCurGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
 Node.SelectedIndex:=Node.ImageIndex;
end;

procedure TMain.NewSchedule(Overwrite:boolean; SchedName:string);
var
DefInt,i:integer;
CurNode:TTreeNode;

begin
DefInt:=0;

If StructureTreeCur.Items.count=0 then
 Begin ShowMessage('В текущем расписании пусто!'); Exit; End;
 
if Overwrite=true then  
LoadSchedForm.DelSchedule(true);

  Query:='select bqrk.ScheduleID.Nextval as Val from dual';

  If SeqODS.Active=true then SeqODS.Close;
  SeqODS.SQL.Clear; SeqODS.SQL.Text:=Query;
  SeqODS.Open; SeqSchedVal:=SeqODS.FieldByName('Val').AsInteger;
  
  IdSchToWW:=SeqSchedVal;		
				
  If RzCheckBox1.Checked=true then DefInt:=1;						  
  
  Query:='Insert into BQRK.Schedule (id_schedule,name_schedule,comments,def_int) values '+
	'('+IntToStr(SeqSchedVal)+','''+SchedName+''''+','' '+' '','
	+IntToStr(DefInt)+')';

  Qry.SQL.Clear; Qry.SQL.Text:=Query; Qry.Execute;

 If ODSInterface.Active then ODSInterface.Close;
 ODSInterface.SQL.Clear;
 ODSInterface.SQL.Text:='Select * from bqrk.interface where id_schedule ='+IntToStr(SeqSchedVal);
 ODSInterface.Open;

  For i:=0 to StructureTreeCur.Items.Count-1 do
	Begin
	 CurNode:=StructureTreeCur.Items.Item[i];
	
	 Query:='Insert into BQRK.Grid values ('+IntToStr(SeqSchedVal)+','+
		 IntToStr(PNodeItemRec(CurNode.Data)^.id_node)+','+
		 IntToStr(PNodeItemRec(CurNode.Data)^.id_parent)+','+
		 IntToStr(PNodeItemRec(CurNode.Data)^.object_id)+','''+
		 CurNode.Text+''')';

	 Qry.SQL.Clear; Qry.SQL.Text:=Query; Qry.Execute;
	End;

  OS.Commit;

 If ODSInterface.Active then ODSInterface.Close;
 ODSInterface.SQL.Clear;
 ODSInterface.SQL.Text:='Select a.rowid,a.* from bqrk.interface a where id_schedule ='+IntToStr(SeqSchedVal);
 ODSInterface.Open;
 
 GloSchedID:=SeqSchedVal;

 ShowMessage('Расписание '+LoadSchedForm.ODSSchedule.FieldByName('NAME_SCHEDULE').AsString+' создано!');
 NameSched.Caption:=LoadSchedForm.ODSSchedule.FieldByName('NAME_SCHEDULE').AsString;
 LoadSchedForm.ODSSchedule.Refresh;
end;

procedure TMain.Transfer;
var
n1,n2,n3:TTreeNode;//старые узлы
nn1,nn2,nn3:TTreeNode;//новые узлы
ns1,ns2,ns3:TTreeNode;
i,j,k,q,ConnNodeNum,ConcNodeNum,CountNodeNum:Integer;
s:string;
n,CounterMass:array [0..50000] of TTreenode;
Check:boolean;
begin
Screen.Cursor := crHourGlass;

if StructureTree.SelectionCount=0 then 
Begin
Screen.Cursor := crArrow;
exit;
End;

q:=StructureTree.SelectionCount-1;
n1:=StructureTree.Selections[q];

if (n1.HasChildren=false) and (n1.Level=0) then 
 begin
  ShowMessage('Узел не имеет потомков');
  Screen.Cursor := crArrow;
  Exit;
 end; 
//перенос шлюзами (если выбранный узел не имеет родителей)
If n1.Parent=nil then
repeat                         
s:=n1.Text;
//--блок копирования
nn1:=StructureTreeCur.Items.AddChildObject(nil,'',nil);
nn1.Assign(n1);
//-----------------------------------
n2:=n1.getFirstChild;  //первый концентратор текущего шлюза
i:=n2.AbsoluteIndex;

For k:=0 to n1.Count-1 do
 Begin
  n[i]:=StructureTree.Items.Item[i];
	//--блок копирования
	nn2:=StructureTreeCur.Items.AddChildObject(nn1,'',nil);
	nn2.Assign(n[i]);
	//-------------------------------
	n3:=n[i].getFirstChild;  //первый счетчик текущего концентратора
	 For j:=0 to n[i].Count-1 do
	  Begin                       
		CounterMass[j]:=StructureTree.Items.Item[j+n3.AbsoluteIndex];
		//--блок копирования
		nn3:=StructureTreeCur.Items.AddChildObject(nn2,'',nil);
		nn3.Assign(CounterMass[j]);
		//----------------------------
	  End;
	  i:=i+n[i].Count+1;
  End;

q:=q-1; 
if q=-1 then
 begin
  Screen.Cursor := crArrow;
  exit;
 end;
n1:=StructureTree.Selections[q];
 //конец цикла переноса ВСЕХ

until q=-1 //StructureTree.SelectionCount-1
 else //КОНЕЦ ЦИКЛА: перенос шлюзами (если выбранный узел не имеет родителей)
  begin
	//перенос счетчиками: идем снизу вверх
	n1:=StructureTree.Selected;//счетчик
	n2:=n1.Parent;//концентратор
	n3:=n2.Parent;//шлюз
 //в цикле по шлюзам проверяем есть ли такой шлюз n3 в расписании 
 //запоминаем его и если есть то добавляем
ConnNodeNum:=PNodeItemRec(n3.Data)^.ID_Node;
ConcNodeNum:=PNodeItemRec(n2.Data)^.ID_Node;
CountNodeNum:=PNodeItemRec(n1.Data)^.ID_Node;

//если дерево пустое то безусловно добавляем новый шлюз
If StructureTreeCur.Items.Count=0 then 
  begin
	nn3:=StructureTreeCur.Items.AddChildObject(nil,'',nil);
	nn3.Assign(n3);
	Check:=true;	
  end else Check:=false;

	ns3:=StructureTreeCur.Items.Item[0];
					
while Check=false do
 If (PNodeItemRec(ns3.Data)^.ID_Node=ConnNodeNum) or (ns3=nil) then
  begin
	Check:=true;
	nn3:=ns3;
  end
	else
  begin	        
	ns3:=ns3.getNextSibling;
	 if ns3=nil then Check:=true;
  end;

  if ns3=nil then check:=false;

If Check=false  then
 begin
	nn3:=StructureTreeCur.Items.AddChildObject(nil,'',nil);
	nn3.Assign(n3);
 end;	 
//в цикле по этому шлюзу смотрим концентратор n2 
 //запоминаем его и если нет то добавляем присваивая в родители текущий шлюз 
 if nn3.getFirstChild=nil then
  begin
	nn2:=StructureTreeCur.Items.AddChildObject(nn3,'',nil);
	nn2.Assign(n2);
	Check:=true;
  end 
	else 
  begin
	 Check:=false;
	 ns2:=nn3.getFirstChild;
  end;

 while Check=false do
  If (PNodeItemRec(ns2.Data)^.ID_Node=ConcNodeNum) or (ns2=nil) then
	begin
	 Check:=true;
	 nn2:=ns2;
	end
	 else
	begin
	ns2:=ns2.getNextSibling;
	  if ns2=nil then Check:=true;
	end;

	if ns2=nil then check:=false;

 If Check=false then
  begin	
	nn2:=StructureTreeCur.Items.AddChildObject(nn3,'',nil);
	nn2.Assign(n2);
  end;
 //в цикле по этому концентратору смотрим счетчик n1
 //запоминаем его и если его нет то добавляем присваивая в родители концентратор
 if nn2.getFirstChild=nil then
  begin
	nn1:=StructureTreeCur.Items.AddChildObject(nn2,'',nil);
	nn1.Assign(n1);
	Check:=true;
  end else 
 begin 
	Check:=false;
	ns1:=nn2.getFirstChild;
 end;

  while Check=false do
	If (PNodeItemRec(ns1.Data)^.ID_Node=CountNodeNum) or (ns1=nil) then
		Check:=true
	  else
	begin
	  ns1:=ns1.getNextSibling;
	  if ns1=nil then Check:=true;
	end;

  if ns1=nil then check:=false;

 If Check=false then
  begin
	nn1:=StructureTreeCur.Items.AddChildObject(nn2,'',nil);
	nn1.Assign(n1);
  end;
 end;
;
Screen.Cursor := crArrow;
end;

procedure TMain.StructureTreeGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
 Node.SelectedIndex:= Node.ImageIndex;
end;

procedure TMain.ChangeNode(Tree:TRzTreeView);
var
ObjType:integer;
SelectedNode:TTreeNode;
StrField:TStringField;
IntField:TIntegerField;
FloatField:TFloatField;

begin

if Tree.Selected=nil then exit;
if Tree.Selected.Data=nil then exit;

if Tree=StructureTreeCur then AddNodeButt.Enabled:=false
 else AddNodeButt.Enabled:=true;

 RzPageControl1.ActivePageIndex:=1;
 SelectedNode:=Tree.Selected;

ObjType:=SelectedNode.ImageIndex;
  If ODSProps.active=true then ODSProps.Close;
			  
  ParentNode:=PNodeItemRec(SelectedNode.Data)^.ID_Node;
  ODSProps.SetVariable('id_object',PNodeItemRec(SelectedNode.Data)^.Object_id);

	Case ObjType of
	 0,17,36:begin
			Query:='Select a.rowid,a.* from bqrk.Con_Points a where a.id_con= ';
			SaveBLOB.Enabled:=true;
		end;
	 1:begin
			Query:='Select a.rowid,a.* from bqrk.Concentrator_Points a where a.id_concentrator= ';
			SaveBLOB.Enabled:=false;
		end;
	 2:begin
			Query:='Select a.rowid,a.actual,a.counter_name,a.dist,'+
					 'a.street,a.dom,a.serial_number,a.counter_address,a.comments,'+
					 'a.last_pok,a.date_last_pok,a.last_pokt1,a.last_pokt2,'+
					 'a.last_pokt3,a.last_pokt4,a.dobav,a.koef,a.id_counter,a.date_create '+
					 'from bqrk.Counters a where a.id_counter= ';
			SaveBLOB.Enabled:=false;
		end;
	3..8:begin
			Query:='Select a.rowid,a.* from bqrk.AddObjects a where a.id_AddObj= ';
			SaveBLOB.Enabled:=false;  
			end;
	End;

Query:=Query+IntToStr(PNodeItemRec(SelectedNode.Data)^.ID_Node);
ODSProps.Open;

If ODSTochka.Active=true then ODSTochka.Close;

 ODSTochka.SQL.Clear;
 ODSTochka.SQL.Text:=Query;
 ODSTochka.Open;

if (PNodeItemRec(SelectedNode.Data)^.Object_id=1002) or (PNodeItemRec(SelectedNode.Data)^.Object_id=1001)
 or (PNodeItemRec(SelectedNode.Data)^.Object_id=1003) then
 begin
 Opros1000Number:=ODSTochka.FieldByName('PHONE_NUMBER').AsString;
 //грузим картинки из полей оракла
 ShowMeTheImage(Image1, '0');
 ShowMeTheImage(Image2, '1');
 ShowMeTheImage(Image3, '2');
 ShowMeTheImage(Image4, '3');
 ShowMeTheImage(Image5, '4');
 ShowMeTheImage(Image6, '5');
 ShowMeTheImage(Image7, '6');
 ShowMeTheImage(Image8, '7');

end;

  Case ObjType of
	 3..8:Query:='Select a.rowid,a.* from bqrk.AddFields a inner join bqrk.AddObjects b '+
				    'on a.id_node=b.id_addobj and a.id_node= ';
	 0,17,36:Query:='Select a.rowid,a.* from bqrk.AddFields a inner join bqrk.con_points b '+
				 'on a.id_node=b.id_con where b.id_con= ';
	 1:Query:='Select a.rowid,a.* from bqrk.AddFields a inner join bqrk.concentrator_points b '+
				 'on a.id_node=b.id_concentrator and a.id_node= ';
	 2:Query:='Select a.rowid,a.* from bqrk.AddFields a inner join bqrk.counters b '+
				 'on a.id_node=b.id_counter and a.id_node= ';
  End;
 Query:=Query+IntToStr(PNodeItemRec(SelectedNode.Data)^.ID_Node);
 If ODSAddFieldsSprav.Active=true then ODSAddFieldsSprav.Close;

 ODSAddFieldsSprav.SQL.Clear;
 ODSAddFieldsSprav.SQL.Text:=Query;
 ODSAddFieldsSprav.Open;

ODSAddFieldsSprav.insert;
RzDBNavigator1.VisibleButtons:=[nbDelete,nbRefresh];

 StatusStr.Caption:='Текущий: '+IntToStr(PNodeItemRec(SelectedNode.Data)^.ID_Node)
 +' / Родительский: '+IntToStr(PNodeItemRec(SelectedNode.Data)^.ID_parent)
 +' / Текст: '+SelectedNode.Text+' / Тип: '+IntToStr(PNodeItemRec(SelectedNode.Data)^.Object_id);

//определяем видимый набор столбцов грида дополнительных свойств
if (PNodeItemRec(SelectedNode.Data)^.Object_id = 1002) or
   (PNodeItemRec(SelectedNode.Data)^.Object_id = 1003) or
	(PNodeItemRec(SelectedNode.Data)^.Object_id = 1001) then
 Begin
  AddValsList.Columns.Items[0].Visible:=true;
  AddValsList.Columns.Items[3].Visible:=true;

  AddValsList.Columns.Items[1].Visible:=false;
  AddValsList.Columns.Items[2].Visible:=false;
 End;

if PNodeItemRec(SelectedNode.Data)^.Object_id = 2001 then
 Begin
  AddValsList.Columns.Items[0].Visible:=true;
  AddValsList.Columns.Items[3].Visible:=true;

  AddValsList.Columns.Items[1].Visible:=false;
  AddValsList.Columns.Items[2].Visible:=false;
 End;

if PNodeItemRec(SelectedNode.Data)^.Object_id = 2003 then
 Begin
  AddValsList.Columns.Items[0].Visible:=true;
  AddValsList.Columns.Items[2].Visible:=true;
  AddValsList.Columns.Items[3].Visible:=true;

  AddValsList.Columns.Items[1].Visible:=false;
 End;

if PNodeItemRec(SelectedNode.Data)^.Object_id = 2002 then
 Begin
  AddValsList.Columns.Items[0].Visible:=true;
  AddValsList.Columns.Items[1].Visible:=true;
  AddValsList.Columns.Items[3].Visible:=true;
  
  AddValsList.Columns.Items[2].Visible:=false;
 End;

NodeProps.RowHeight:=100;
//настраиваем грид основных свойств под соответствующий  узел
Case PNodeItemRec(SelectedNode.Data)^.Object_id of 
 1001,1002:Begin          
	 StatusGrid.Visible:=false;
	 ODSTochka.FieldByName('CON_NAME').DisplayLabel:='Объект';
	 ODSTochka.FieldByName('STREET').DisplayLabel:='Месторасположение';
	 ODSTochka.FieldByName('DOM').DisplayLabel:='Дом';
	 ODSTochka.FieldByName('IST_PIT').DisplayLabel:='Ист. пит.';
	 ODSTochka.FieldByName('PHONE_NUMBER').DisplayLabel:='Тел. ном.';
	 ODSTochka.FieldByName('COMMENTS').DisplayLabel:='Коммент.';
	 ODSTochka.FieldByName('DIST').DisplayLabel:='Район';
	 
	 NodeProps.Columns.Items[0].Visible:=false;
	 NodeProps.Columns.Items[1].Visible:=false;
	 NodeProps.Columns.Items[2].Visible:=false;

	 NodeProps.Columns.Items[3].Width:=70;
	 NodeProps.Columns.Items[4].Width:=150;

	 NodeProps.Columns.Items[5].Visible:=false;

	 NodeProps.Columns.Items[6].Visible:=true;

	 NodeProps.Columns.Items[7].Visible:=false;
	 NodeProps.Columns.Items[8].Visible:=false;
	 NodeProps.Columns.Items[9].Visible:=false;

	 NodeProps.Columns.Items[10].Width:=70;
	 NodeProps.Columns.Items[11].Width:=165;

	 NodeProps.Columns.Items[12].Visible:=false;
  End;
 
 1003:Begin
	 StatusGrid.Visible:=false;
    ODSTochka.FieldByName('CON_NAME').DisplayLabel:='Объект';
	 ODSTochka.FieldByName('STREET').DisplayLabel:='Месторасположение';
	 ODSTochka.FieldByName('DOM').DisplayLabel:='Дом';
	 ODSTochka.FieldByName('IST_PIT').DisplayLabel:='Ист. пит.';
	 ODSTochka.FieldByName('PHONE_NUMBER').DisplayLabel:='Тел. ном.';
	 ODSTochka.FieldByName('IP_ADDRESS').DisplayLabel:='IP-адрес';
	 ODSTochka.FieldByName('PORT_NUM').DisplayLabel:='Номер порта';
	 ODSTochka.FieldByName('COMMENTS').DisplayLabel:='Коммент.';
	 ODSTochka.FieldByName('DIST').DisplayLabel:='Район';
	 
	 NodeProps.Columns.Items[0].Visible:=false;
	 NodeProps.Columns.Items[1].Visible:=false;
	 NodeProps.Columns.Items[2].Visible:=false;
	 
	 NodeProps.Columns.Items[3].Width:=150;

	 NodeProps.Columns.Items[4].Width:=150;

	 NodeProps.Columns.Items[5].Visible:=false;
	 NodeProps.Columns.Items[6].Visible:=false;

	 NodeProps.Columns.Items[7].Width:=100;
	 NodeProps.Columns.Items[8].Width:=60;
	 NodeProps.Columns.Items[9].Width:=40;
	 NodeProps.Columns.Items[10].Width:=165;
	 NodeProps.Columns.Items[11].Width:=80;

	 
	 NodeProps.Columns.Items[8].Visible:=true;
	 NodeProps.Columns.Items[9].Visible:=true;
	 NodeProps.Columns.Items[7].Visible:=true;
	 NodeProps.Columns.Items[12].Visible:=false;
 End;

 2001:Begin
	 StatusGrid.Visible:=false;
	 ODSTochka.FieldByName('NAME_CONCENTRATOR').DisplayLabel:='Наименование';
	 ODSTochka.FieldByName('CONCENTRATOR_ADDRESS').DisplayLabel:='Сет. адрес';
	 ODSTochka.FieldByName('COMMENTS').DisplayLabel:='Комментарии';

	 NodeProps.Columns.Items[0].Visible:=false;
	 NodeProps.Columns.Items[1].Visible:=false;
	 NodeProps.Columns.Items[5].Visible:=false;
	 
	 NodeProps.Columns.Items[2].Width:=140;
	 NodeProps.Columns.Items[3].Width:=70;
	 NodeProps.Columns.Items[4].Width:=210;
	 NodeProps.Columns.Items[2].Visible:=false;
	End;

 2003:Begin 
	 	
	 StatusGrid.Visible:=true;

{
	 ODSTochka.Close;

	 StrField:=TStringField.Create(Self);
	 StrField.FieldName:='ACTUAL';
	 StrField.FieldKind:=fkLookUp;
	 StrField.DataSet:=ODSTochka;
	 StrField.DisplayLabel:='Стат';
	 StrField.LookupDataSet:=ODSStatus;
	 StrField.KeyFields:='ACTUAL';
	 StrField.LookupKeyFields:='ID_STATUS';
	 StrField.LookupResultField:='NAME_STATUS';
	 StrField.LookupCache:=true;
	 ODSTochka.Fields.Add(StrField);

	 StrField:=TStringField.Create(Self);
	 StrField.FieldName:='COUNTER_NAME';
	 StrField.FieldKind:=fkData;
	 StrField.DataSet:=ODSTochka;
	 StrField.DisplayLabel:='Объект';
	 ODSTochka.Fields.Add(StrField);
 
	 StrField:=TStringField.Create(Self);
	 StrField.FieldName:='DIST';
	 StrField.FieldKind:=fkData;
	 StrField.DataSet:=ODSTochka;
	 StrField.DisplayLabel:='Район';
	 ODSTochka.Fields.Add(StrField);
  
	 StrField:=TStringField.Create(Self);
	 StrField.FieldName:='STREET';
	 StrField.FieldKind:=fkData;
	 StrField.DataSet:=ODSTochka;
	 StrField.DisplayLabel:='Улица';
	 ODSTochka.Fields.Add(StrField);
  
	 StrField:=TStringField.Create(Self);
	 StrField.FieldName:='DOM';
	 StrField.FieldKind:=fkData;
	 StrField.DataSet:=ODSTochka;
	 StrField.DisplayLabel:='Дом';
	 ODSTochka.Fields.Add(StrField);

	 StrField:=TStringField.Create(Self);
	 StrField.FieldName:='SERIAL_NUMBER';
	 StrField.FieldKind:=fkData;
	 StrField.DataSet:=ODSTochka;
	 StrField.DisplayLabel:='Серийный №';
	 ODSTochka.Fields.Add(StrField);

	 IntField:=TIntegerField.Create(Self);
	 IntField.FieldName:='COUNTER_ADDRESS';
	 IntField.FieldKind:=fkData;
	 IntField.DataSet:=ODSTochka;
	 IntField.DisplayLabel:='Сет. адрес';
	 ODSTochka.Fields.Add(IntField);

	 StrField:=TStringField.Create(Self);
	 StrField.FieldName:='COMMENTS';
	 StrField.FieldKind:=fkData;
	 StrField.DataSet:=ODSTochka;
	 StrField.DisplayLabel:='Комментарии';

	 ODSTochka.Fields.Add(StrField);

	 FloatField:=TFloatField.Create(Self);
	 FloatField.FieldName:='LAST_POK';
	 FloatField.FieldKind:=fkData;
	 FloatField.DataSet:=ODSTochka;
	 FloatField.DisplayLabel:='Посл. пок.';

	 ODSTochka.Fields.Add(FloatField);

	 FloatField:=TFloatField.Create(Self);
	 FloatField.FieldName:='LAST_POKT1';
	 FloatField.FieldKind:=fkData;
	 FloatField.DataSet:=ODSTochka;
	 FloatField.DisplayLabel:='Тариф 1';

	 ODSTochka.Fields.Add(FloatField);

	 FloatField:=TFloatField.Create(Self);
	 FloatField.FieldName:='LAST_POKT2';
	 FloatField.FieldKind:=fkData;
	 FloatField.DataSet:=ODSTochka;
	 FloatField.DisplayLabel:='Тариф 2';

	 ODSTochka.Fields.Add(FloatField);

	 FloatField:=TFloatField.Create(Self);
	 FloatField.FieldName:='LAST_POKT3';
	 FloatField.FieldKind:=fkData;
	 FloatField.DataSet:=ODSTochka;
	 FloatField.DisplayLabel:='Тариф 3';

	 ODSTochka.Fields.Add(FloatField);

	 FloatField:=TFloatField.Create(Self);
	 FloatField.FieldName:='LAST_POKT4';
	 FloatField.FieldKind:=fkData;
	 FloatField.DataSet:=ODSTochka;
	 FloatField.DisplayLabel:='Тариф 4';

	 ODSTochka.Fields.Add(FloatField);

	 FloatField:=TFloatField.Create(Self);
	 FloatField.FieldName:='DOBAV';
	 FloatField.FieldKind:=fkData;
	 FloatField.DataSet:=ODSTochka;
	 FloatField.DisplayLabel:='Доб.';

	 ODSTochka.Fields.Add(FloatField);

	 StrField:=TStringField.Create(Self);
	 StrField.FieldName:='KOEF';
	 StrField.FieldKind:=fkData;
	 StrField.DataSet:=ODSTochka;
	 StrField.DisplayLabel:='Коэф.';
  
  ODSTochka.Open; 
 }

	 ODSTochka.FieldByName('COUNTER_NAME').DisplayLabel:='Объект';
	 ODSTochka.FieldByName('DIST').DisplayLabel:='Район';
	 ODSTochka.FieldByName('ACTUAL').DisplayLabel:='Стат';
	 ODSTochka.FieldByName('STREET').DisplayLabel:='Улица';
	 ODSTochka.FieldByName('DOM').DisplayLabel:='Дом';
	 ODSTochka.FieldByName('SERIAL_NUMBER').DisplayLabel:='Серийный №';
	 ODSTochka.FieldByName('COUNTER_ADDRESS').DisplayLabel:='Сет. адрес';
	 ODSTochka.FieldByName('COMMENTS').DisplayLabel:='Комментарии';
	 ODSTochka.FieldByName('LAST_POK').DisplayLabel:='Посл. пок.';
	 ODSTochka.FieldByName('DATE_LAST_POK').DisplayLabel:='Дата п\п';
	 ODSTochka.FieldByName('LAST_POKT1').DisplayLabel:='Тариф 1';
	 ODSTochka.FieldByName('LAST_POKT2').DisplayLabel:='Тариф 2';
	 ODSTochka.FieldByName('LAST_POKT3').DisplayLabel:='Тариф 3';
	 ODSTochka.FieldByName('LAST_POKT4').DisplayLabel:='Тариф 4';
	 ODSTochka.FieldByName('DOBAV').DisplayLabel:='Доб.';
	 ODSTochka.FieldByName('KOEF').DisplayLabel:='Коэф.';

	 NodeProps.Columns.Items[0].Width:=35;
	 NodeProps.Columns.Items[1].Width:=55;
	 NodeProps.Columns.Items[2].Width:=60;
	 NodeProps.Columns.Items[3].Width:=90;
	 NodeProps.Columns.Items[4].Width:=50;
	 NodeProps.Columns.Items[5].Width:=60;
	 NodeProps.Columns.Items[6].Width:=30;
	 NodeProps.Columns.Items[7].Width:=60;
	 NodeProps.Columns.Items[8].Width:=70;
	 NodeProps.Columns.Items[9].Width:=70;
	 NodeProps.Columns.Items[10].Width:=40;
	 NodeProps.Columns.Items[11].Width:=50;
	 NodeProps.Columns.Items[12].Width:=50;
	 NodeProps.Columns.Items[13].Width:=50;
	 NodeProps.Columns.Items[14].Width:=40;
	 NodeProps.Columns.Items[15].Width:=30;
	End;
 2002:
	Begin
	 StatusGrid.Visible:=false;
	 NodeProps.Columns.Items[0].Visible:=false;
	 NodeProps.Columns.Items[1].Visible:=false;
	 NodeProps.Columns.Items[2].Visible:=false;
	End;
End;

end;

procedure TMain.StructureTreeChange(Sender: TObject; Node: TTreeNode);
begin
 if node=nil then 
exit;
 ChangeNode(StructureTree);

  If Node.Level=1 then
	TransferButt.Enabled:=false
  else
	TransferButt.Enabled:=true;
end;

procedure TMain.Delete(Tree:TRzTreeView);
var
SqlStr:string;
ObjType:integer;
NodeToDel:TTreeNode;

Begin
Screen.Cursor := crHourGlass;
 
if Tree.Selected=nil then Exit; 
 if MessageDlg('Вы уверены что хотите удалить выбранный узел?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
	Begin
 //отключаем внешний ключ для удаления показаний
 OnOffConstraints(0);
 //запоминаем выбранный узел
 NodeToDel:=Tree.Selected;
	 
	 If NodeToDel.HasChildren then
		If MessageDlg('У этого узла есть дочерние узлы! Продолжить?',
				mtConfirmation, [mbYes, mbNo], 0) = mrNo then  
			     Begin
					OnOffConstraints(1);
					Exit;
				  End;
	
		ObjType:=PNodeItemRec(NodeToDel.Data)^.Object_id;

		if Tree=StructureTree then //--если основное дерево то узел удаляем из базы
		  Begin
			//--проверяем наличие удаляемого узла в сетке расписаний
			 Query:='Select * from bqrk.grid where id_node='+IntToStr(PNodeItemRec(NodeToDel.Data)^.ID_Node);
			 Qry.SQL.Clear; Qry.SQL.Text:=Query; Qry.Execute;
			  If Qry.RowCount>0 then
				Begin
				 If MessageDlg('Этот узел существует в одном или более расписаний. Продолжить?',
					mtConfirmation, [mbYes, mbNo], 0) = mrNo then 
				  Begin
					OnOffConstraints(1);
					Exit;
				  End;
				End;	
	 //вызываем процедуру удаления узла		
	 OP.CallProcedure('delete_node',
	 [PNodeItemRec(NodeToDel.Data)^.ID_Node,ObjType]);
	 ODSTochka.Refresh; ODSAddFieldsSprav.Refresh;
	 NodeToDel.Delete; 
	 End
		Else
		  Begin //удаление из конкретного расписания (в общей БД узел остается)
		//хранимая процедура удаления узлов из сохраненного расписания
		OP.CallProcedure('delete_node_from_schedule',
		[PNodeItemRec(NodeToDel.Data)^.ID_Node,ObjType,GloSchedId]);
		
		NodeToDel.Delete; 
		  End;
		End
	 else Exit; //ветка верхнего IF с диалогом на подтверждение удаления узла
//после удаления 
//включаем внешний ключ
 OnOffConstraints(1);

 OS.Commit;
 RefreshCounts;

Screen.Cursor := crArrow; 
end;                 

procedure TMain.N2Click(Sender: TObject);
begin
 Delete(StructureTree);
end;

procedure TMain.Search(Tree:TRzTreeView);
var
 ConnName,ConcName,CounterName,cn,ccn:string;
 i:integer;
 NodeToSearch,ConcNode,ConnNode:TTreeNode;

Begin

  Query:='Select a.con_name,b.name_concentrator,c.counter_name from bqrk.con_points a,'
			+'bqrk.concentrator_points b,bqrk.counters c'
			+' where a.id_con=b.id_con and b.id_con=c.id_con and b.id_concentrator=c.id_concentrator'
			+' and a.id_con=c.id_con and c.serial_number='''+SearchCounter.Text+'''';

 Qry.SQL.Clear; Qry.SQL.Text:=Query; Qry.Execute;
 If Qry.RowCount=0 then Begin ShowMessage('Ничего не найдено!'); Exit; End;
 CounterName:=Qry.Field(2); ConcName:=Qry.Field(1); ConnName:=Qry.Field(0);

//бежим по дереву, ищем указанный счетчик и переводим на него фокус
For i:=0 to Tree.Items.Count-1 do
 begin
  if Tree.Items.Item[i].Text=CounterName then
	begin
	 NodeToSearch:=Tree.Items.Item[i];
	 ConcNode:=NodeToSearch.Parent; 
	 CN:=ConcNode.Text;
	 ConnNode:=ConcNode.Parent; CCN:=ConnNode.Text;
	  If (CN=ConcName) and (CCN=ConnName) then
		Begin 
		 Tree.Select(NodeToSearch);
		 Exit;
		End
		 else
		Continue;
	end;
 end;
End;

procedure TMain.RzBitBtn7Click(Sender: TObject);
var
DirName:string;
Path:string;
PathToApp:string;
CityParam:string;
begin
//процедура сохранения файла задания и батника

//ВНИМАНИЕ!!! исполняемый файл бикварка и консоли лежат в ОДНОЙ папке,
//а для хранения задания, батника и результатов опроса используется ОТДЕЛЬНЫЕ папки
//Результаты опроса переносятся батником в соответствующую папку
PathToApp:=ExtractFilePath(Application.ExeName);

If City='SKEK' then CityParam:=' -k ';
If City='LK' then CityParam:=' -l ';
 //если батник не сохраняем то без папки
  If SD.Execute then
	Begin
If RzCheckBox3.Checked=false then
	 DirName:='' else
	begin
	 DirName:= Copy(ExtractFileName(SD.FileName),1,length(ExtractFileName(SD.FileName))-4);
	 CreateDir(DirName);
	end;	
	 Path:=ExtractFilePath(SD.FileName);
	 
	 WorkFileMemo.Lines.SaveToFile(Path+DirName+'\'+ExtractFileName(SD.FileName));
		  If RzCheckBox3.Checked=true then
		Begin
		 WorkFileMemo.Clear;
		 //текст батника
		 WorkFileMemo.Lines.Add(PathToApp+bquark_vers+' '+PathToApp+DirName+'\'+ExtractFileName(SD.FileName));
		 WorkFileMemo.Lines.Add('cd ..');
		 WorkFileMemo.Lines.Add(Application.ExeName+' -a'+CityParam+Copy(ExtractFileName(SD.FileName),1,length(ExtractFileName(SD.FileName))-4)+'.csv');
		 WorkFileMemo.Lines.Add('move '+PathToApp+Copy(ExtractFileName(SD.FileName),1,length(ExtractFileName(SD.FileName))-4)+'.csv'+' '+PathToApp+DirName+'\'+DirName+'_%date%.csv');
		 WorkFileMemo.Lines.SaveToFile(Path+DirName+'\'+Copy(ExtractFileName(SD.FileName),1,length(ExtractFileName(SD.FileName))-4)+'.bat');
		End;
	End;
end;                

procedure TMain.ODSInterfaceAfterInsert(DataSet: TDataSet);
var
SeqVal:integer;

begin
 SeqODS.Close; SeqODS.SQL.Clear; SeqODS.SQL.Text:='select bqrk.ROWIDINTERFACE.Nextval as Val from dual';
 SeqODS.Open; SeqVal:=SeqODS.FieldByName('Val').AsInteger;

 ODSInterface.FieldByName('num_row').Value:=SeqVal;
 ODSInterface.FieldByName('id_schedule').Value:=GloSchedID;
 ODSInterface.FieldByName('id_interface').Value:=InterfaceID;
end;

procedure TMain.ODSInterfaceAfterOpen(DataSet: TDataSet);
begin
If ODSInterface.RecordCount=0 then
Begin
 SeqODS.Close;
 SeqODS.SQL.Clear; SeqODS.SQL.Text:='select bqrk.INTERFACEID.Nextval as Val from dual';
 SeqODS.Open; InterfaceID:=SeqODS.FieldByName('Val').AsInteger;
End
 else
	InterfaceID:=ODSInterface.FieldByName('id_interface').AsInteger;
end;

procedure TMain.GenIntButtClick(Sender: TObject);
var
align,grup,filtr,ndfn,tl:string;
ov,TargetTimeShift,mon,god,prec,percent:string;

begin
If WorkFileMemo.Lines.Count=0 then
Begin ShowMessage('Секция объектов пуста!'); Exit; End;

 WorkFileMemo.Lines.Add(chr(13));
 WorkFileMemo.Lines.Add('INTERFACE'+chr(13));

 ndfn:=''; tl:=''; ov:=''; TargetTimeShift:='';
  
  If NDFNed.Text<>'' then 	ndfn:='; NDFN='+NDFNed.Text;  
  If TLed.Text<>'' then  tl:='; TL='+TLed.Text;
  If OVed.Text<>'' then	ov:='; OV='+OVed.Text;
  If TTSHed.Text<>'' then TargetTimeShift:='; TARGET_TIMESHIFT='+TTSHed.Text;

 WorkFileMemo.Lines.Add(chr(9)+'TYPE=OPTIONS '+ov+TargetTimeShift+ndfn+tl+chr(13));
 WorkFileMemo.Lines.Add(chr(9)+'TYPE=TABLE'+chr(13));

 ODSInterface.First;

 While not ODSInterface.Eof do
  Begin
	align:=''; grup:=''; filtr:=''; ndfn:=''; tl:='';
	ov:=''; TargetTimeShift:=''; mon:=''; god:=''; prec:='';
	
	If ODSInterface.FieldByName('ALIGN').AsString<>'0' then
	align:='; ALIGN='+ODSInterface.FieldByName('ALIGN').AsString+'; ';
 
	If ODSInterface.FieldByName('grup').AsString<>'0' then
	grup:='; GROUP='+ODSInterface.FieldByName('grup').AsString+'; ';
 
	If ODSInterface.FieldByName('filtr').AsString<>'0' then
	filtr:='; FILTER='+ODSInterface.FieldByName('FILTR').AsString;
	
	If ODSInterface.FieldByName('MON').AsInteger<>0 then
	mon:='; M='+ODSInterface.FieldByName('MON').AsString+'; ';

	If ODSInterface.FieldByName('GOD').AsInteger<>0 then
	god:='; Y='+ODSInterface.FieldByName('GOD').AsString+'; ';

	If ODSInterface.FieldByName('PREC').AsInteger<>0 then
	prec:='; PREC='+ODSInterface.FieldByName('PREC').AsString+'; ';

	If ODSInterface.FieldByName('PERCENT').AsString<>'0' then
	percent:='; PERCENT='+ODSInterface.FieldByName('PERCENT').AsString+'; ';
		
	 WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=COLUMN'+
	'; TITLE='+ODSInterface.FieldByName('COL_TITLE').AsString
	+'; VALUE='+ODSInterface.FieldByName('VAL').AsString
	+filtr+ndfn+tl+ov+targettimeshift+mon+god+prec+percent);

	ODSInterface.Next;
  End;
  
end;

procedure TMain.RzBitBtn8Click(Sender: TObject);
begin
if MessageDlg('Вы уверены в том что хотите очистить?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
 Begin
  WorkFileMemo.Lines.Clear;
  OpenExcel.Enabled:=false;
 End;
end;

procedure TMain.StructureTreeCurClick(Sender: TObject);
begin
 FocusedTree:=StructureTreeCur;
end;

procedure TMain.StructureTreeClick(Sender: TObject);
begin
 FocusedTree:=StructureTree;
end;

procedure TMain.InterfacegridColumns5UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
If Text='PROPERTY'
	then
	 Begin 
	  InterfaceGrid.Columns.Items[8].Visible:=false; InterfaceGrid.Columns.Items[9].Visible:=false; 
	  InterfaceGrid.Columns.Items[10].Visible:=false; InterfaceGrid.Columns.Items[11].Visible:=false;
	  InterfaceGrid.Columns.Items[12].Visible:=false;
	  //обнуляем то что не надо (чтоб не попало в генерацию)
	  Qry.SQL.Text:='UPDATE bqrk.interface a SET a.god=0,a.mon=0,a.prec=0,a.grup=''0'',a.percent=0 where a.num_row='
	  +ODSInterface.fieldByName('num_row').AsString;
	  Qry.Execute; 
	 End;

If Text='BINDATA' then
	 Begin 
	  InterfaceGrid.Columns.Items[8].Visible:=true; InterfaceGrid.Columns.Items[9].Visible:=true;
	  InterfaceGrid.Columns.Items[10].Visible:=false; InterfaceGrid.Columns.Items[11].Visible:=false;
	  InterfaceGrid.Columns.Items[12].Visible:=false;

	  Qry.SQL.Text:='UPDATE bqrk.interface a SET a.prec=0,a.grup=''0'',a.percent=0 where a.num_row='
	  +ODSInterface.fieldByName('num_row').AsString;
	  Qry.Execute; 
	 End;          

If Text='CALC' then
	 Begin 
	  InterfaceGrid.Columns.Items[8].Visible:=false; InterfaceGrid.Columns.Items[9].Visible:=false;
	  InterfaceGrid.Columns.Items[10].Visible:=false; InterfaceGrid.Columns.Items[11].Visible:=true;
	  InterfaceGrid.Columns.Items[12].Visible:=false;

	  Qry.SQL.Text:='UPDATE bqrk.interface a SET a.mon=0,a.god=0,a.percent=0 where a.num_row='
	  +ODSInterface.fieldByName('num_row').AsString;
	  Qry.Execute;
	 End;

If Text='BALANCE' then
	 Begin 
	  InterfaceGrid.Columns.Items[8].Visible:=false; InterfaceGrid.Columns.Items[9].Visible:=false;
	  InterfaceGrid.Columns.Items[10].Visible:=true; InterfaceGrid.Columns.Items[11].Visible:=true;
	  InterfaceGrid.Columns.Items[12].Visible:=true;

	  Qry.SQL.Text:='UPDATE bqrk.interface a SET a.mon=0,a.god=0 where a.num_row='
	  +ODSInterface.fieldByName('num_row').AsString;
	  Qry.Execute;
	 End;

OS.Commit;
end;

procedure TMain.OpenFile(FTL:string;QDF:boolean);
Var
i,kol,ErrCode,j,k,p:integer;
delta_days:real;
Rashod,last_pok,last_pok2,last_pokt1,last_pokt2,last_pokt3,last_pokt4,last_avg_rashp:real;
ResultPok,ResultPok1,ResultPok2,ResultPok3,ResultPok4:real;  
DatPok,DatPokS,Summa,Tarif1,Tarif2,Tarif3,Tarif4,CounterName,NewFileName,FileExt,rashodS:string;
DatPok1,DatPok2,DatPok3,DatPok4:string;
folder,NomSch,ErrMess,Stroka,fd,fn,summa_fnp,c:string;
ResultPokS,ResultPok1S,ResultPok2S,ResultPok3S,ResultPok4S:string;
last_pok_date,last_pok_date2,cur_pok_date,DatPokSDF,DatPok1DF,DatPok2DF,DatPok3DF,DatPok4DF,DatPokTemp:LPD;
s:boolean;
DatsMass: array [1..5] of LPD;
							 
Begin
kol:=0; kol_osh:=0; 

//перед составлением лога загрузить файл в мемо, дописать новое и сохранить.
LoadLog(s,true);
AutoAnalizerMemo.SelectAll;
AutoAnalizerMemo.CopyToClipboard;
AutoAnalizerMemo.Clear;
//если прога запускается с параметром или быстрый опрос то идем мимо диалога
If (ParamStr(1)='-a') or (QDF=true) then   //QDF - Quick Dial File
Begin
 If QDF=true then
  folder:='';
 If ParamStr(1)='-a' then 
  folder:='\'+Q_ReplaceText(ExtractFileName(FTL),'.csv','');
	
 fd:=ExtractFileDir(FTL);  //FTL - File To Load
 fn:=ExtractFileName(FTL);

 RE.Lines.LoadFromFile(fd+'\'+fn); 

  NewFileName:=ChangeFileExt(fd+'\'+fn,'.dat');
 If QDF=true then  
	WorkFileMemo.Lines.LoadFromFile(NewFileName);	
 
 If ParamStr(1)='-a' then 
	WorkFileMemo.Lines.LoadFromFile(fd+folder+'\'+ChangeFileExt(fn ,'.dat'));

//блок анализа неопросившихся и составления лога
AutoAnalizerMemo.Lines.Add(DateTimeToStr(Now));
AutoAnalizerMemo.Lines.Add(Chr(13));
k:=0; 
For j:=0 to WorkFileMemo.Lines.Count-1 do
 Begin  //ищем ключевое слово в логе работы бикварка
  i:=Q_PosStr('исчерпаны',WorkFileMemo.Lines.Strings[j],0);    	
  Stroka:=Copy(WorkFileMemo.Lines.Strings[j],i-12,11);

If i<>0 then 
  Begin
	Qry.Close;
	Qry.SQL.Text:='select con_name,dist from bqrk.con_points where phone_number='''+Stroka+'''';
	Qry.Execute;

	If Qry.RowCount<>0 then
	 Begin
	  inc(k);
	  AutoAnalizerMemo.Lines.Add('Шлюз '+Qry.Field(0)+'\'+Qry.Field(1)+' недоступен');
	 End;
	End;
 End;		 

AutoAnalizerMemo.Lines.Add('--------------------');
AutoAnalizerMemo.Lines.Add(IntToStr(k));
AutoAnalizerMemo.Lines.Add(Chr(13));

If k = 0 then //если нет ни одного неопросившегося шлюза, то можно удалить
//текущую писанину
 AutoAnalizerMemo.Clear;

AutoAnalizerMemo.PasteFromClipboard;

//в случае регулярного опроса нужно отловить параметр города
//т.к. меню выбора города не открывается при регулярном опросе
If ParamStr(1)='-a' then   
 //это строка для обычной версии программы
  NewFileName:=ExtractFilePath(NewFileName)+'LOG'+ParamStr(2)+'.txt'; 
 //в случае ручного опроса можно узнать какой город из меню выбора
If QDF=true then
 Begin
  If LoginForm.PCity='SKEK' then c:='-k';
  If LoginForm.PCity='LK' then c:='-l';
  NewFileName:='Y:\BQRK\LOG'+c+'.txt';
 End;

  AutoAnalizerMemo.Lines.SaveToFile(NewFileName);
End  
  Else 					 
If OD.Execute then
RE.Lines.LoadFromFile(OD.FileName);

pb.PartsComplete:=0;
PB.TotalParts:=RE.Lines.Count;

If ODSpokaz_temp.Active then 
ODSpokaz_temp.Close;

If ODSErrors_temp.Active then 
ODSErrors_temp.Close;

//процедура записи показаний из файла в базу во временную таблицу для  
//последующего переносав основную
 Qry.Close;
 Qry.SQL.Text:='Truncate table bqrk.pokaz_temp';
 Qry.Execute;

 Qry.Close;
 Qry.SQL.Text:='Truncate table bqrk.errors_temp';
 Qry.Execute;

//разбираем файл показаний в текстовом виде используя функцию вычленения подстрок с
//																        	указанным разделителем
 For i:=2 to RE.Lines.Count-2 do 
  Begin

	Rashod:=0;
	last_pok:=0; last_pokt1:=0; last_pokt2:=0; last_pokt3:=0;
	last_pokt4:=0; ResultPok:=0; ResultPok1:=0; ResultPok2:=0;
	ResultPok3:=0; ResultPok4:=0; 

	ErrCode:=0; ErrMess:='';

	NomSch:=MyGetStrPiece(RE.Lines.Strings[i],chr(9),5);

	DatPokS:=MyGetStrPiece(RE.Lines.Strings[i],chr(9),7);

	//если показания будут типа 0000 то функция trim уберет все символы
	//и оставит переменную пустой
	Summa:=Q_TrimCharLeft(MyGetStrPiece(RE.Lines.Strings[i],chr(9),9),'0');
	Tarif1:=Q_TrimCharLeft(MyGetStrPiece(RE.Lines.Strings[i],chr(9),11),'0');
	Tarif2:=Q_TrimCharLeft(MyGetStrPiece(RE.Lines.Strings[i],chr(9),13),'0');
	Tarif3:=Q_TrimCharLeft(MyGetStrPiece(RE.Lines.Strings[i],chr(9),15),'0');
	Tarif4:=Q_TrimCharLeft(MyGetStrPiece(RE.Lines.Strings[i],chr(9),17),'0');
  //если показания без точки, то отрезаем левые разряды
  If Q_PosText('.',Summa)=0 then
	Summa:=Q_CopyRight(Q_TrimCharLeft(MyGetStrPiece(RE.Lines.Strings[i],chr(9),9),'0'),4);
  If Q_PosText('.',Tarif1)=0 then
	Tarif1:=Q_CopyRight(Q_TrimCharLeft(MyGetStrPiece(RE.Lines.Strings[i],chr(9),11),'0'),4);
  If Q_PosText('.',Tarif2)=0 then
	Tarif2:=Q_CopyRight(Q_TrimCharLeft(MyGetStrPiece(RE.Lines.Strings[i],chr(9),13),'0'),4);
  If Q_PosText('.',Tarif3)=0 then
	Tarif3:=Q_CopyRight(Q_TrimCharLeft(MyGetStrPiece(RE.Lines.Strings[i],chr(9),15),'0'),4);
  If Q_PosText('.',Tarif4)=0 then
	Tarif4:=Q_CopyRight(Q_TrimCharLeft(MyGetStrPiece(RE.Lines.Strings[i],chr(9),17),'0'),4);

	DatPok1:=MyGetStrPiece(RE.Lines.Strings[i],chr(9),10);
	DatPok2:=MyGetStrPiece(RE.Lines.Strings[i],chr(9),12);
	DatPok3:=MyGetStrPiece(RE.Lines.Strings[i],chr(9),14);
	DatPok4:=MyGetStrPiece(RE.Lines.Strings[i],chr(9),16);

	If NomSch<>'' then
	 Begin
	  Qry.Close;
	  Qry.SQL.Text:='Select last_pok,counter_name,date_last_pok,last_pokt1,last_pokt2,last_pokt3,last_pokt4,last_avg_rash '+
							'from bqrk.counters where serial_number='''+NomSch+''''
							+' and serial_number<>''0''';
	  Qry.Execute;

	If Qry.RowCount=0 then
		Continue;

	  Last_Pok:=Qry.Field(0);
	  CounterName:=Qry.Field(1);
	  last_pok_date:=Qry.Field(2);

	  Last_PokT1:=Qry.Field(3);
	  Last_PokT2:=Qry.Field(4);
	  Last_PokT3:=Qry.Field(5);
	  Last_PokT4:=Qry.Field(6);

	  Last_avg_rashp:=Qry.Field(7);
	End;
	
	If NomSch='' then 
	 ErrCode:=1; //нет серийного номера 
	If ((DatPokS='****') or (DatPokS='----')) and     //если нет ни одной даты
		((DatPok1='****') or (DatPok1='----')) and
		((DatPok2='****') or (DatPok2='----')) and 
		((DatPok3='****') or (DatPok3='----')) and
		((DatPok4='****') or (DatPok4='----')) then 
  ErrCode:=2; //нет данных

	If ((DatPokS<>'****') and (DatPokS<>'----')) or   //если есть хотя бы одна дата
		((DatPok1<>'****') and (DatPok1<>'----')) or
		((DatPok2<>'****') and (DatPok2<>'----')) or
		((DatPok3<>'****') and (DatPok3<>'----')) or
		((DatPok4<>'****') and (DatPok4<>'----')) then
	 Begin
	  Try

If (DatPokS<>'****') and (DatPokS<>'----') then
DatPokSDF:=StrToDate(Copy(DatPokS,1,5)+'.'+Copy(DateToStr(Date),7,8));
If (DatPokS='****') or (DatPokS='----') then
DatPokSDF:=0;

If (DatPok1<>'****') and (DatPok1<>'----') then
DatPok1DF:=StrToDate(Copy(DatPok1,1,5)+'.'+Copy(DateToStr(Date),7,8));
If (DatPok1='****') or (DatPok1='----') then
DatPok1DF:=0;

If (DatPok2<>'****') and (DatPok2<>'----') then
DatPok2DF:=StrToDate(Copy(DatPok2,1,5)+'.'+Copy(DateToStr(Date),7,8));
If (DatPok2='****') or (DatPok2='----') then
DatPok2DF:=0;

If (DatPok3<>'****') and (DatPok3<>'----') then
DatPok3DF:=StrToDate(Copy(DatPok3,1,5)+'.'+Copy(DateToStr(Date),7,8));
If (DatPok3='****') or (DatPok3='----') then
DatPok3DF:=0;

If (DatPok4<>'****') and (DatPok4<>'----') then
DatPok4DF:=StrToDate(Copy(DatPok4,1,5)+'.'+Copy(DateToStr(Date),7,8));
If (DatPok4='****') or (DatPok4='----') then
DatPok4DF:=0;

//помещаем даты в массив для сортировки
DatsMass[1]:=DatPokSdf;
DatsMass[2]:=DatPok1df;
DatsMass[3]:=DatPok2df;
DatsMass[4]:=DatPok3df;
DatsMass[5]:=DatPok4df;

//-----------------------------------------------------------
//выбираем наибольшую дату 
If not ((DatPokSdf=0) and (DatPok1df=0) and (DatPok2df=0) and (DatPok3df=0) and (DatPok4df=0)) then
Begin
 //метод пузырька
 for k:=1 to 5 do 
  for p:=1 to 5-k do 
	if DatsMass[p]>DatsMass[p+1] then 
	  begin
		DatPokTemp:=DatsMass[p]; 
		DatsMass[p]:=DatsMass[p+1]; 
		DatsMass[p+1]:=DatPokTemp; 
	  end; 
 DatPok:=DateToStr(DatsMass[5]);    
End;

If (Summa='****') or (Summa='----') or (Summa='') then
Summa:='0';
//считаем кол-во дней между предыдущим показанием и вновь полученным (текущим)
delta_days:=StrToDate(DatPok)-last_pok_date;    
//если разница в днях больше 998 то задаем один день 
//важно для новых счетчиков, у которых нет даты предыдущих показаний
If delta_days>998 then delta_days:=1;

If delta_days>0 then    //если дата измениалсь то есть смысл вести расчеты, а если нет
 Begin		   			//то в итоге в любом случае вылетит в ошибки
 //сумма 
  If  (DatPokS<>'****') and (DatPokS<>'----') then
	Begin
	 Summa:=Q_ReplaceText(Summa,'.',',');
	  If StrToFloat(Summa)<last_pok then  //отрицательный расход
		Begin
		 FixNUpdate(NomSch,StrToFloat(Summa),Last_Pok,ResultPok,Rashod); //исправляем
		  If Rashod<0 then ErrCode:=3; //отрицательный расход не был корректно исправлен
												 //следовательно ошибка и в базу не пишем 
		  //Если расход больше 1000, то попадаем в условие
			 If Rashod>1000 then
			  If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5;
			 
			RashodS:=FloatToStr(rashod);
		End
  Else //расход нормальный
	Begin                                
	 ResultPok:=StrToFloat(Summa);
	 Rashod:=StrToFloat(Summa)-Last_Pok;
	 RashodS:=FloatToStr(Rashod);  
	  //If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5; //ошибка перерасхода
	   //Если расход больше 1000, то попадаем в условие
			 If Rashod>1000 then
			  If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5;
	End;
 End;
 
  //первый тариф
  If  (DatPok1<>'****') and (DatPok1<>'----') then
	Begin
	 Tarif1:=Q_ReplaceText(Tarif1,'.',',');
	  If StrToFloat(Tarif1)<last_pokt1 then //отрицательный расход 
		Begin
		 FixNUpdate(NomSch,StrToFloat(Tarif1),Last_PokT1,ResultPok1,Rashod); //исправляем
		  If Rashod<0 then ErrCode:=3; //отрицательный расход не был корректно исправлен
		  //If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5; //ошибка перерасхода
		//If Rashod>300*delta_days then ErrCode:=5;					  //следовательно ошибка и в базу не пишем 
		  //Если расход больше 1000, то попадаем в условие
			 If Rashod>1000 then
			  If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5;
     RashodS:=FloatToStr(Rashod);
		End
 Else //расход нормальный
  Begin
	ResultPok1:=StrToFloat(Tarif1);
	Rashod:=StrToFloat(Tarif1)-Last_PokT1;
	RashodS:=FloatToStr(rashod);
	 //If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5; //ошибка перерасхода
	 //If Rashod>300*delta_days then ErrCode:=5;					  //следовательно ошибка и в базу не пишем 
		  //Если расход больше 1000, то попадаем в условие
			 If Rashod>1000 then
			  If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5;
  End;
End;

//Тариф 2
If (DatPok2<>'****') and (DatPok2<>'----') then
 Begin
  Tarif2:=Q_ReplaceText(Tarif2,'.',',');
	if StrToFloat(Tarif2)<last_pokt2 then 
	 Begin
	  FixNUpdate(NomSch,StrToFloat(Tarif2),Last_PokT2,ResultPok2,Rashod); //исправляем
		If rashod<0 then ErrCode:=3; //отрицательный расход не был корректно исправлен
		//If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5; //ошибка перерасхода
//If Rashod>300*delta_days then ErrCode:=5;					  //следовательно ошибка и в базу не пишем 
		  //Если расход больше 1000, то попадаем в условие
			 If Rashod>1000 then
			  If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5;
		RashodS:=FloatToStr(rashod);
	 End
 Else //расход нормальный
  Begin
	ResultPok2:=StrToFloat(Tarif2);
	Rashod:=StrToFloat(Tarif2)-Last_PokT2;
	RashodS:=FloatToStr(rashod); 
	 //If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5; //ошибка перерасхода
	 //If Rashod>300*delta_days then ErrCode:=5;					  //следовательно ошибка и в базу не пишем 
		  //Если расход больше 1000, то попадаем в условие
			 If Rashod>1000 then
			  If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5;
  End;
End;

//тариф 3
If (DatPok3<>'****') and (DatPok3<>'----') then
 begin
  Tarif3:=Q_ReplaceText(Tarif3,'.',',');
	if StrToFloat(Tarif3)<last_pokt3 then 
	 begin
	  FixNUpdate(NomSch,StrToFloat(Tarif3),Last_PokT3,ResultPok3,Rashod); //исправляем
		If rashod<0 then ErrCode:=3; //отрицательный расход не был корректно исправлен
		//If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5; //ошибка перерасхода
		RashodS:=FloatToStr(Rashod);
		//If Rashod>300*delta_days then ErrCode:=5;					  //следовательно ошибка и в базу не пишем 
		  //Если расход больше 1000, то попадаем в условие
			 If Rashod>1000 then
			  If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5;
	 end
 else //расход нормальный
  begin
	ResultPok3:=StrToFloat(Tarif3);
	Rashod:=StrToFloat(Tarif3)-Last_PokT3;
	RashodS:=FloatToStr(rashod); 
	 //If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5; //ошибка перерасхода
	 //If Rashod>300*delta_days then ErrCode:=5;					  //следовательно ошибка и в базу не пишем 
		  //Если расход больше 1000, то попадаем в условие
			 If Rashod>1000 then
			  If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5;
  end;
end;

//тариф 4
If (DatPok4<>'****') and (DatPok4<>'----') then
 begin
  Tarif4:=Q_ReplaceText(Tarif4,'.',',');
	If StrToFloat(Tarif4)<last_pokt4 then 
	 Begin
	  FixNUpdate(NomSch,StrToFloat(Tarif4),Last_PokT4,ResultPok4,Rashod); //исправляем
		If rashod<0  then ErrCode:=3; //отрицательный расход не был корректно исправлен
		//If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5; //ошибка перерасхода
		//If Rashod>300*delta_days then ErrCode:=5;					  //следовательно ошибка и в базу не пишем 
		  //Если расход больше 1000, то попадаем в условие
			 If Rashod>1000 then
			  If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5;
		RashodS:=FloatToStr(rashod);
	 End
 else //расход нормальный
  begin
	ResultPok4:=StrToFloat(Tarif4);
	Rashod:=StrToFloat(Tarif4)-Last_PokT4;
	RashodS:=FloatToStr(rashod); 
	 //If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5; //ошибка перерасхода
	 //If Rashod>300*delta_days then ErrCode:=5;					  //следовательно ошибка и в базу не пишем 
		  //Если расход больше 1000, то попадаем в условие
			 If Rashod>1000 then
			  If (Rashod/delta_days)>(1.5*Last_avg_rashp) then ErrCode:=5;
  end;
 end;  
end; //конец условия If delta_days>0 then
 except  //конец try
  PB.IncPartsByOne;                
  Continue;
 end;
   //если показания встали
	If (delta_days=0) or (delta_days<0) then
		ErrCode:=4;//дата не изменилась
	End;

	Case ErrCode of
			1:ErrMess:='Нет серийного номера';
			2:ErrMess:='Нет данных';
			3:ErrMess:='Отрицательный расход';
			4:ErrMess:='Дата не изменилась';
			5:ErrMess:='Перерасход';
	end;
	//если прошло не без ошибок
	If ErrCode<>0 then 
	 Begin
	 //отрезаем правые 4 символа чтобы записать их в таблицу ошибок
	 summa_fnp:=Q_CopyRight(summa,4);

	  inc(kol_osh);
	  //временная таблица ошибок
		Qry.Close;  
		Qry.SQL.Text:='insert into bqrk.errors_temp values ('''+NomSch+''','''+CounterName+''','''+ErrMess+''''+',sysdate,'+''''+summa_fnp+''')';
		Qry.Execute; PB.IncPartsByOne;
	Continue;//если код ошибки не 0 то переходим на следующую итерацию цикла, не записывая показяния
	 End
	else
	 inc(kol);

	//заливаем показания во временную таблицу	
				 
if (summa='****') or (summa='----') then ResultPokS:='0';
if (tarif1='****') or (tarif1='----') then ResultPok1S:='0';
if (tarif2='****') or (tarif2='----') then ResultPok2S:='0';
if (tarif3='****') or (tarif3='----') then ResultPok3S:='0';
if (tarif4='****') or (tarif4='----') then ResultPok4S:='0';
if rashod=0 then RashodS:='0';

ResultPokS:=FloatToStr(ResultPok);
ResultPok1S:=FloatToStr(ResultPok1);
ResultPok2S:=FloatToStr(ResultPok2);
ResultPok3S:=FloatToStr(ResultPok3);
ResultPok4S:=FloatToStr(ResultPok4);
				
ResultPokS:=Q_ReplaceText(ResultPokS,',','.');
ResultPok1S:=Q_ReplaceText(ResultPok1S,',','.');
ResultPok2S:=Q_ReplaceText(ResultPok2S,',','.');
ResultPok3S:=Q_ReplaceText(ResultPok3S,',','.');
ResultPok4S:=Q_ReplaceText(ResultPok4S,',','.');  
 
if Summa<>'0' then 
Summa:=Q_ReplaceText(Summa,',','.'); 

rashodS:=Q_ReplaceText(rashodS,',','.');
			 
	Qry.Close;  
	Qry.SQL.Text:='Insert into bqrk.pokaz_temp (id_counter,id_concentrator,id_con,date_pok,summ,serial_number,rashod,tarif1,tarif2,tarif3,tarif4,fnp,delta_days)'+ 
						'values ((Select id_counter from bqrk.counters where serial_number='''+NomSch+''''
						+'),(Select id_concentrator from bqrk.counters where serial_number='''+NomSch+''''
						+'),(Select id_con from bqrk.counters where serial_number='''+NomSch+''''
						+'),trunc(to_date('''+DatPok+''',''dd.mm hh24:mi'')),'+ResultPokS+','+''''+NomSch+''','+rashodS
						+','+ResultPok1S+','+ResultPok2S+','+ResultPok3S
						+','+ResultPok4S+','+summa+','+FloatToStr(delta_days)+')'; 
  try
	Qry.Execute;
  except  
	//ловим исключения оракла
	on E:EOracleError do
		begin 
		//отрезаем правые 4 символа чтобы записать их в таблицу ошибок
		summa_fnp:=Q_CopyRight(summa,4);
		 //льем в БД
		 if E.ErrorCode=1830 then ErrMess:='Неверный формат даты';
		 if E.ErrorCode=1427 then ErrMess:='Повторяется серийный номер';
		 if E.ErrorCode=1438 then ErrMess:='Значение превышает заданную точность';
		 Qry.Close;  
		 Qry.SQL.Text:='insert into bqrk.errors_temp values ('''+NomSch+''','''+CounterName+''','''+ErrMess+''''+',sysdate,'+''''+summa_fnp+''')';
		 Qry.Execute;

		 inc(kol_osh); PB.IncPartsByOne;
		 Continue;
		end; 
  end;

PB.IncPartsByOne;	
 end;
 OS.Commit; 

If not ODSpokaz_temp.Active then ODSpokaz_temp.Open;
If not ODSerrors_temp.Active then ODSerrors_temp.Open;

ODSpokaz_temp.Refresh;
ODSerrors_temp.Refresh;

Label6.Caption:=IntToStr(ODSPokaz_temp.RecordCount);
Label8.Caption:=IntToStr(ODSErrors_temp.RecordCount);
end;

procedure TMain.RzBitBtn9Click(Sender: TObject);
begin
Qry.Clear;
Qry.SQL.add('delete from bqrk.errors_temp');
Qry.Execute;

 OpenFile('',false);
end;

procedure TMain.RzBitBtn10Click(Sender: TObject);
begin

 PokazToDataBase;
end;

procedure TMain.FormCreate(Sender: TObject);
var
FileToLoad,BaseCity:string;
begin
  //можно присвоить метод (сворачивание, прячем в трей)
  Application.OnMinimize:=ApplicationMinimize;

  OS.Connected:=false;
  Label9.Caption:=bquark_vers;
  PropList:=TStringList.Create;//сие есть список возможных значений поля filter в выпадающем списке
 //если прога запускается с параметрами 
  //то запоминаем файл с показаниями который будем загружать
  //и выходим после загрузки

 If ParamCount<>0 then 
  Begin
	FileToLoad:='Y:\BQRK\'+ParamStr(3); //путь к файлу с показаниями при
													//ежедневном опросе
	BaseCity:=ParamStr(2);

	if BaseCity='-k' then OracleString:='ORCL.LOCAL.SKEK.RU';
	if BaseCity='-l' then OracleString:='ORCLLEN.LOCAL.SKEK.RU';

	OS.LogonUserName:='bqrk';
	OS.LogonPassword:='bqrk';
	OS.LogonDatabase:=OracleString;

	OracleString:=OS.LogonDatabase;
	
	OS.Connected:=true; 

  try
	OpenFile(FileToLoad,false);	   
  except
	//ShowMessage('Ошибка при открытии файла при ночном опросе '+BaseCity+' '+DateToStr(Date));
	Application.Terminate;
  end;
  
  try
	PokazToDataBase;
  except
	//ShowMessage('Ошибка при загрузки данных в базу при ночном опросе '+BaseCity+' '+DateToStr(Date));
	Application.Terminate;
  end;

	Application.Terminate;
  End;
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
 try
  PropList.Free; //IstList.Free;
 except
  ShowMessage('упс');
 end;
end;

procedure TMain.PokazToDataBase;
var
id_counter,id_concentrator,id_con,delta_days:integer;
rashod,summ,tarif1,tarif2,tarif3,tarif4:real;
fnp,rashodS,summS,tarif1S,tarif2S,tarif3S,tarif4S:string;
serial_number,comments:string;
date_pok:variant;

Begin

If ODSpokaz_temp.Active=false then ODSpokaz_temp.Open;
If ODSErrors_temp.Active=false then ODSErrors_temp.Open;

 ODSpokaz_temp.First;
	//заливаем построчно из pokaz_temp в pokaz
	While not ODSpokaz_temp.EOF do
	 begin
	  id_counter:=ODSpokaz_temp.FieldByName('id_counter').AsInteger;
	  id_concentrator:=ODSpokaz_temp.FieldByName('id_concentrator').AsInteger;
	  id_con:=ODSpokaz_temp.FieldByName('id_con').AsInteger;
	  date_pok:=ODSpokaz_temp.FieldByName('date_pok').AsVariant;
	 
	  summ:=ODSpokaz_temp.FieldByName('summ').AsFloat;
	  comments:=ODSpokaz_temp.FieldByName('comments').AsString;
	  serial_number:=ODSpokaz_temp.FieldByName('serial_number').AsString;
	  rashod:=ODSpokaz_temp.FieldByName('rashod').AsFloat;	

	  delta_days:=ODSpokaz_temp.FieldByName('delta_days').AsInteger;
	  fnp:=IntToStr(ODSpokaz_temp.FieldByName('fnp').AsInteger);

	  tarif1:=ODSpokaz_temp.FieldByName('tarif1').AsFloat;
	  tarif2:=ODSpokaz_temp.FieldByName('tarif2').AsFloat;
	  tarif3:=ODSpokaz_temp.FieldByName('tarif3').AsFloat;
	  tarif4:=ODSpokaz_temp.FieldByName('tarif4').AsFloat;

	  SummS:= Q_ReplaceText(FloatToStr(Summ),',','.');
	  Tarif1S:= Q_ReplaceText(FloatToStr(Tarif1),',','.');
	  Tarif2S:= Q_ReplaceText(FloatToStr(Tarif2),',','.');
	  Tarif3S:= Q_ReplaceText(FloatToStr(Tarif3),',','.');
	  Tarif4S:= Q_ReplaceText(FloatToStr(Tarif4),',','.');
	  RashodS:= Q_ReplaceText(FloatToStr(Rashod),',','.');

	  Qry.Close;
	  Qry.SQL.Text:='insert into bqrk.pokaz (id_counter,id_concentrator,'
						 +'id_con,date_pok,summ,comments,serial_number,rashod,tarif1,tarif2,tarif3,tarif4,fnp,delta_days) values ('+IntToStr(id_counter)
						 +','+IntToStr(id_concentrator)+','+IntToStr(id_con)
						 +','''+VarToStr(date_pok)+''','+SummS
						 +','''+comments+''','''+serial_number+''','+RashodS
						 +','+Tarif1S+','+Tarif2S+','+Tarif3S
						 +','+Tarif4S+','+fnp+','+IntToStr(delta_days)+')';

	try
	  Qry.Execute;
	 except    
	  ODSpokaz_temp.Next;
	  end;
	 ODSpokaz_temp.Next;
	 end;
//заливаем ошибки	
Qry.Close;
Qry.SQL.Text:='insert into bqrk.errors a'+
					' (select * from bqrk.errors_temp minus select * from bqrk.errors)';
Qry.Execute;

OS.Commit;

ODSPokaz_temp.Refresh;
ODSErrors_temp.Refresh;

If not (ParamStr(1)='-a') then
//ShowMessage('Показаний загружено: '+IntToStr(ODSpokaz_temp.RecordCount));
PokazLoadedLabel.Caption:='Загружено: '+IntToStr(ODSpokaz_temp.RecordCount);
								
End;

procedure TMain.RzBitBtn11Click(Sender: TObject);
begin
 If SD.Execute then
  RichErrors.Lines.SaveToFile(SD.FileName);
end;

procedure TMain.InStar1Click(Sender: TObject);
begin
 TransForm.ShowModal;
end;

procedure TMain.SaveImageToFile(img: TImage);
begin
if img.Picture.Graphic <> nil then
	if SPD.Execute=true then
	 img.Picture.SaveToFile(SPD.FileName);
end;

procedure TMain.RzBitBtn13Click(Sender: TObject);
var
i:integer;
begin
If StructureTree.Items.count>0 then
 for i:=0 to StructureTree.Items.count-1 do
  StructureTree.Items.Item[i].Expand(false);
end;

procedure TMain.ExpandTree(Tree:TRzTreeView);
var
i:integer;
begin
If Tree.Items.count>0 then
 for i:=0 to Tree.Items.count-1 do
  Tree.Items.Item[i].Expand(false);
end;

procedure TMain.CollapseTree(Tree:TRzTreeView);
var
i:integer;
begin
If Tree.Items.count>0 then
 for i:=0 to Tree.Items.count-1 do
  Tree.Items.Item[i].Collapse(false);
end;

procedure TMain.RefreshButtClick(Sender: TObject);
begin
 LoadWholeTree;
end;

procedure TMain.CollapseButtClick(Sender: TObject);
var
Save_Cursor:TCursor;

begin
 Save_Cursor := Screen.Cursor;
 Screen.Cursor := crHourGlass;
  CollapseTree(StructureTree);
 Screen.Cursor := Save_Cursor;
end;

procedure TMain.RzToolbarButton3Click(Sender: TObject);
begin
 LoadWholeTree;
end;

procedure TMain.RzToolbarButton4Click(Sender: TObject);
begin
 Delete(StructureTree);
end;

procedure TMain.RzToolbarButton7Click(Sender: TObject);
begin
 Delete(StructureTreeCur);
end;

procedure TMain.RzToolbarButton5Click(Sender: TObject);
var
Save_Cursor:TCursor;

begin
 Save_Cursor := Screen.Cursor;
 Screen.Cursor := crHourGlass;
  ExpandTree(StructureTreeCur);
 Screen.Cursor := Save_Cursor;
end;                                                   

procedure TMain.RzToolbarButton6Click(Sender: TObject);
var
Save_Cursor:TCursor;

begin
 Save_Cursor := Screen.Cursor;
 Screen.Cursor := crHourGlass;
  CollapseTree(StructureTreeCur);
 Screen.Cursor := Save_Cursor;


end;

procedure TMain.TrimWorkingSet;
var
MainHandle: THandle;
begin
 If Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
	MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
	SetProcessWorkingSetSize(MainHandle, DWORD(-1), DWORD(-1));
	CloseHandle(MainHandle);
  end;
end; 

procedure TMain.QuickDial(To1000:boolean);
var
YStart,MStart,DStart,HStart,MinStart,s,m:Word;
begin

If SearchForm.Showing=true
then
SearchForm.Hide;

//процедура быстрого опроса
//ищем файл быстрого опроса и если он есть удаляем его
If FileExists('C:\BQuark\QuickDial.dat')=true then 
DeleteFile('C:\BQuark\QuickDial.dat');

If FileExists('C:\BQuark\QuickDial.csv')=true then 
DeleteFile('C:\BQuark\QuickDial.csv');

DecodeDateTime(Now,YStart,MStart,DStart,HStart,MinStart,s,m);

//генерим и сохраняем новый файл
If To1000=false then
 GenObjButt.Click;

DefaultInterface;
 
WorkFileMemo.Lines.SaveToFile('C:\BQuark\QuickDial.dat');

//запускаем бикварк с "быстрым" файлом
Launcher.FileName:='C:\BQuark\'+bquark_vers;

Launcher.Parameters:='C:\BQuark\QuickDial.dat';
Launcher.WaitType:=wtFullStop;
Launcher.WaitUntilFinished:=true;

Launcher.Launch;

If OpenAfterDialCB.Checked=true then
 Begin
  Launcher.Parameters:='';
  Launcher.WaitType:=wtFullStop;
  Launcher.WaitUntilFinished:=false;
  Launcher.Launch;
 End;
End;

procedure TMain.RzBitBtn6Click(Sender: TObject);
begin
OP.CallProcedure('insert_addfields',
		[ODSAddFieldsSprav.FieldByName('id_node').AsInteger]);
end;

procedure TMain.LauncherFinished(Sender: TObject);
var
stroka:string;
i,j:integer;
begin
 AutoAnalizerMemo.Lines.Clear;
//после отработки бикварка в режиме быстрого опроса прыгаем на вкладку загрузки
 Generation_Tab.ActivePageIndex:=3;
 OpenFile('C:\BQuark\QuickDial.csv',true);
 WorkFileMemo.Lines.LoadFromFile('C:\BQuark\QuickDial.dat');
 //если стоит галка автоматической загрузки показаний
 If AutoLoadCB.Checked = true then
 PokazToDataBase;

For j:=0 to WorkFileMemo.Lines.Count-1 do
 begin
  i:=Q_PosStr('получено',WorkFileMemo.Lines.Strings[j],0);
  Stroka:=Copy(WorkFileMemo.Lines.Strings[j],i-20,40);
  
if i<>0 then 
 AutoAnalizerMemo.Lines.Add(stroka);
 end;   

 ODSErrorsDetail.Active:=true;
 ODSPokazTempDetail.Active:=true;
end;

procedure TMain.RzSizePanel1HotSpotClick(Sender: TObject);
begin
if RzSizePanel1.HotSpotClosed=true then
 StructureTreeCur.Width:=StructureTreeCur.Width*2
else
 StructureTreeCur.Width:=StructureTreeCur.Width div 2;
end;

procedure TMain.N5Click(Sender: TObject);
begin
Reports.ShowModal;
end;

procedure TMain.testClick(Sender: TObject);
begin
if OD.Execute then
 RE.Lines.loadFromFile(OD.Filename);
end;

procedure TMain.FixNUpdate(Serial:string; CurrentPokaz,LastPokaz:real;
 var ResultPokaz,Rashod:real);
var
id_counter,id_concentrator,id_con,kol_vo_dayz:integer;
delta:real;

begin
	While CurrentPokaz<LastPokaz do
		CurrentPokaz:=CurrentPokaz+10000;
	  //рассчитываем расход для послед. анализа
		Rashod:=CurrentPokaz-LastPokaz;
	  //если был лишний перескок то откатываем обратно
		if Rashod>8000 then
		 begin
			CurrentPokaz:=CurrentPokaz-10000;
			Rashod:=CurrentPokaz-LastPokaz;
		 end;
	  //возвращаем расход и исправленные показания
	 if CurrentPokaz>LastPokaz then
		ResultPokaz:=CurrentPokaz  
	 //если показания не были некорректно исправлены то присваиваем последние
	 else
		ResultPokaz:=LastPokaz;
end;

procedure TMain.RzBitBtn15Click(Sender: TObject);
var
i,j:integer;
stroka:string;
begin
if od.Execute then
Begin
 WorkFileMemo.Lines.LoadFromFile(OD.FileName);
 FileToExcel:=OD.FileName;
End;

For j:=0 to WorkFileMemo.Lines.Count-1 do
 begin
  i:=Q_PosStr('исчерпаны',WorkFileMemo.Lines.Strings[j],0);    
  Stroka:=Copy(WorkFileMemo.Lines.Strings[j],i-12,11);

if i<>0 then 
  begin
	Qry.Close;
	Qry.SQL.Text:='select con_name,dist from bqrk.con_points where phone_number='''+Stroka+'''';
	Qry.Execute;

	if Qry.RowCount<>0 then
	 AutoAnalizerMemo.Lines.Add('Шлюз '+Qry.Field(0)+'\'+Qry.Field(1)+' недоступен');
  end;
 end;	

OpenExcel.Enabled:=true;		 
end;

//блок процедур перетаскивания узлов в дереве StructureTree с изменениями в БД
procedure TMain.MoveNode(TargetNode, SourceNode: TTreeNode; TargetConcAddr:Integer);
var
  nodeTmp: TTreeNode;
  ObjType,i: Integer;

  NodeRec:NodeItemRec;
  NodePtr:PNodeItemRec;

begin
  with StructureTree do
  begin
	 nodeTmp := Items.AddChild(TargetNode, SourceNode.Text);;
	 for i := 0 to SourceNode.Count - 1 do
	 begin
		MoveNode(nodeTmp, SourceNode.Item[i],TargetConcAddr);
	 end;
  end;
nodeTmp.Assign(SourceNode);
PNodeItemRec(nodeTmp.Data)^.ID_Parent:=TargetConcAddr;
end;

procedure TMain.StructureTreeDragDrop(Sender, Source: TObject; X,
  Y: Integer);
  var
  TargetNode, SourceNode: TTreeNode;
  ObjTypeSource,ObjTypeTarget,TargetNodeParentID,SourceNodeParentID: Integer;
  SourceNodeRootID,TargetNodeID,SourceNodeID: Integer;
  SourceConcAddr,TargetConcAddr:integer;
  SqlStr:string;
  Save_Cursor:TCursor;

begin
Save_Cursor := Screen.Cursor;
Screen.Cursor := crHourGlass;

 With StructureTree do
  begin

	TargetNode := GetNodeAt(X, Y); // Get target node
	SourceNode := Selected;
	
	ObjTypeSource:=PNodeItemRec(SourceNode.Data)^.Object_id;
	ObjTypeTarget:=PNodeItemRec(TargetNode.Data)^.Object_id;
	//айдишники родительских узлов
	TargetNodeParentID:=PNodeItemRec(TargetNode.Data)^.ID_Parent;
	SourceNodeParentID:=PNodeItemRec(SourceNode.Data)^.ID_Parent;
 try
	SourceNodeRootID:= PNodeItemRec(SourceNode.Parent.Data)^.ID_Parent;
 except
	Screen.Cursor :=Save_cursor;
	Exit;
 end;	
	//айдишники непосредственно узлов цели и источника
	TargetNodeID:= PNodeItemRec(TargetNode.Data)^.ID_Node;
	SourceNodeID:= PNodeItemRec(SourceNode.Data)^.ID_Node;
	//обработка ограничений по переносу узлов дерева
	//одинаковые типы узлов
	if ObjTypeSource=ObjTypeTarget then 
	 Begin
      //если счетчик на счетчик, то вызываем процедуру копирования
		If (ObjTypeSource=2003) and (ObjTypeTarget=2003) then
		  If MessageDlg('Вы уверены что хотите копировать?',
			mtConfirmation, [mbYes, mbNo], 0) = mrYes then 	  
			 Begin
			  CopyCounterInfo(TargetNodeID,SourceNodeID);
			  TargetNode.Text:=SourceNode.Text;
			 End;
	  Screen.Cursor :=Save_cursor;
	  Exit;
	 end;
	//счетчик на GSM шлюз
	if (ObjTypeSource=2003) and ((ObjTypeTarget=1002) or (ObjTypeTarget=1001)) then 
	 Begin
	  Screen.Cursor :=Save_cursor;
	  Exit;
	 end;
	 //счетчик на GPRS шлюз
	if (ObjTypeSource=2003) and (ObjTypeTarget=1003) then 
	 Begin 
		Screen.Cursor := Save_cursor;	 
      Exit;
	 end;
	//GSM шлюз на концентратор
	 if ((ObjTypeSource=1002) or (ObjTypeSource=1001)) and (ObjTypeTarget=2001) then
	 Begin
	  Screen.Cursor :=Save_cursor;
	  Exit;
	 end;
	//GPRS шлюз на концентратор
	 if (ObjTypeSource=1003) and (ObjTypeTarget=2001) then 
	 Begin
	  Screen.Cursor :=Save_cursor;
	  Exit;
	 end;
	//GSM шлюз на счетчик
	if ((ObjTypeSource=1002) or (ObjTypeSource=1001)) and (ObjTypeTarget=2003) then 
	 Begin
	  Screen.Cursor :=Save_cursor;
	  Exit;
	 end;
	//GPRS шлюз на счетчик
	if (ObjTypeSource=1003) and (ObjTypeTarget=2003) then 
	 Begin
	  Screen.Cursor :=Save_cursor;
	  Exit;
	 end;
	//концентратор на счетчик
	if (ObjTypeSource=2001) and (ObjTypeTarget=2003) then 
	 Begin
	  Screen.Cursor :=Save_cursor;
	  Exit;
	 end;
	//концентратор_1 на GSM  шлюз
	if (ObjTypeSource=2001) and ((ObjTypeTarget=1002) or (ObjTypeTarget=1001)) then 
	 Begin
	  Screen.Cursor :=Save_cursor;
	  Exit;
	 end;
	//концентратор_1 на GPRS  шлюз
	if (ObjTypeSource=2001) and (ObjTypeTarget=1003) then 
	 Begin
	  Screen.Cursor :=Save_cursor;
	  Exit;
	 end;

	if (TargetNode = nil) then
	 begin
		EndDrag(False);
		Screen.Cursor :=Save_cursor;
		Exit;
	 end;
  //фиксируем изменения в базе 
  //счетчик на концентратор
	if (ObjTypeSource=2003) and (ObjTypeTarget=2001) then
	 begin      
  //отключаем констраинт для перепривязки
  OnOffConstraints(0);
  //обновляем структуру в таблице показаний
	 SqlStr:='Update bqrk.pokaz set id_concentrator='+IntToStr(TargetNodeID)
		+ ',id_con='+IntToStr(TargetNodeParentID)+' where id_counter='+IntToStr(SourceNodeID);
	
	 Qry.Close;
	 Qry.SQL.Text:=SqlStr;
	 Qry.Execute;
	 OS.Commit;
  //обновляем	сам счетчик
  //запрашиваем концентраторы по нему для изменения в названии (старый и новый)
	 SqlStr:='Select a.concentrator_address from bqrk.concentrator_points a where'
				+' a.id_concentrator in ('+IntToStr(SourceNodeParentID)+','+IntToStr(TargetNodeID)+')';
	 AdditionalODS.Close;
	 AdditionalODS.SQL.Text:=SqlStr;
	 AdditionalODS.Open;
	 
	 AdditionalODS.First; //старый
	 TargetConcAddr:=AdditionalODS.FieldByName('concentrator_address').AsInteger;
	 AdditionalODS.Next;  //новый
	 SourceConcAddr:=AdditionalODS.FieldByName('concentrator_address').AsInteger;

  //обновляем концентратор
	 SqlStr:='Update bqrk.counters set id_concentrator='+IntToStr(TargetNodeID)
		+ ',id_con='+IntToStr(TargetNodeParentID)+' where id_counter='+IntToStr(SourceNodeID);
	 Qry.Close;
	 Qry.SQL.Text:=SqlStr;
	 Qry.Execute;
	 OS.Commit;
  //обновляем наименование объекта, изменяем концентратор в наименовании
	 SqlStr:='Update bqrk.counters set counter_name=replace(counter_name,'+
				IntToStr(SourceConcAddr)+','+IntToStr(TargetConcAddr)+') where id_counter='
				+IntToStr(SourceNodeID);

	 Qry.Close;
	 Qry.SQL.Text:=SqlStr;
	 Qry.Execute;
	 OS.Commit;
	//включаем констраинт
	OnOffConstraints(1);
		end;
  //непосредственно перемещение и удаление источника
	 MoveNode(TargetNode, SourceNode,TargetNodeID);
	 SourceNode.Free;
  end;
Screen.Cursor :=Save_cursor;
end;

procedure TMain.StructureTreeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
	 if (Sender = StructureTree) then // If TRUE then accept the draged item
  begin
	 Accept := True;
  end;
end;
/////////////////////////////////////////////////////////////////////////////////
//блок процедур перетаскивания узлов в дереве StructureTreeСur без изменений в БД
/////////////////////////////////////////////////////////////////////////////////
procedure TMain.StructureTreeCurDragDrop(Sender, Source: TObject; X,
  Y: Integer);
  var
  nodeTmp,nodeTmpNew,nodeTmpNext,TargetNode, SourceNode: TTreeNode;
  ObjTypeSource,ObjTypeTarget,TargetNodeParentID,SourceNodeParentID: Integer;
  SourceNodeRootID,TargetNodeID,SourceNodeID: Integer;
  ChildQ,i:integer;

begin
  with StructureTreeCur do
  begin
	TargetNode := GetNodeAt(X, Y); // Get target node
	SourceNode := Selected;

	ObjTypeSource:=PNodeItemRec(SourceNode.Data)^.Object_id;
	ObjTypeTarget:=PNodeItemRec(TargetNode.Data)^.Object_id;
	//айдишники родительских узлов
	TargetNodeParentID:=PNodeItemRec(TargetNode.Data)^.ID_Parent;
	SourceNodeParentID:=PNodeItemRec(SourceNode.Data)^.ID_Parent;
 try
	SourceNodeRootID:= PNodeItemRec(SourceNode.Parent.Data)^.ID_Parent;
 except
	Exit;
 end;	
	//айдишники непосредственно узлов цели и источника
	TargetNodeID:= PNodeItemRec(TargetNode.Data)^.ID_Node;
	SourceNodeID:= PNodeItemRec(SourceNode.Data)^.ID_Node;
	//обработка ограничений по переносу узлов дерева
	//одинаковые типы узлов, кроме концентратор на концентратор
	if (ObjTypeSource=ObjTypeTarget) and not ((ObjTypeSource=2001)
		 and (ObjTypeTarget=2001)) then Exit;
	//GRPS шлюз на GSM шлюз или модем
	if ((ObjTypeSource=1001) or (ObjTypeSource=1002)) and (ObjTypeTarget=1003) then Exit;
	//GSM модем на GSM шлюз
	if (ObjTypeSource=1001) and (ObjTypeTarget=1002) then Exit;
	//счетчик на GSM шлюз
	if (ObjTypeSource=2003) and ((ObjTypeTarget=1002) or (ObjTypeTarget=1001) or (ObjTypeTarget=1003)) then Exit;
	 //счетчик на GPRS шлюз   
	if (ObjTypeSource=2003) and (ObjTypeTarget=1003) then Exit;
	//GSM шлюз,модем  на концентратор
	 if ((ObjTypeSource=1002) or (ObjTypeSource=1001) or (ObjTypeTarget=1003)) and (ObjTypeTarget=2001) then Exit;
	//GPRS шлюз на концентратор
	 if (ObjTypeSource=1003) and (ObjTypeTarget=2001) then Exit;
	//GSM шлюз на счетчик
	if ((ObjTypeSource=1002) or (ObjTypeSource=1001)) and (ObjTypeTarget=2003) then Exit;
	//GPRS шлюз на счетчик
	if (ObjTypeSource=1003) and (ObjTypeTarget=2003) then Exit;
	//концентратор на счетчик
	if (ObjTypeSource=2001) and (ObjTypeTarget=2003) then Exit;
	//концентратор_1 на GSM  шлюз
	if (ObjTypeSource=2001) and ((ObjTypeTarget=1002) or (ObjTypeTarget=1001))  then Exit;
	//концентратор_1 на GPRS  шлюз
	if (ObjTypeSource=2001) and (ObjTypeTarget=1003) then Exit;
 //концентратор на концентратор (в этом случае счетчики переносятся с одного на другой)
if (ObjTypeSource=2001) and (ObjTypeTarget=2001) then 
	Begin
if not SourceNode.HasChildren then exit;
ChildQ:=0;
//посчитаем кол-во потомков узла (счетчиков на концентраторе)
nodeTmp:=SourceNode.getFirstChild;
inc(ChildQ);

While nodeTmp<>nil do
 Begin
	nodeTmp:=nodeTmp.GetNextSibling;
	inc(ChildQ);
 End;
	 nodeTmp:=SourceNode.getFirstChild;
		For i:=1 to ChildQ-1 do
			Begin
			 nodeTmpNew:= Items.AddChild(TargetNode, nodeTmp.Text);
			 nodeTmpNew.Assign(nodeTmp);
			 nodeTmpNext:=nodeTmp.GetNext;
			 //копировать при переносе?
			 if CopyCB.Checked=false then
			  nodeTmp.Free;

			 nodeTmp:=nodeTmpNext;
			End;
		exit;
 End;
	//если нет цели то отмена операции
	 if (TargetNode = nil) then
	 begin
		EndDrag(False);
		Exit;
	 end;
	  MoveNodeCur(TargetNode, SourceNode);
		 //копировать при переносе?
			 if CopyCB.Checked=false then
			 SourceNode.Free;
  end;
end;

procedure TMain.StructureTreeCurDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
	 if (Sender = StructureTreeCur) then // If TRUE than accept the draged item
  begin
	 Accept := True;
  end;
end;

procedure TMain.MoveNodeCur(TargetNode, SourceNode: TTreeNode);
var
  nodeTmp: TTreeNode;
  i: Integer;
begin
  with StructureTreeCur do
  begin
	 nodeTmp := Items.AddChild(TargetNode, SourceNode.Text);;
	 for i := 0 to SourceNode.Count - 1 do
	 begin
		MoveNodeCur(nodeTmp, SourceNode.Item[i]);
	 end;
  end;
 nodeTmp.Assign(SourceNode);
end;

procedure TMain.ODSTochkaAfterPost(DataSet: TDataSet);
var
id_obj:integer;
Query,DateCountCr,CurrentDate:string;

begin
try
 id_obj:=PNodeItemRec(FocusedTree.Selected.Data)^.Object_id;
except
 exit;
end; 

Case id_obj of
//шлюзы
 1001,1002,1003:
  begin
	//обновляем текст в дереве при изменении в базе
	FocusedTree.Selected.Text:=ODSTochka.fieldbyname('Con_name').AsString+'\'+
		ODSTochka.fieldbyname('dist').AsString;
  end;
//концентраторы
 2001,2005:
  begin
	//обновляем текст в дереве при изменении в базе
	FocusedTree.Selected.Text:=ODSTochka.fieldbyname('concentrator_address').AsString;
  end;
//счетчики
 2003:
  begin
	 //обновляем текст в дереве при изменении в базе
	FocusedTree.Selected.Text:=ODSTochka.FieldByName('street').asString+' '+
			ODSTochka.FieldByName('dom').asString+' ('
			+ODSTochka.FieldByName('counter_address').asString+')';

  end;
 end;
end;

procedure TMain.StructureTreeCurNodeContextMenu(aSender: TObject;
  aNode: TTreeNode; var aPos: TPoint; var aMenu: TPopupMenu);
var
Id_Obj:integer;

begin
//здесь описано какие пункты меню видны при появлении контекстного меню в
//в зависимости от текущего узла
if StructureTreeCur.Items.Count=0 then 
//exit;
Id_Obj:=0;
if StructureTreeCur.Items.Count>0  then

try
 Id_Obj:=PNodeItemRec(aNode.Data)^.Object_id;
except
 exit;
end;
//если объект не выбран
If Id_Obj=0 then
 begin
  N1.Visible:=false;
  N3.Visible:=false;
  N4.Visible:=false;
  opros10001.Visible:=false;
  opros10002.Visible:=false;
  opros10003.Visible:=false;
  N100020041.Visible:=false;
  N2007.Visible:=false;
  Jghjc1.Visible:=false;
  Qwerty.Visible:=false;
  DeleteAllExcept.Visible:=false;
  N1231.Visible:=false;
 end;
//если объект GSM или GPRS
If (Id_Obj=1002) or (Id_Obj=1001) or (Id_Obj=1003)   then
 begin
  opros10001.Visible:=true;
  opros10002.Visible:=true;
  opros10003.Visible:=true;
  N100020041.Visible:=true;
  N2007.Visible:=true;
  Jghjc1.Visible:=true;
  Qwerty.Visible:=true;
  N1.Visible:=true;
  N3.Visible:=true;
  N4.Visible:=true;
  DeleteAllExcept.Visible:=true;
  N1231.Visible:=true;
 end;
//если объект CONCENTRATOR
If Id_Obj=2001 then
 begin
  opros10001.Visible:=false;
  opros10002.Visible:=false;
  opros10003.Visible:=false;
  N100020041.Visible:=false;
  N2007.Visible:=false;
  Jghjc1.Visible:=false;
  Qwerty.Visible:=false;
  N1.Visible:=true;
  N3.Visible:=true;
  N4.Visible:=true;
  DeleteAllExcept.Visible:=true;
  N1231.Visible:=true;
 end;
//если объект COUNTER
If Id_Obj=2003 then
 begin
  opros10001.Visible:=false;
  opros10002.Visible:=false;
  opros10003.Visible:=false;
  N100020041.Visible:=false;
  N2007.Visible:=false;
  Jghjc1.Visible:=false;
  Qwerty.Visible:=false;
  N1.Visible:=true;
  N3.Visible:=true;
  N4.Visible:=true;
  DeleteAllExcept.Visible:=true;
  N1231.Visible:=true;
 end;
//если объект COMMAND
If Id_Obj=2002 then
 begin
  opros10001.Visible:=false;
  opros10002.Visible:=false;
  opros10003.Visible:=false;
  N100020041.Visible:=false;
  Jghjc1.Visible:=false;
  N2007.Visible:=false;
  Qwerty.Visible:=false;
  N1.Visible:=true;
  N3.Visible:=true;
  N4.Visible:=true;
  DeleteAllExcept.Visible:=false;
  N1231.Visible:=true;
 end;
end;

procedure TMain.opros10001Click(Sender: TObject);
begin
 OprosConcentrators (1);
end;

procedure TMain.opros10002Click(Sender: TObject);
begin
 OprosConcentrators (2);
end;

procedure TMain.opros10003Click(Sender: TObject);
begin
 OprosConcentrators (3);
end;

procedure TMain.N100020041Click(Sender: TObject);
begin
 OprosConcentrators (4);
end;

procedure TMain.Jghjc1Click(Sender: TObject);
begin
 OprosConcentrators (5);
end;

procedure TMain.StructureTreeDblClick(Sender: TObject);
var
CurNode:TTreeNode;
ObjType:Integer;
begin

  If StructureTree.Selected<>nil then 
	begin
	CurNode:=StructureTree.Selected;
	ObjType:=PNodeItemRec(CurNode.Data)^.Object_id;   
	 If ObjType<>2001 then
	 Transfer
		else
	 Exit;
	end;

end;

procedure TMain.N7Click(Sender: TObject);
begin
 NodeTypeList.KeyValue:=2001;
 AddNodeButt.Click;
end;

procedure TMain.N8Click(Sender: TObject);
begin
 NodeTypeList.KeyValue:=2003;
 AddNodeButt.Click;
end;

procedure TMain.N12Click(Sender: TObject);
begin
 NodeTypeList.KeyValue:=2002;
 AddNodeButt.Click;
end;

procedure TMain.PopupMenu2Popup(Sender: TObject);
var
Node: TTreeNode;
begin
if StructureTree.Items.Count=0 then 
exit; 
ChangeNode(StructureTree);
//делает возможным выбор узла при всплывании контекстного меню
with StructureTree.ScreenToClient(PopupMenu2.PopupPoint) do
Node := StructureTree.GetNodeAt(X, Y);
if not Assigned(Node) then 
Exit;
StructureTree.Selected := Node; 
end;

procedure TMain.PopupMenu1Popup(Sender: TObject);
var
Node: TTreeNode;
begin
if StructureTreeCur.Items.Count=0 then
 exit; 
ChangeNode(StructureTreeCur);
//делает возможным выбор узла при всплывании контекстного меню
with StructureTreeCur.ScreenToClient(PopupMenu1.PopupPoint) do
Node := StructureTreeCur.GetNodeAt(X, Y);
if not Assigned(Node) then
 Exit;
StructureTreeCur.Selected := Node;
end;

procedure TMain.StructureTreeNodeContextMenu(aSender: TObject;
  aNode: TTreeNode; var aPos: TPoint; var aMenu: TPopupMenu);
var
Id_Obj:integer;

begin
//здесь описано какие пункты меню видны при появлении контекстного меню в
//в зависимости от текущего узла
if StructureTree.Items.Count=0 then Id_Obj:=0;
if StructureTree.Items.Count>0  then
 Id_Obj:=PNodeItemRec(aNode.Data)^.Object_id;

If Id_Obj=0 then
 begin
  N2.Visible:=false;
  N7.Visible:=false;
  N8.Visible:=false;
  N12.Visible:=false;
  N10.Visible:=false;
  N13.Visible:=false;
  GPRS1.Visible:=false;
  N15.Visible:=false;
 end;

If (Id_Obj=1002) or (id_Obj=1001) or (Id_Obj=1003) then
 begin
  N2.Visible:=true;
  N7.Visible:=true;
  N8.Visible:=false;
  N12.Visible:=false;
  N10.Visible:=true;
  N13.Visible:=true;
  GPRS1.Visible:=true;
  N15.Visible:=true;
 end;

If Id_Obj=2001 then
 begin
  N2.Visible:=true;
  N7.Visible:=false;
  N8.Visible:=true;
  N12.Visible:=true;
  N10.Visible:=false;
  N13.Visible:=false;
  GPRS1.Visible:=false;
  N15.Visible:=false;
 end;
If Id_Obj=2003 then
 begin
  N2.Visible:=true;
  N7.Visible:=false;
  N8.Visible:=false;
  N12.Visible:=false;
  N10.Visible:=false;
  N13.Visible:=false;
  GPRS1.Visible:=false;
	N15.Visible:=false;
 end;

If Id_Obj=2002 then
 begin
  N2.Visible:=true;
  N7.Visible:=false;
  N8.Visible:=false;
  N12.Visible:=false;
  N10.Visible:=false;
  N13.Visible:=false;
 GPRS1.Visible:=false;
	N15.Visible:=false;
 end;

end;

procedure TMain.N9Click(Sender: TObject);
begin
LoadSchedForm.ShowModal; 
end;

procedure TMain.N10Click(Sender: TObject);
begin
 NodeTypeList.KeyValue:=1002;
AddNodeButt.Click;
 NodeTypeList.KeyValue:=2001;
AddNodeButt.Click;
 NodeTypeList.KeyValue:=2003;
AddNodeButt.Click;
end;

procedure TMain.SaveImageToOracle(imgNo: string);
var 
  Blob: TStream;
  fs: TFileStream; 

begin
if OPD.Execute = true then
 begin
  if imgNo = '0' then imgNo := '';
  ODSTochka.Edit;
  Blob :=ODSTochka.CreateBlobStream(ODSTochka.FieldByName('PIC' + imgNo), bmWrite); 

	try 
	 Blob.Seek(0, soFromBeginning); 
	 fs := TFileStream.Create(OPD.FileName, fmOpenRead or 
		fmShareDenyWrite); 
	 try
		Blob.CopyFrom(fs, fs.Size) 
	 finally 
		fs.Free 
	 end; 
  finally 
	 Blob.Free; 
	 ODSTochka.Post;
	 SelectedImageBox.Picture.LoadFromFile(OPD.FileName);
  end;
 end;
end;

procedure TMain.LoadImagesFormOracle;
var
SelectedNode:TTreeNode;
ImagesDataSet: TOracleDataSet;

begin
 SelectedNode := StructureTree.Selected;

 ImagesDataSet.Create(Application);
 ImagesDataSet.Session := OS;
 ImagesDataSet.SQL.Text := 'select * from bqrk.images where id_connection='
									+  IntToStr(PNodeItemRec(SelectedNode.Data)^.ID_Node);
  ImagesDataSet.Open;

  If ImagesDataSet.RecordCount = 0 then Exit;


end;

procedure TMain.SaveImageToOracle2;
var
SelectedNode:TTreeNode;
InsertImageQuery: TOracleDataSet;
Blob: TStream;
fs: TFileStream;
img: TImage;

begin

if OPD.Execute = true then
 begin
	try     

	 //Blob.Seek(0, soFromBeginning); 
	 //fs := TFileStream.Create(OPD.FileName, fmOpenRead or 
	 //	fmShareDenyWrite); 
	 try
	 // Blob.CopyFrom(fs, fs.Size); 

	InsertImageQuery.Create(Main);
	InsertImageQuery.Session:=OS;
	img.Create(Main);

	 with InsertImageQuery do
		begin
		 Close;
		 SQL.Add('INSERT INTO bqrk.images (SIMAGE, CRTEMP )');
		 SQL.Add(' VALUES (:SIMAGE, :CRTEMP)');
		 DeclareVariable( 'CRTEMP', otInteger);
		 DeclareVariable( 'SIMAGE', otBlob);
		 BLOB := TLOBLocator.CreateTemporary(OS, otBLOB, True);
		 img.Assign(Image2.Picture.Graphic );
		 img.Picture.Graphic.SaveToStream(BLOB);
		 setVariable( 'CRTEMP', 1);
		 setComplexVariable( 'SIMAGE', BLOB );
		 ExecSQL;
		 blob.Free;
	 end;
	 finally 
		fs.Free 
	 end; 
  finally
	 Blob.Free; 
  end;
 end;

end;

procedure TMain.BitBtn1Click(Sender: TObject);

var 
  Blob: TStream; 
  pic:TPicture;
Code:word;
begin 
//грузим картинку в поток
 Blob := ODSTochka.CreateBlobStream(ODSTochka.FieldByName('PIC'), bmRead); 
//если нет картинки и поток пуст то ничего не рисуем
 if Blob.Size=0 then 
  begin
	Image1.Picture.Graphic:=nil;
	Exit;
  end;

  try 
	 BLOB.Read(Code,SizeOf(Code)); BLOB.Seek(0,0);
case Code of 
$4D42: begin
 Image1.Picture.Graphic:=TBitmap.Create; 
 Image1.Picture.Graphic.LoadFromStream(BLOB); 
end; 
 $D8FF: 
begin 
 Image1.Picture.Graphic:=TJPEGImage.Create; 
 Image1.Picture.Graphic.LoadFromStream(BLOB); 
end;

end;
 finally
  Blob.free;
end;
end;

procedure TMain.ShowLastLogButtClick(Sender: TObject);
var
s,r:boolean;
begin
r:=false;
LoadLog(s,r);

end;

procedure TMain.ReDial(CurrentEdit:TRzRichEdit);
var
q,j,i,k,x,y:integer;
s,r:boolean;
GateName,TerminationString:string;
NodeToSearch:TTreeNode;

begin
StructureTreeCur.Items.Clear;
r:=false; q:=0;
TerminationString:='1';

LoadLog(s,r);
If s=false then 
 exit
else
 Begin
  While TerminationString<>'--------------------' do
	Begin
	 TerminationString:=CurrentEdit.Lines.Strings[q];
	 inc(q);
	End;

 For j:=0 to q do
  begin  //получаем имена шлюзов
	i:=Q_PosStr('Шлюз',CurrentEdit.Lines.Strings[j],0);
	k:=Q_PosStr('недоступен',CurrentEdit.Lines.Strings[j],0);    
	GateName:=Copy(CurrentEdit.Lines.Strings[j],i+5,k-7);
 //ищем их в дереве по тексту
 For x:=0 to StructureTree.Items.Count-1 do
  Begin
	If StructureTree.Items.Item[x].Text=GateName then
	 Begin
	  NodeToSearch:=StructureTree.Items.Item[x];
	  StructureTree.Select(NodeToSearch);
	  //каждый найденный шлюз переносим в текущее задание
	  Transfer;
	 End;
  End;
 End;
End;
 //опрашиваем
 QuickDial(false);
end;

procedure TMain.ReDialButtClick(Sender: TObject);
var               
 i:integer;
 LinesToCopy:string;
 CurrentEdit:TRZRichEdit;
begin
 //пытаемся копировать выделенный текст в отдельный edit
 //для переопроса КОНКРЕТНО ВЫДЕЛЕННОГО ЛОГА
 If AutoAnalizerMemo.SelLength>0 then
  Begin
	LogAnalizeMemo.Clear;
	AutoAnalizerMemo.CopyToClipboard;
	LogAnalizeMemo.PasteFromClipboard;
   //добавляем стоп-линию для гарантии
	LogAnalizeMemo.Lines.Add('--------------------');
	//вызываем процедуру переопроса используя дополнительный edit
	//т.к. так удобнее чем возиться с основным edit'ом
	CurrentEdit:=LogAnalizeMemo;
  End	
	else
  Begin
	LogAnalizeMemo.Clear;
	CurrentEdit:=AutoAnalizerMemo;
  End;
 //производим переопрос столько раз сколько нам нужно
 For i:=1 to ReDialsQtyEdit.IntValue do
  Begin
	ReDial(CurrentEdit);
  End;
 //снимаем галку автоматической загрузки показания если она стояла
 AutoLoadCB.Checked:=false;
end;

procedure TMain.LoadLog(var Success:boolean; Regular:boolean);
var
c:string;
begin
If ParamCount<>0 then 
 Begin
  If ParamStr(2)='-k' then c:='-k';
  If ParamStr(2)='-l' then c:='-l';
 End
  else
 Begin
  If LoginForm.PCity='SKEK' then c:='-k';
  If LoginForm.PCity='LK' then c:='-l';
 End;
  
try
 AutoAnalizerMemo.Lines.LoadFromFile('Y:\BQRK\LOG'+c+'.txt');
 Success:=true;
except
 If Regular=false then showmessage('Файл отсутствует');

 Success:=false;
 ShowMessage('Файл отсутствует');
end;

end;

procedure TMain.qwertyClick(Sender: TObject);
begin
 OprosConcentrators (6);
end;

procedure TMain.N11Click(Sender: TObject);
begin
ReadMeForm.ShowModal;
end;

procedure TMain.N2007Click(Sender: TObject) ;
begin
 OprosConcentrators (7);
end;

procedure TMain.RzBitBtn18Click(Sender: TObject);
var
TreeNode:TTreeNode;

Begin
Generation_Tab.Enabled:=false;

  TreeNode:= Main.StructureTree.Items.GetFirstNode;
	while TreeNode <> nil do
	 begin
	  TreeNode.Selected:=true;
		If Q_PosText('Кедровка',TreeNode.Text)=0 then
		 Main.Transfer;

		 TreeNode := TreeNode.GetNextSibling;

		If TreeNode = nil then 
		break;
	 end;

//генерим
Main.GenObjButt.Click;

Main.RzCheckBox3.Checked:=false;
			 
If City='SKEK' then 
 Main.WorkFileMemo.Lines.SaveToFile('Y:\BQRK\vse\vse.dat');

If City='LK' then 
 Main.WorkFileMemo.Lines.SaveToFile('Y:\BQRK\vse_leninsk\vse_leninsk.dat');

Application.Terminate;
end;

procedure TMain.secondClick(Sender: TObject);
begin
AutoAnalizerMemo.Lines.Add('4');
AutoAnalizerMemo.Lines.Add('5');
AutoAnalizerMemo.Lines.Add('6');

AutoAnalizerMemo.PasteFromClipboard;
end;

procedure TMain.firstClick(Sender: TObject);
var
i:integer;
begin
AutoAnalizerMemo.Lines.Add('1');
AutoAnalizerMemo.Lines.Add('2');
AutoAnalizerMemo.Lines.Add('3');

AutoAnalizerMemo.SelectAll;

AutoAnalizerMemo.CopyToClipboard;

AutoAnalizerMemo.Lines.Clear;

end;
 
procedure TMain.DeleteAllExceptOne;
var
 SelectedCounter, SelectedConcentrator,SelectedConnection,CurrentNode,tmpNode: TTreeNode;
 SelectedCounterID, SelectedConcentratorID,SelectedConnectionID,i,IdObj1: Integer;
begin
//если дерево пустое или узел не выделен то выходим
If StructureTreeCur.Items.Count=0 then exit;
If StructureTreeCur.SelectionCount=0 then exit;

IdObj1:=PNodeItemRec(StructureTreeCur.Selected.Data)^.Object_id;
//если оставляем счетчик
if IdObj1=2003 then
Begin
//смотрим выбранный счетчик
SelectedCounter:=StructureTreeCur.Selected;
SelectedCounterID:=PNodeItemRec(SelectedCounter.Data)^.ID_Node;
//запомининаем его родительсикй концентратор
SelectedConcentrator:=SelectedCounter.Parent;
SelectedConcentratorID:=PNodeItemRec(SelectedConcentrator.Data)^.ID_Node;
//запомининаем его шлюз
SelectedConnection:=SelectedConcentrator.Parent;
SelectedConnectionID:=PNodeItemRec(SelectedConnection.Data)^.ID_Node;

i:=0;
//далее циклимся по дереву удаляя все узлы, кроме этих трех
While i<>StructureTreeCur.Items.Count-1 do
 Begin
	CurrentNode:=StructureTreeCur.Items.Item[i];
	 If (PNodeItemRec(CurrentNode.Data)^.ID_Node<>SelectedCounterID) and
		(PNodeItemRec(CurrentNode.Data)^.ID_Node<>SelectedConcentratorID) and
		(PNodeItemRec(CurrentNode.Data)^.ID_Node<>SelectedConnectionID) then
	begin
	CurrentNode.Free;
	i:=0; Continue;
	end;
  
	inc(i);	
 End;
End; //конец условия по счетчику

//если удаляем шлюз
if (IdObj1=1001) or (IdObj1=1002) or (IdObj1=1003) or (IdObj1=2001) then
 Begin
	//удаляем все нижележащие
	SelectedConnection:=StructureTreeCur.Selected;
	tmpNode:=SelectedConnection;
	 While tmpNode<>nil do
	  Begin
		tmpNode:= SelectedConnection.getNextSibling;
		tmpNode.Free;
	  End;
   	//удаляем все вышележащие
	//SelectedConnection:=StructureTreeCur.Selected;
	tmpNode:=SelectedConnection;	 
	While tmpNode<>nil do
	  Begin
		tmpNode:= SelectedConnection.getPrevSibling;
		tmpNode.Free;
	  End;
 End;
end;
 
procedure TMain.DeleteFromScheduleExecute(Sender: TObject);
begin
 Delete(StructureTreeCur);

end;

procedure TMain.ClearTaskExecute(Sender: TObject);
begin
StructureTreeCur.Selected:=nil;
 StructureTreeCur.Items.Clear;
NameSched.Caption:='нет';
GloSchedID:=0;
end;

procedure TMain.DeleteAllExceptOneActExecute(Sender: TObject);
begin
DeleteAllExceptOne;
end;

procedure TMain.QuickDialActExecute(Sender: TObject);
begin

 If Main.StructureTreeCur.Items.Count=0 then
	Exit;

QuickDial(false);
end;

procedure TMain.TransferActExecute(Sender: TObject);
begin
Transfer;
end;

procedure TMain.SearchFormShowActExecute(Sender: TObject);
begin

If Self.WindowState=wsNormal then
 Begin
  //SearchForm.Top:=150;
  //SearchForm.Left:=250;

  //SearchForm.Width:=800;
  //SearchForm.Height:=300;

 // SearchForm.BorderStyle:=bsSizeable;

	If SearchForm.Showing=false then
	 SearchForm.Show
	else
	 SearchForm.Hide;
 End;

If (Self.WindowState=wsMaximized) and (Generation_Tab.ActivePageIndex=0) then
  Begin
  //SearchForm.Top:=570;
  //SearchForm.Left:=17;
  
  //SearchForm.Width:=700;
  //SearchForm.Height:=390;

  //SearchForm.BorderStyle:=bsSizeable;

	If SearchForm.Showing=false then
	 SearchForm.Show 
	else
	 SearchForm.Hide;
 End;
end;

procedure TMain.CBDextActivateExecute(Sender: TObject);
begin
 If CBDext.Checked=false then
  CBDext.Checked:=true
 else
  CBDext.Checked:=false;
end;

procedure TMain.generation_tabChange(Sender: TObject);
begin
 {
If Main.Showing=true then
 Begin
 If (Generation_Tab.ActivePageIndex=2) or (Generation_Tab.ActivePageIndex=3) or 
(Generation_Tab.ActivePageIndex=4) or  (Generation_Tab.ActivePageIndex=5) then
  Begin
  If (SearchForm.Showing) and (Main.WindowState=wsMaximized) then
	SearchForm.Hide;
  End;

 If (Generation_Tab.ActivePageIndex=0) and (Main.WindowState=wsMaximized) then
  SearchFormShowActExecute(Main);
 End;
}
end;

procedure TMain.FormResize(Sender: TObject);
begin
//If SearchForm.Showing then
 //SearchForm.Hide;
end;

procedure TMain.OpenLogNotepadClick(Sender: TObject);
var
c:string;
begin

  If LoginForm.PCity='SKEK' then c:='-k';
  If LoginForm.PCity='LK' then c:='-l';

 Launcher2.FileName:='C:\WINDOWS\Notepad.exe';
 Launcher2.Parameters:='Y:\BQRK\LOG'+c+'.txt';
 Launcher2.Launch;
end;

procedure TMain.OpenExcelClick(Sender: TObject);
begin
 Launcher2.FileName:='C:\Program Files\Microsoft Office\OFFICE11\Excel.exe';
 Launcher2.Parameters:=FileToExcel;
 Launcher2.Execute;
end;

procedure TMain.ODSTochkaBeforePost(DataSet: TDataSet);
var
id_obj:integer;
Query,DateCountCr,CurrentDate:string;

begin
try
 id_obj:=PNodeItemRec(FocusedTree.Selected.Data)^.Object_id;
except
 exit;
end; 

Case id_obj of
//счетчики
 2003:
  begin
  //даты текущая и дата создания счетчика	
  CurrentDate:=DateToStr(Date);
  DateCountCr:=DateToStr(ODSTochka.FieldByName('date_create').asDateTime);
  //добавляем архивную запись счетчика в лог ручных изменений
  //если изменения происходят не в день создания (дабы при каждом нажатии 
  //												на галочку записи не плодились, например 
  //												при создании счетчика)
	If CurrentDate<>DateCountCr then
	 Begin
	  Query:='Insert into MN_CHG_LOG (id_object,text) values ('
				+ForMN_CGH_LOGid_counter+','''
				+ForMN_CGH_LOGcounter_name+' '
				+ForMN_CGH_LOGstreet+' '
				+ForMN_CGH_LOGdom+' '
				+ForMN_CGH_LOGserial_number+' '
				+ForMN_CGH_LOGcounter_address+' '
				+ForMN_CGH_LOGlast_pok+' '
				+ForMN_CGH_LOGdate_last_pok+' '
				+ForMN_CGH_LOGlast_pokt1+' '
				+ForMN_CGH_LOGlast_pokt2+' '
				+ForMN_CGH_LOGlast_pokt3+' '
				+ForMN_CGH_LOGlast_pokt4+''')';

	  Qry2.SQL.Clear; Qry2.SQL.Text:=Query; Qry2.Execute;
     OS.Commit;
	 End;
  end;
 end;
end;

procedure TMain.ODSTochkaBeforeEdit(DataSet: TDataSet);
var
id_obj:integer;

begin
try
 id_obj:=PNodeItemRec(FocusedTree.Selected.Data)^.Object_id;
except
 exit;
end; 

Case id_obj of
//счетчики
 2003:
  begin
	ForMN_CGH_LOGid_counter:=ODSTochka.FieldByName('id_counter').asString;
	ForMN_CGH_LOGcounter_name:=ODSTochka.FieldByName('counter_name').asString;
	ForMN_CGH_LOGstreet:=ODSTochka.FieldByName('street').asString;
	ForMN_CGH_LOGdom:=ODSTochka.FieldByName('dom').asString;
	ForMN_CGH_LOGserial_number:=ODSTochka.FieldByName('serial_number').asString;
	ForMN_CGH_LOGcounter_address:=ODSTochka.FieldByName('counter_address').asString;
	ForMN_CGH_LOGlast_pok:=ODSTochka.FieldByName('last_pok').asString;
	ForMN_CGH_LOGdate_last_pok:=ODSTochka.FieldByName('date_last_pok').asString;
	ForMN_CGH_LOGlast_pokt1:=ODSTochka.FieldByName('last_pokt1').asString;
	ForMN_CGH_LOGlast_pokt2:=ODSTochka.FieldByName('last_pokt2').asString;
	ForMN_CGH_LOGlast_pokt3:=ODSTochka.FieldByName('last_pokt3').asString;
	ForMN_CGH_LOGlast_pokt4:=ODSTochka.FieldByName('last_pokt4').asString;
  end;
end;
end;

procedure TMain.N13Click(Sender: TObject);
begin
 NodeTypeList.KeyValue:=1001;
AddNodeButt.Click;
 NodeTypeList.KeyValue:=2001;
AddNodeButt.Click;
 NodeTypeList.KeyValue:=2003;
AddNodeButt.Click;
end;

procedure TMain.ODSAddFieldsSpravpropnameChange(Sender: TField);
begin
RzDBNavigator1.VisibleButtons:=[nbInsert,nbDelete,nbPost,nbCancel,nbRefresh];
end;

procedure TMain.GPRS1Click(Sender: TObject);
begin
 NodeTypeList.KeyValue:=1003;
AddNodeButt.Click;
 NodeTypeList.KeyValue:=2001;
AddNodeButt.Click;
 NodeTypeList.KeyValue:=2003;
AddNodeButt.Click;
end;

procedure TMain.N14Click(Sender: TObject);
begin
StatForm.ShowModal;
end;

procedure TMain.N15Click(Sender: TObject);
var
Id_node,Id_obj:integer;

begin
Id_node:=PNodeItemRec(StructureTree.Selected.Data)^.Id_node;

Qry3.Close;
Qry3.SQL.Text:='Select * from bqrk.con_points where id_con='+
					IntToStr(PNodeItemRec(StructureTree.Selected.Data)^.id_node);
Qry3.Execute;
Id_Obj:=Qry3.Field('con_type');

If Id_Obj=1002 then
 Begin
  Qry3.SQL.Text:='Update bqrk.con_points set con_type=1001 where id_con='+IntToStr(Id_node);
  StructureTree.Selected.ImageIndex:=LoadSchedForm.SelectImageForNode(1001);
 End;
If Id_Obj=1001 then
 Begin
  Qry3.SQL.Text:='Update bqrk.con_points set con_type=1002 where id_con='+IntToStr(Id_node);
  StructureTree.Selected.ImageIndex:=LoadSchedForm.SelectImageForNode(1002);
 End;

Qry3.Execute;
OS.Commit;
end;

procedure TMain.N1231Click(Sender: TObject);
begin
 CopyNodeAuto2;
end;

procedure TMain.CopyNodeAuto2;
var
CounterMass:array [0..10,0..1023] of TTreeNode;
CountersQnty: array [0..1023] of Integer;
NodesToDel: array [0..10] of  TTreeNode;

NewConcNode,NewCounterNode,GateNode,ConcNode,CounterNode:TTreeNode;
k,i,j,ConcentratorsQnty:integer;
NodePtr:PNodeItemRec;
begin
If StructureTreeCur.Items.Count=0 then Exit;

GateNode:=StructureTreeCur.Items.Item[0];
Repeat
ConcentratorsQnty:=0;
ConcNode:=GateNode.getFirstChild;
ConcentratorsQnty:=GateNode.Count;

For i:=0 to GateNode.Count-1 do
 Begin
  CounterNode:=ConcNode.getFirstChild;
	For j:=0 to ConcNode.Count-1 do 
	 Begin
	  //пишем счетчики в двухмерный массив [конц,счетчик]
	  CountersQnty[i]:=ConcNode.Count;
	  CounterMass[i,j]:=CounterNode;
	  CounterNode:=CounterNode.getNextSibling;
	 End;
  //запомниаем список реальных концетраторов чтобы потом удалить их из расписания
  NodesToDel[i]:=ConcNode;
  ConcNode:=ConcNode.GetNextSibling;
 End;

 For k:=1 to StrToInt(CloneEdit.Text) do
  Begin
	//создаем виртуальные концентраторы, не имеющие привязки к реальным
	NewConcNode:=StructureTreeCur.Items.AddChildObject(GateNode,'200'+IntToStr(k),nil);
	NewConcNode.ImageIndex:=LoadSchedForm.SelectImageForNode(2001);
	//внутри него создаем составленный массив счетчиков
  For i:=0 to ConcentratorsQnty-1 do 
	Begin
	  For j:=0 to CountersQnty[i]-1 do 
		Begin        
		NewCounterNode:=StructureTreeCur.Items.AddChildObject
								(NewConcNode,'Счетчик',nil);
		NewCounterNode.Assign(CounterMass[i,j]);
		End;
	End; 
 End;
 GateNode:=GateNode.getNextSibling; 
 //удаляем реальные концентраторы из текущего расписания чтобы не плодить
 For i:=0 to ConcentratorsQnty-1 do
	NodesToDel[i].Delete;
until GateNode=nil;
end;

procedure TMain.OnOffConstraints(State:integer);
var
SqlStr:string;

Begin

If State=0 then
 Begin
 //отключаем внешний ключ для удаления показаний
	 SqlStr:= 'ALTER TABLE bqrk.pokaz DISABLE CONSTRAINT MyConstr';
	 
	 Qry.Close;
	 Qry.SQL.Text:=SqlStr;
	 Qry.Execute;
  End;

If State=1 then
 Begin
 //включаем внешний ключ
	 SqlStr:= 'ALTER TABLE bqrk.pokaz ENABLE CONSTRAINT MyConstr';  

	 Qry.Close;
	 Qry.SQL.Text:=SqlStr;
	 Qry.Execute;
 End;

 OS.Commit;
End;

procedure TMain.CopyCounterInfo(IdTarget,IdSource:integer);
begin
Qry3.Close;
Qry3.SQL.Text:=
'update counters set counter_name=(select counter_name from counters where id_counter='+IntToStr(IdSource)+'),'+
					'counter_address=(select counter_address from counters where id_counter='+IntToStr(IdSource)+'),'+
					'street=(select street from counters where id_counter='+IntToStr(IdSource)+'),'+
					'dom=(select dom from counters where id_counter='+IntToStr(IdSource)+'),'+
					'flat=(select flat from counters where id_counter='+IntToStr(IdSource)+'),'+
					'dist=(select dist from counters where id_counter='+IntToStr(IdSource)+') '+

 'where id_counter='+IntToStr(IdTarget); 
Qry3.Execute;
OS.Commit;
end;

procedure TMain.OprosConcentrators (NomConc: integer);
var
Id_Obj,i,j:integer;
dext:string;

begin
if cbdext.Checked=false then
dext:='' else dext:='; DEXT=YES';

Id_Obj:=PNodeItemRec(StructureTreeCur.Selected.Data)^.Object_id;
	
WorkFileMemo.Clear;

WorkFileMemo.Lines.Add('OBJECTS');
WorkFileMemo.Lines.Add(chr(9)+'TYPE=GSM_TERMINAL');

If Id_obj=1002 then
WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=GSM_GATE; NUMBER='+Opros1000Number);
If Id_obj=1001 then
WorkFileMemo.Lines.Add(chr(9)+chr(9)+'TYPE=GSM_MODEM; NUMBER='+Opros1000Number);

For i:=NomConc to NomConc do
 begin
  WorkFileMemo.Lines.Add(chr(9)+chr(9)+chr(9)+'TYPE=PLC_I_CONCENTRATOR; ADDR=200'+IntToStr(i));
	For j:=1 to 1000 do
	 WorkFileMemo.Lines.Add(chr(9)+chr(9)+chr(9)+chr(9)+'TYPE=PLC_I_METER; ADDR='+IntToStr(j)+dext);
 end;
QuickDial(true);
end;

procedure TMain.DistFilterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=$D then 
  RefreshButt.Click;
end;

procedure TMain.NameFilterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=$D then 
  RefreshButt.Click;
end;

procedure TMain.TrackBarChanging(Sender: TObject; NewPos: Integer;
  var AllowChange: Boolean);
begin                        // 1077    540
 //If NewPos>0 then
 If NewPos>TrackBar.Position then
  begin
	Image1.Height:=Image1.Height+(100*(TrackBar.Position+1));
	Image1.Width:=Image1.Width+(100*(TrackBar.Position+1));
  end; 
	//else
 If NewPos<TrackBar.Position then
  begin
	Image1.Height:=Image1.Height-(100*(TrackBar.Position+1));
	Image1.Width:=Image1.Width-(100*(TrackBar.Position+1));
  end;
end;

procedure TMain.ODSErrorAnalBeforeRefresh(DataSet: TDataSet);
begin
 ODSErrorAnal.SetVariable('ndate',ndate.Text);
 ODSErrorAnal.SetVariable('kdate',kdate.Text);
end;

procedure TMain.ODSErrorAnalBeforeOpen(DataSet: TDataSet);
begin
 ODSErrorAnal.SetVariable('ndate',ndate.Text);
 ODSErrorAnal.SetVariable('kdate',kdate.Text);
end;

procedure TMain.AnalButtClick(Sender: TObject);
var
ser_num:ShortString;

begin
 //пока берем только один тип ошибки
 ODSErrorAnal.Filter:='error_text = ''Нет данных''';
 ODSErrorAnal.Filtered:=true;

 ODSErrorAnal.First; 
 //циклимся по датасету ошибок 
 While not ODSErrorAnal.Eof do 
  begin
	ser_num:=ODSErrorAnal.FieldByName('SERIAL_NUMBER').AsString;
 
	ErrorsAnalQry.Close;
	ErrorsAnalQry.Clear;
	ErrorsAnalQry.SQL.Add('select date_last_pok from bqrk.counters where '
								 + 'serial_number='''+ser_num+'''');
	ErrorsAnalQry.Execute;
  
	 If ErrorsAnalQry.Field(0) = //нет смысла заморачиваться с датами т.к. длина
	 										//всегда одна и достаточно отрезать часы
			Copy(ODSErrorAnal.FieldByName('WDATE').AsString,1,10) then
		Begin
		 ODSErrorAnal.Delete;
       OS.Commit;
		End;

	 ODSErrorAnal.Next;
  end;

ODSErrorAnal.Filtered:=false;
ErrorsCount.Caption:=IntToStr(ODSErrorAnal.RecordCount)
end;

procedure TMain.ODSErrorAnalAfterRefresh(DataSet: TDataSet);
begin
 ErrorsCount.Caption:=IntToStr(ODSErrorAnal.RecordCount);
end;

procedure TMain.TimerTimer(Sender: TObject);
begin
 ShowMessage(DateToStr(Date));
end;

procedure TMain.ApplicationMinimize(Sender : TObject); 
begin 
  TrayIcon.Show;  
  ShowWindow(Application.Handle,SW_HIDE);  
end; 

procedure TMain.TrayIconClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Application.Restore;  
  SetForeGroundWindow(Application.Handle);  
  TrayIcon.Hide
end;

procedure TMain.AnalizeLogButtClick(Sender: TObject);
var
 NumString,StrPosN,StrPosGate,i,k,j,q,QCurGates:integer;
 CurrentString,TerminationString,GateName:ShortString;
 s:boolean;
begin
LoadLog(s,false);
//если загрузка не полкучлась, то выходим мз процедуры
If s=false then exit;
LogAnalizeMemo.Lines.Clear;

//считаем количество шлюзов в последнем логе недозвонов
While TerminationString<>'--------------------' do
 Begin
  TerminationString:=AutoAnalizerMemo.Lines.Strings[q];
  inc(q);
 End;
PB.TotalParts:=q;
PB.PartsComplete:=0;
//цикл по по последнему логу
 For j:=2 to q do
  Begin
	//в этой переменной храним сколько раз текущий шлюз встречается в логах
	QCurGates:=0;
	//получаем имена шлюзов
	k:=Q_PosStr('недоступен',AutoAnalizerMemo.Lines.Strings[j],0);    
	GateName:=Copy(AutoAnalizerMemo.Lines.Strings[j],0,k-2);
	
	NumString:=q+3;
 //цикл по последним N логам (дням) и ищем в них текущий шлюз
 For i:=1 to NumberDaysEdit.IntValue do
  Begin
	StrPosN:=0;
	 //итерация до тех пор, пока не встретиться символ начала нового лога
	 While StrPosN=0 do
	  Begin	
		//запоминаем текущую строку
		CurrentString:=AutoAnalizerMemo.Lines.Strings[NumString];
		//определяем, находится ли в текущей строке символ начала нового лога
		StrPosN:=Q_PosStr('--------------------',CurrentString,0); 
		//определяем, находится ли в текущей строке имя текущего шлюза
		StrPosGate:=Q_PosStr(GateName,CurrentString,0); 
		//если имя текущего шлюза встречается, то наращиваем счётчик кол-ва
		If StrPosGate>0 then inc(QCurGates);
		//наращиваем номер анализируемой строки 
		inc(NumString);
	  End;
 End;
 LogAnalizeMemo.Lines.Add(GateName +': '+ IntToStr(QCurGates)+chr(13));
 PB.IncPartsByOne;
End;//конец цикла по последнему логу
end;

procedure TMain.Image1Click(Sender: TObject);
begin
 SelectedImageBoxNo:='0';
 SelectedImageBox:= Image1;
 SaveImageToFileButt.Enabled := true;

 Bevel1.Style := bsRaised;
 Bevel2.Style := bsLowered;
 Bevel3.Style := bsLowered;
 Bevel4.Style := bsLowered;
 Bevel5.Style := bsLowered;
 Bevel6.Style := bsLowered;
 Bevel7.Style := bsLowered;
 Bevel8.Style := bsLowered;
end;

procedure TMain.Image2Click(Sender: TObject);
begin
 SelectedImageBoxNo:='1';
 SelectedImageBox:= Image2;
 SaveImageToFileButt.Enabled := true;

 Bevel1.Style := bsLowered;
 Bevel2.Style := bsRaised;
 Bevel3.Style := bsLowered;
 Bevel4.Style := bsLowered;
 Bevel5.Style := bsLowered;
 Bevel6.Style := bsLowered;
 Bevel7.Style := bsLowered;
 Bevel8.Style := bsLowered;
end;

procedure TMain.Image3Click(Sender: TObject);
begin
 SelectedImageBoxNo:='2';
 SelectedImageBox:= Image3;
 SaveImageToFileButt.Enabled := true;

 Bevel1.Style := bsLowered;
 Bevel2.Style := bsLowered;
 Bevel3.Style := bsRaised;
 Bevel4.Style := bsLowered;
 Bevel5.Style := bsLowered;
 Bevel6.Style := bsLowered;
 Bevel7.Style := bsLowered;
 Bevel8.Style := bsLowered;
end;

procedure TMain.Image4Click(Sender: TObject);
begin
 SelectedImageBoxNo:='3';
 SelectedImageBox:= Image4;
 SaveImageToFileButt.Enabled := true;

 Bevel1.Style := bsLowered;
 Bevel2.Style := bsLowered;
 Bevel3.Style := bsLowered;
 Bevel4.Style := bsRaised;
 Bevel5.Style := bsLowered;
 Bevel6.Style := bsLowered;
 Bevel7.Style := bsLowered;
 Bevel8.Style := bsLowered;
end;

procedure TMain.Image5Click(Sender: TObject);
begin
 SelectedImageBoxNo:='4';
 SelectedImageBox:= Image5;
 SaveImageToFileButt.Enabled := true;

 Bevel1.Style := bsLowered;
 Bevel2.Style := bsLowered;
 Bevel3.Style := bsLowered;
 Bevel4.Style := bsLowered;
 Bevel5.Style := bsRaised;
 Bevel6.Style := bsLowered;
 Bevel7.Style := bsLowered;
 Bevel8.Style := bsLowered;
end;

procedure TMain.Image6Click(Sender: TObject);
begin
 SelectedImageBoxNo:='5';
 SelectedImageBox:= Image6;
 SaveImageToFileButt.Enabled := true;

 Bevel1.Style := bsLowered;
 Bevel2.Style := bsLowered;
 Bevel3.Style := bsLowered;
 Bevel4.Style := bsLowered;
 Bevel5.Style := bsLowered;
 Bevel6.Style := bsRaised;
 Bevel7.Style := bsLowered;
 Bevel8.Style := bsLowered;
end;

procedure TMain.SaveBLOBClick(Sender: TObject);
begin
 SaveImageToOracle(SelectedImageBoxNo);
end;

procedure TMain.Image1DblClick(Sender: TObject);

begin
 if Image1.Picture.Graphic <> nil then
  Begin
	FormPhoto.Image.Picture := Image1.Picture;
	FormPhoto.ShowModal;
  End;
end;

procedure TMain.SaveImageToFileButtClick(Sender: TObject);
begin
 SaveImageToFile(SelectedImageBox);
end;

procedure TMain.Image2DblClick(Sender: TObject);
begin
 if Image2.Picture.Graphic <> nil then
  Begin
	FormPhoto.Image.Picture := Image2.Picture;
	FormPhoto.ShowModal;
  End;
end;

procedure TMain.Image3DblClick(Sender: TObject);
begin
 if Image3.Picture.Graphic <> nil then
  Begin
	FormPhoto.Image.Picture := Image3.Picture;
	FormPhoto.ShowModal;
  End;
end;

procedure TMain.Image4DblClick(Sender: TObject);
begin
  if Image4.Picture.Graphic <> nil then
  Begin
	FormPhoto.Image.Picture := Image4.Picture;
	FormPhoto.ShowModal;
  End;
end;

procedure TMain.Image5DblClick(Sender: TObject);
begin
 if Image5.Picture.Graphic <> nil then
  Begin
	FormPhoto.Image.Picture := Image5.Picture;
	FormPhoto.ShowModal;
  End;
end;

procedure TMain.Image6DblClick(Sender: TObject);
begin
 if Image6.Picture.Graphic <> nil then
  Begin
	FormPhoto.Image.Picture := Image6.Picture;
	FormPhoto.ShowModal;
  End;
end;

procedure TMain.Button1Click(Sender: TObject);
begin
saveimagetooracle2;
end;

procedure TMain.CopyCountersFromTaskFile;
var
 TempString, TerminationString, CounterString:string; 
 q,k,i,j,x:integer;
 NodeToSearch:TTreeNode;

begin
 q:=0;
 if WorkFileMemo.Lines.Count = 0 then Exit;

//пытаемся закинуть в задание счётчики из файла 
 While TerminationString<>'INTERFACE' do
	Begin
	 //считаем количество строк для анализа
	 TerminationString:=WorkFileMemo.Lines.Strings[q];
	 inc(q);
	  if q>= WorkFileMemo.Lines.Count then //если дошли до донца файла 
		Begin
		 ShowMessage('Неправильный файл задания: не найдена секция INTERFACE');
		 Exit; 
		End;
	End;


 For j:=0 to q do
  begin  
	CounterString:='';
	//составляем строку счётчика (улица + дом + сетевой) 
	i:=Q_PosStr('Улица',WorkFileMemo.Lines.Strings[j],0);
	 if i=0 then continue;//если не нашли поля
	//ищём вхождение точки с запятой чтобы получить значение поля  
	k:=Q_PosStr(';',WorkFileMemo.Lines.Strings[j], i); 
	//добавляем результат в строку для поиска
	CounterString:=CounterString + Copy(WorkFileMemo.Lines.Strings[j],i+6,k-i-6);
  
	//далее смотрим дом
	i:=Q_PosStr('Дом',WorkFileMemo.Lines.Strings[j],0);
	 if i=0 then continue;//если не нашли поля
	//ищём вхождение точки с запятой чтобы получить значение поля  
	k:=Q_PosStr(';',WorkFileMemo.Lines.Strings[j], i); 
	//добавляем результат в строку для поиска
	CounterString:=CounterString + ' ' + Copy(WorkFileMemo.Lines.Strings[j],i+4,k-i-4);

	//наконец сетевой адрес
	//i:=Q_PosStr('ADDR',WorkFileMemo.Lines.Strings[j],0);
	// if i=0 then continue;//если не нашли поля
	//ищём вхождение точки с запятой чтобы получить значение поля  
	//k:=Q_PosStr(';',WorkFileMemo.Lines.Strings[j], i); 
	//добавляем результат в строку для поиска
	//CounterString:=CounterString + ' (' + Copy(WorkFileMemo.Lines.Strings[j],i+5,k-i-5) + ')';

 //ищем их в дереве по тексту
 For x:=0 to StructureTree.Items.Count-1 do
  Begin
  //отрезаем сетевой адрес
  TempString:= Copy(StructureTree.Items.Item[x].Text,0,
				Pos('(',StructureTree.Items.Item[x].Text)-2);
	If TempString=CounterString then
	 Begin
	  NodeToSearch:=StructureTree.Items.Item[x];
	  StructureTree.Select(NodeToSearch);
	  //каждый найденный счётчик переносим в текущее задание
	  Transfer;
	  break;
	 End;
  End;

  End;//конец цикла по строкам файла задания

end;

procedure TMain.RzBitBtn14Click(Sender: TObject);
begin
 CopyCountersFromTaskFile;
end;

procedure TMain.Image7Click(Sender: TObject);
begin
 SelectedImageBoxNo:='6';
 SelectedImageBox:= Image7;
 SaveImageToFileButt.Enabled := true;

 Bevel1.Style := bsLowered;
 Bevel2.Style := bsLowered;
 Bevel3.Style := bsLowered;
 Bevel4.Style := bsLowered;
 Bevel5.Style := bsLowered;
 Bevel6.Style := bsLowered;
 Bevel7.Style := bsRaised;
 Bevel8.Style := bsLowered;
 
end;

procedure TMain.Image8Click(Sender: TObject);
begin
 SelectedImageBoxNo:='7';
 SelectedImageBox:= Image8;
 SaveImageToFileButt.Enabled := true;

 Bevel1.Style := bsLowered;
 Bevel2.Style := bsLowered;
 Bevel3.Style := bsLowered;
 Bevel4.Style := bsLowered;
 Bevel5.Style := bsLowered;
 Bevel6.Style := bsLowered;
 Bevel7.Style := bsLowered;
 Bevel8.Style := bsRaised;
end;

procedure TMain.Image7DblClick(Sender: TObject);
begin
 if Image7.Picture.Graphic <> nil then
  Begin
	FormPhoto.Image.Picture := Image7.Picture;
	FormPhoto.ShowModal;
  End;
end;

procedure TMain.Image8DblClick(Sender: TObject);
begin
 if Image8.Picture.Graphic <> nil then
  Begin
	FormPhoto.Image.Picture := Image8.Picture;
	FormPhoto.ShowModal;
  End;
end;

end.
                  `
