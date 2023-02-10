PROGRAM NumKomp(INPUT, OUTPUT);
CONST
  N = 10;
  K = 6;

TYPE
  CArr = ARRAY [0 .. K] OF INTEGER;
VAR
  I, H, CN, CK: INTEGER;
  A: CArr;

  
BEGIN
  CN := N + K - 1;
  CK := K - 1;
  A[0] := -1;
  FOR I := 1 TO CK
  DO
    A[I] := I;
  H := 1;
  WHILE H <> 0
  DO
    BEGIN
      FOR I := 1 TO CK
      DO
        WRITE(A[I]);
      WRITELN;
      H := CK;
      WHILE A[H] = CN - CK + H
      DO
        H := H - 1;
      A[H] := A[H] + 1;
      FOR I := H + 1 TO CK
      DO
        A[I] := A[I - 1] + 1
    END
END.
    

