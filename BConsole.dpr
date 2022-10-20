program BConsole;

uses
  Forms,
  QStrings in 'QSTRINGS.PAS',
  u_main in 'u_main.pas' {Main},
  u_loadsch in 'u_loadsch.pas' {LoadSchedForm},
  u_util in 'u_util.pas',
  u_transfer in 'u_transfer.pas' {TransForm},
  u_reports in 'u_reports.pas' {Reports},
  u_loginfrom in 'u_loginfrom.pas' {LoginForm},
  u_search in 'u_search.pas' {SearchForm},
  ReadMe in 'ReadMe.pas' {ReadMeForm},
  u_stats in 'u_stats.pas' {StatForm},
  u_photo in 'u_photo.pas' {FormPhoto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TSearchForm, SearchForm);
  Application.CreateForm(TLoadSchedForm, LoadSchedForm);
  Application.CreateForm(TTransForm, TransForm);
  Application.CreateForm(TReports, Reports);
  Application.CreateForm(TReadMeForm, ReadMeForm);
  Application.CreateForm(TStatForm, StatForm);
  Application.CreateForm(TFormPhoto, FormPhoto);
  If ParamCount=0 then
  //	Begin
	 LoginForm.ShowModal;
	 Application.Run;
	//End;
  
end.
