unit uIFramework;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  {
    Interface responsável por identificar os forms que devem ser abertos dentro
    das abas do pageControl na tela principal
  }
  ITabForm = interface(IInterface)
    ['{6A8764EE-7F20-4AFA-A865-46A5B38D0791}']
    function GetFormName: string;
    procedure OpenForm(AParent: TWinControl);
  end;

  {
    Interface responsável por identificar os forms de CRUD abertos a partir de
    grids
  }
  ICrudForm = interface(IInterface)
    ['{56DACBF1-A813-4EF4-B4FB-DF129109C74E}']
    procedure OpenForm(AParent: TWinControl);
  end;
implementation

end.
