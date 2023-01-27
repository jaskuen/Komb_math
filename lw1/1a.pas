PROGRAM NarAlg(INPUT, OUTPUT);
USES
  Utils;
CONST
  N = 12;
VAR
  I, J, K, M: BYTE;
  A: ARRAY [1 .. N] OF BYTE;
  Doing: BOOLEAN;
  Seconds: REAL;

PROCEDURE SWAP(VAR A, B: BYTE);
VAR
  T: BYTE;
BEGIN
  T := A;
  A := B;
  B := T
END;

BEGIN
  FOR J := 1 TO N
  DO
    A[J] := J;
  I := 1;
  Doing := TRUE;
  WHILE Doing
  DO
    BEGIN
      I := N - 1;
//      WRITELN(A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10]);
      WHILE A[I] > A[I + 1]
      DO
        BEGIN
          I := I - 1;
          IF I = 0
          THEN
            BEGIN
              Doing := FALSE;
              BREAK
            END
        END;
      IF NOT Doing
      THEN
        BREAK;
      J := N;
      WHILE A[J] < A[I]
      DO
        J := J - 1;
      SWAP(A[I], A[J]);
      K := I + 1;
      M := I + (N - I) DIV 2;
      WHILE K <= M
      DO
        BEGIN
          SWAP(A[K], A[N - K + I + 1]);
          K := K + 1
        END
    END;
  Seconds := Milliseconds / 1000;
  WRITELN(Seconds:0:2)
END.
   
  
