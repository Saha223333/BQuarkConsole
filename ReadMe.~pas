unit ReadMe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, RzEdit, ExtCtrls;

type
  TReadMeForm = class(TForm)
    RzRichEdit1: TRzRichEdit;
    Image1: TImage;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReadMeForm: TReadMeForm;

implementation

{$R *.dfm}

procedure TReadMeForm.FormShow(Sender: TObject);
var
PathTo:string;
begin
PathTo:=ExtractFilePath(Application.ExeName)+'ReadMe.txt';
RzRichEdit1.Lines.LoadFromFile(PathTo);
end;

end.

