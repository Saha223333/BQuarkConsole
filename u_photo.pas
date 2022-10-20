unit u_photo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormPhoto = class(TForm)
    Image: TImage;
    procedure ImageDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPhoto: TFormPhoto;

implementation

{$R *.dfm}

procedure TFormPhoto.ImageDblClick(Sender: TObject);
begin
Self.Close;
end;

end.

