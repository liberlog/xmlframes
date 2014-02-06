program hotel;

{$MODE Delphi}

uses
  Forms, Interfaces, fonctions_init, U_XMLFenetrePrincipale,
  LCLType, lazextcomponents, fonctions_ibx,  fonctions_dialogs,
  fonctions_system,
  fonctions_xml,
  u_multidonnees, U_CustomFrameWork,lazmanframes, lazmansoft, lazxmlframes,
  fonctions_ObjetsXML, Dialogs, LResources, JvXPBarLaz;

{$IFNDEF FPC}
{$R *.res}
{$R WindowsXP.res}
var
	gc_classname: Array[0..255] of char;
	gi_result: integer;
{$ENDIF}

{$IFNDEF FPC}{$R hotel.rc}{$ENDIF}

begin
  {$I hotel.lrs}
  Application.Initialize;
  gs_LeonardiSubDir := '..'+DirectorySeparator+'Leon' +DirectorySeparator;
  GS_SUBDIR_IMAGES_SOFT := gs_LeonardiSubDir+'images'+DirectorySeparator;
  {$IFNDEF FPC}
  Application.Title := 'Test';

  // Met dans gc_classname le nom de la class de l'application
  GetClassName(Application.handle, gc_classname, 254);

  // Renvoie le Handle de la première fenêtre de Class (type) gc_classname
  // et de titre TitreApplication (0 s'il n'y en a pas)
  gi_result := FindWindow(gc_classname, 'GENERIQUE');

  if gi_result <> 0 then   // Une instance existante trouvée
    begin
      ShowWindow(gi_result, SW_RESTORE);
      SetForegroundWindow(gi_result);
      Application.Terminate;
      Exit;
    end
  else  // Première création
  {$ENDIF}
	  begin

	  end;

  doShowWorking(ExtractFileName(Application.ExeName));

  try
    gb_DicoKeyFormPresent  := True ;
    gb_DicoUseFormField    := True ;
    gb_DicoGroupementMontreCaption := False ;
    if not fb_ReadIni ( FIniMain ) Then
     Begin
      ShowMessage ( 'XML file not initalized.' );
      Application.Terminate;
     end;
    Application.CreateForm(TF_FenetrePrincipale, F_FenetrePrincipale);
  finally
  end;
  Application.Run;
end.
