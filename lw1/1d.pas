PROGRAM FindMinWay(INPUT, OUTPUT);
USES
  GraphUnit;
CONST
  N = 50;
TYPE
  NarArr = ARRAY [1 .. N] OF BYTE;
VAR
  I, J, K, M: BYTE;
  A, MinA: NarArr;
  Doing: BOOLEAN;
  Matrix: TAdjacencyMatrix;
  MinSum: LONGINT;
  F: TEXT;
  NumVert: TVertex;

PROCEDURE SWAP(VAR A, B: BYTE);
VAR
  T: BYTE;
BEGIN
  T := A;
  A := B;
  B := T
END;

FUNCTION CountSum(VAR A: NarArr; VAR M: TAdjacencyMatrix; VAR NumVert: TVertex): LONGINT;
VAR
  Sum: LONGINT;
  I: INTEGER;
BEGIN
  Sum := 0;
  FOR I := 1 TO NumVert - 1
  DO
    Sum := Sum + M[A[I], A[I + 1]];
  Sum := Sum + M[A[NumVert], A[1]];
  CountSum := Sum 
END;

BEGIN
  ASSIGN(F, 'AdjMatr.txt');
  RESET(F);
  NumVert := N;
  ReadMatrix(F, NumVert, Matrix);
  FOR J := 1 TO NumVert
  DO
    A[J] := J;
  I := 1;
  Doing := TRUE;
  MinSum := -1;
  WHILE Doing
  DO
    BEGIN
      IF (CountSum(A, Matrix, NumVert) < MinSum) OR (MinSum < 0)
      THEN
        BEGIN
          MinSum := CountSum(A, Matrix, NumVert);
          MinA := A
        END;
      I := NumVert - 1;
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
      M := I + (NumVert - I) DIV 2;
      WHILE K <= M
      DO
        BEGIN
          SWAP(A[K], A[NumVert - K + I + 1]);
          K := K + 1
        END
    END;
  WRITELN(MinSum);
  FOR I := 1 TO NumVert
  DO
    WRITE(MinA[I], ' ')
END.
