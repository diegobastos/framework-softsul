program SSFramework;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {formMain},
  uIFramework in 'framework\interfaces\uIFramework.pas',
  uFormGrid in 'framework\forms\uFormGrid.pas' {formGrid},
  uGridFarms in 'tests\uGridFarms.pas' {formGridFarms},
  uGridUsers in 'tests\uGridUsers.pas' {formGridUsers},
  uCustomTab in 'framework\classes\uCustomTab.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformGridFarms, formGridFarms);
  Application.CreateForm(TformGridUsers, formGridUsers);
  Application.Run;
end.