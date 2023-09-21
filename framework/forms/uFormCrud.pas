unit uFormCrud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uIFramework, Vcl.ExtCtrls;

type
  TformCrud = class(TForm, ICrudForm)
    pnlDesktop: TPanel;
  private

  protected
    {ICrudForm}
    procedure CreateRecord; virtual; abstract;
    procedure ReadRecord; virtual; abstract;
    procedure UpdateRecord; virtual; abstract;
    procedure DeleteRecord; virtual; abstract;
  public
    {ICrudForm}
    procedure OpenForm(AParent: TWinControl; AKey: variant); virtual; abstract;
  end;

var
  formCrud: TformCrud;

implementation

{$R *.dfm}

{$REGION 'TformCrud' }

{$ENDREGION}

end.
