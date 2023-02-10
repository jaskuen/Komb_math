PROGRAM NumKomp(INPUT, OUTPUT);
CONST
  N = 10;
  K = 3;

TYPE
  MArr = ARRAY [1 .. N] OF INTEGER;
VAR
  I: INTEGER;
  M: MArr;
  
FUNCTION IsKomp(VAR A: MArr): BOOLEAN;
VAR
  I, Sum: INTEGER;
BEGIN
  Sum := 0;
  FOR I := 1 TO K
  DO
    Sum := Sum + A[K - I];
  IsKomp := Sum = N
END; 
  
BEGIN
  FOR I := 1 TO K
  DO
    M[I] := 1;
  WHILE M[K] <> N - K + 1
  DO
    BEGIN
      IF IsKomp(M)
      THEN
        BEGIN
          FOR I := 1 TO K
          DO
            WRITE(M[K - I]);
          WRITELN
        END;
      I := 0;
      WHILE M[I] = N - 1
      DO
        BEGIN 
          M[I] := 1;
          I := I + 1
        END;
      M[I] := M[I] + 1
    END
END.
    

