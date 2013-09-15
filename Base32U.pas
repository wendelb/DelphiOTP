unit Base32U;

interface

uses
  System.SysUtils;  // For UpperCase (Base32Decode)

type
  Base32 = class
  public
    /// <param name="inString">
    ///   Base32-String (Attention: No validity checks)
    /// </param>
    /// <summary>
    ///   Decodes a Base32-String
    /// </summary>
    /// <returns>
    ///   Unicode String containing the ANSI-Data from that Base32-Input
    /// </returns>
    class function Decode(const inString: String): String;

    /// <param name="inString">
    ///   Input
    /// </param>
    /// <summary>
    ///   Encodes data into a Base32-String
    /// </summary>
    /// <returns>
    ///   Unicode String containing the Base32-String
    /// </returns>
    class function Encode(const inString: String): String;
  end;

implementation

{$REGION 'Base32Functions'}

// Delphi functions for Base32
// Somewhere from Embarcadero.
// My Source is http://www.delphipraxis.net/995124-post9.html
const
  ValidChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';

function FromBase32String(const inString : string) : string;
var
   outString : string;
   aByte : byte;
   bit_buffer,
   inIndex,
   bits_in_buffer,
   outSize,
   pos1, pos2,
   i : integer;
begin
   outSize := (length(inString) * 5 div 8) + 1;
   outString := StringOfChar(' ',outSize);
   pos1 := Pos(inString[1],ValidChars) - 1;
   pos2 := Pos(inString[2],ValidChars) - 1;
   bit_buffer := pos1 or (pos2 shl 5);
   if length(inString) < 3 then begin
      aByte := bit_buffer;
      outString[1] := Chr(aByte);
      result := outString;
      exit;
   end;
   bits_in_buffer := 10;
   inIndex := 3;
   for i := 1 to outSize + 1 do begin
      aByte := bit_buffer;
      outString[i] := Chr(aByte);
      bit_buffer := bit_buffer shr 8;
      bits_in_buffer := bits_in_buffer - 8;
      while (bits_in_buffer < 8) and (inIndex <= length(inString)) do begin
         pos1 := (Pos(inString[inIndex],ValidChars) - 1);
         Inc(inIndex);
         bit_buffer := bit_buffer or (pos1 shl bits_in_buffer);
         bits_in_buffer := bits_in_buffer + 5;
      end;
   end;

   result := outString;
end;

function ToBase32String(const inString : string) : string;
var
   currentChar,
   outString : string;
   inIndex,
   validIndex,
   high : integer;
   aByte,
   currentByte : byte;
begin
   high := 5;
   inIndex := 1;
   while inIndex <= Length(inString) do begin
      currentChar := inString[inIndex];
      currentByte := Ord(currentChar[1]);
      if (high > 8) then begin
         // get the last piece from the current byte, shift it to the right
         // and increment the byte counter
         validIndex := (currentByte shr (high - 5)) mod 256;
         Inc(inIndex);
         currentChar := inString[inIndex];
         currentByte := Ord(currentChar[1]);
         if (inIndex <> Length(inString) + 1) then begin
            // if we are not at the end, get the first piece from
            // the next byte, clear it and shift it to the left
            aByte := (currentByte shl (16 - high)) mod 256;
            validIndex := ((aByte shr 3 ) or validIndex) mod 256;
         end;
         high := high - 3;
      end else if(high = 8) then begin
         Inc(inIndex);
         validIndex := currentByte shr 3;
         high := high - 3;
      end else begin
         // simply get the stuff from the current byte
         aByte := currentByte shl (8 - high) mod 256;
         validIndex := aByte shr 3;
         high := high + 5;
      end;
      currentChar := ValidChars[validIndex + 1];
      outString := outString + currentChar;
   end;
   result := outString;
end;


// As the FromBase32String Function doesn't has the result I'm looking for, here
// is my version of that function. This is converted from a PHP function, which
// can be found here: https://www.idontplaydarts.com/2011/07/google-totp-two-factor-authentication-for-php/
function Base32Decode(const source: String): String;
var
  UpperSource: String;
  p, i, l, n, j: Integer;
begin
  UpperSource := UpperCase(source);

  l := Length(source);
  n := 0; j := 0;
  Result := '';

  for i := 1 to l do
  begin
    n := n shl 5; 				// Move buffer left by 5 to make room

    p := Pos(UpperSource[i], ValidChars);
    if p >= 0 then
      n := n + (p - 1);         // Add value into buffer

		j := j + 5;				// Keep track of number of bits in buffer

    if (j >= 8) then
    begin
      j := j - 8;
      Result := Result + chr((n AND ($FF shl j)) shr j);
    end;
  end;
end;

{$ENDREGION}

{ Base32 }

class function Base32.Decode(const inString: String): String;
begin
//  Result := FromBase32String(inString);
  Result := Base32Decode(inString);
end;

class function Base32.Encode(const inString: String): String;
begin
  Result := ToBase32String(inString);
end;

end.
