program SSFramework;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {formMain},
  uIFramework in 'framework\interfaces\uIFramework.pas',
  uFormGrid in 'framework\forms\uFormGrid.pas' {formGrid},
  uFormCrud in 'framework\forms\uFormCrud.pas' {formCrud},
  uGridFarms in 'tests\uGridFarms.pas' {formGridFarms},
  uCustomTab in 'framework\classes\uCustomTab.pas',
  uGridUsers in 'tests\uGridUsers.pas' {formGridUsers},
  uCrudFarm in 'tests\uCrudFarm.pas' {formCrudFazenda},
  uPopupMessage in 'framework\popups\uPopupMessage.pas' {frmPopupMessage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformGridFarms, formGridFarms);
  Application.CreateForm(TformGridUsers, formGridUsers);
  Application.CreateForm(TformCrudFazenda, formCrudFazenda);
  Application.CreateForm(TfrmPopupMessage, frmPopupMessage);
  Application.Run;
end.
