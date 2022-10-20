unit u_loginfrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzRadGrp, RzButton, Oracle;

type
  TLoginForm = class(TForm)
    RzBitBtn1: TRzBitBtn;
    CityRadio: TRzRadioGroup;
    RzBitBtn2: TRzBitBtn;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
	 { Public declarations }
  PCity:string;
	 
  end;

var
  LoginForm: TLoginForm;
  InStarString,OracleString,City:string;

implementation

uses u_transfer;

{$R *.dfm}

procedure TLoginForm.RzBitBtn1Click(Sender: TObject);
begin
//InStarString:='';
//If TransForm.InStarConn.Connected=true then  TransForm.InStarConn.Connected:=false;

{If CityRadio.ItemIndex=0 then 
  begin
	City:='SKEK';//для кемеровской базы инстара

	InStarString:='Provider=SQLOLEDB.1;Password=1;Persist Security Info=True;'+
	'User ID=sa;Initial Catalog=InStar_SKEK;'+
	'Data Source=192.168.61.3;Use Procedure for Prepare=1;'+
	'AutoTranslate=True;Packet Size=4096;Workstation ID=ES-IT2;'+
	'Use Encryption for Data=False;Tag with column collation when possible=False';
	
	 OracleString:='ORCL.LOCAL.SKEK.RU'; 
	end;

 If CityRadio.ItemIndex=1 then 
  begin
	City:='LK';//для ленинской базы инстара

	InStarString:='Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;'+
	'User ID=sa;Initial Catalog=InStar_LK;'+
	'Data Source=192.168.61.4;Use Procedure for Prepare=1;'+
	'AutoTranslate=True;Packet Size=4096;Workstation ID=ES-IT2;'+
	'Use Encryption for Data=False;Tag with column collation when possible=False';

	OracleString:='ORCLLEN.LOCAL.SKEK.RU';	
  end;}

  Loginform.Close;
//\ Main.Show;

end;

procedure TLoginForm.RzBitBtn2Click(Sender: TObject);
begin

Application.Terminate;
 
end;

procedure TLoginForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

InStarString:='';

If CityRadio.ItemIndex=0 then 
  begin
	City:='SKEK';//для кемеровской базы инстара
	PCity:='SKEK';

	InStarString:='Provider=SQLOLEDB.1;Password=1;Persist Security Info=True;'+
	'User ID=sa;Initial Catalog=InStar_SKEK;'+
	'Data Source=192.168.61.3;Use Procedure for Prepare=1;'+
	'AutoTranslate=True;Packet Size=4096;Workstation ID=ES-IT2;'+
	'Use Encryption for Data=False;Tag with column collation when possible=False';
	
	 OracleString:='ORCL.LOCAL.SKEK.RU'; 
	end;

 If CityRadio.ItemIndex=1 then 
  begin
	City:='LK';//для ленинской базы инстара
	PCity:='LK';

	InStarString:='Provider=SQLOLEDB.1;Password=sa;Persist Security Info=True;'+
	'User ID=sa;Initial Catalog=InStar_LK;'+
	'Data Source=192.168.61.4;Use Procedure for Prepare=1;'+
	'AutoTranslate=True;Packet Size=4096;Workstation ID=ES-IT2;'+
	'Use Encryption for Data=False;Tag with column collation when possible=False';

	OracleString:='ORCLLEN.LOCAL.SKEK.RU';	
  end;
end;

end.

