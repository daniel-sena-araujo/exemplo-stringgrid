program exemplo_string_grid;

uses
  Forms,
  formulario_principal in 'formulario_principal.pas' {PrincipalForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipalForm, PrincipalForm);
  Application.Run;
end.
