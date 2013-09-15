OTP for Delphi
================

Google Authenticator is based on [RFC 4226](http://www.ietf.org/rfc/rfc4226.txt) - a Time based One Time Password (TOTP) which is initialised using a 16 digit base 32 ([RFC 4648](http://tools.ietf.org/html/rfc4648)) encoded seed value. Initial seeds used for the TOTP can be entered into the Google Authenticator via a camera using QR codes or via the keyboard.

This Repository contains the working functions and all dependencies to either create a token generator or to validate tokens.

Things that were in my way
--------------------------

- Delphi XE2 doesn't come with Base32 functionality
- DateTimeToUnix from DateUtils Unit performs a shitty conversion.
- Indy 10's ToBytes on a Unicode String comes back with some surprises.
- Indy 10's ToBytes on a Int64: The Result is the reverse of what I a) expected and b) wanted


How to generate Time-based OTP using the code provided?
-------------------------------------------------------
_MYBASE32SECRET_ is the pre-shared secret.

```Pascal
uses
  GoogleOTP;
  
[...]

var
	Token: Integer;
begin
	// Using time-based Token
	Token := CalculateOTP('MYBASE32SECRET'); // Returns the Token as Integer;

	// To display the token, use the Format-Function
	ShowMessage(Format('%.6d', [Token]);
end;
```

How to generate Counter-based OTP using the code provided?
-------------------------------------------------------
_MYBASE32SECRET_ is the pre-shared secret.
_4_ is an example value from the counter

```Pascal
uses
  GoogleOTP;
  
[...]

var
	Token: Integer;
begin
	// Using counter-based Token
	Token := CalculateOTP('MYBASE32SECRET', 4); // Returns the Token as Integer;

	// To display the token, use the Format-Function
	ShowMessage(Format('%.6d', [Token]);
end;
```

How to validate Time-based OTP using the code provided?
-------------------------------------------------------

```Pascal
uses
  GoogleOTP;
  
[...]

var
	Token: Integer;
begin
	// Ask the user for a token
	Token := 123456;
	
	// Check the Token
	if (ValidateTOPT('MYBASE32SECRET', Token)) then
		ShowMessage('Access granted')
	else
		ShowMessage('Access denied');
end;
```
