program ExampleApp;

uses
  Vcl.Forms,
  Form in 'Form.pas' {FormOTP},
  Base32U in '..\Base32U.pas',
  GoogleOTP in '..\GoogleOTP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'One Time Password Example';
  Application.CreateForm(TFormOTP, FormOTP);
  Application.Run;
end.
