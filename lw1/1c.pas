PROGRAM RandomPerm(INPUT, OUTPUT);
USES
  CRT;
CONST
  N = 10;
VAR
  A: ARRAY [1 .. N] OF INTEGER;
  I, J: INTEGER;
  
PROCEDURE SWAP(VAR A, B: INTEGER);
VAR
  T: INTEGER;
BEGIN
  T := A;
  A := B;
  B := T
END;

BEGIN
  FOR I := 1 TO N
  DO
    A[I] := I;
  FOR I := N DOWNTO 1
  DO
    BEGIN
      J := RANDOM(N) + 1;
      SWAP(A[J], A[I])
    END;
  FOR I := 1 TO N
  DO
    WRITE(A[I]);
  WRITELN
END.
    