PROGRAM JohnTrotAlg(INPUT, OUTPUT);
USES
  Utils;
CONST
  N = 11;
VAR
  P, D: ARRAY [0 .. N + 1] OF INTEGER;
  I, Id: INTEGER;
  Seconds: REAL;
  
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
    BEGIN
      P[I] := I;
      D[I] := -1
    END;
  P[0] := N + 1;
  P[N + 1] := N + 1;
  WHILE TRUE
  DO
    BEGIN
//      FOR I := 1 TO N
//      DO
//        WRITE(P[I]);
//      WRITE(' --- ');
//      FOR I := 1 TO N
//      DO
//        WRITE(D[I], ' ');
//      WRITELN;
      Id := -1;
      FOR I := 1 TO N
      DO
        IF Id <> -1
        THEN
          BEGIN
            IF (P[I] > P[I + D[I]]) AND (P[I] > P[Id])
            THEN
              Id := I
          END
        ELSE
          IF P[I] > P[I + D[I]]
          THEN
            Id := I;
      IF Id = -1
      THEN
        BREAK;
      FOR I := 1 TO N
      DO
        IF P[I] > P[Id]
        THEN
          D[I] := -D[I];
      SWAP(P[Id], P[Id + D[Id]]);
      SWAP(D[Id], D[Id + D[Id]])
    END;
  Seconds := Milliseconds / 1000;
  WRITELN(Seconds:0:2)
END.
  