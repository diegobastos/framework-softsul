unit uPopupMessage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TMessageType = (mtNotification, mtError, mtWarning, mtInformation);

  TfrmPopupMessage = class(TForm)
    lblMessage: TLabel;
    imgIcon: TImage;
  private
    { Private declarations }
  public
    class procedure ShowMessage(const Msg: string; MsgType: TMessageType); static;
  end;

var
  frmPopupMessage: TfrmPopupMessage;

implementation

{$R *.dfm}

{$REGION 'TfrmPopupMessage' }

class procedure TfrmPopupMessage.ShowMessage(const Msg: string; MsgType: TMessageType);
const _ImgLocal_ ='C:\projects\framework-softsul\framework\imagens\popup\';
begin
  with TfrmPopupMessage.Create(nil) do
  begin
    try
      lblMessage.Caption := Msg;

      case MsgType of
        mtNotification:
          begin
            Caption := 'Notificação';
            imgIcon.Picture.LoadFromFile(_ImgLocal_+'info.png');
          end;
        mtError:
          begin
            Caption := 'Erro';
            imgIcon.Picture.LoadFromFile(_ImgLocal_+'error.png');
          end;
        mtWarning:
          begin
            Caption := 'Alerta';
            imgIcon.Picture.LoadFromFile(_ImgLocal_+'warning.png');
          end;
        mtInformation:
          begin
            Caption := 'Informação';
            imgIcon.Picture.LoadFromFile(_ImgLocal_+'info.png');
          end;
      end;

      ShowModal;
    finally
      Free;
    end;
  end;
end;

{$ENDREGION}

end.
