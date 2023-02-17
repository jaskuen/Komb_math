PROGRAM NumKomp(INPUT, OUTPUT);
CONST
  N = 10;
  K = 6;

TYPE
  CArr = ARRAY [0 .. K] OF INTEGER;
VAR
  I, H, CN, CK: INTEGER;
  A: CArr;

PROCEDURE WriteKomp(VAR A: CArr);
VAR
  I, Num: INTEGER;
  Plus: BOOLEAN;
BEGIN 
  Plus := TRUE;
  FOR I := 1 TO K - 1
  DO
    BEGIN
      IF I = 1
      THEN
        Num := A[I] - 1
      ELSE
        Num := A[I] - A[I - 1] - 1;
      IF Num <> 0
      THEN
        WRITE(Num, ' ')
    END;
  Num := N + K - 1 - A[K - 1];
  IF Num <> 0
  THEN
    WRITE(Num);
  WRITELN  
END;
  
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
      WriteKomp(A);
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
    

