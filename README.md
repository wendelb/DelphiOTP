OTP for Delphi
================

Google Authenticator is based on [RFC 4226](http://www.ietf.org/rfc/rfc4226.txt) - a Time based One Time Password (TOTP) which is initialised using a 16 digit base 32 ([RFC 4648](http://tools.ietf.org/html/rfc4648)) encoded seed value. Initial seeds used for the TOTP can be entered into the Google Authenticator via a camera using QR codes or via the keyboard.

This Repository contains the working functions and all dependencies to either create a token generator or to validate tokens.

Base32-Unit
-----------

The code in previous versions of the `Base32U.pas` was not even close to being unicode ready. If you found this repository while looking for a working Base32 Implementation in Delphi, please have a look at [SZCodeBaseX](http://torry.net/authorsmore.php?id=5726). To have that one working in Delphi XE2 and higher, you will have to replace all `String`-Arguments with `AnsiString` ones.


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
	ShowMessage(Format('%.6d', [Token]));
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
	ShowMessage(Format('%.6d', [Token]));
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

License
-------

This repository is licensed under the MIT license.
