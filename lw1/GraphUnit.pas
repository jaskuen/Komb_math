UNIT GraphUnit;

INTERFACE
CONST
  MaxVertex = 100;
  MaxEdge = MaxVertex * MaxVertex;
 TYPE
  TVertex = 1 .. MaxVertex;
  TEdge = 0 .. MaxEdge;
  
  TAdjacencyMatrix = ARRAY [TVertex, TVertex] OF INTEGER;
  
  TEdgeList = ARRAY [TEdge] OF RECORD
    Vert1: TVertex;
    Vert2: TVertex;
    Weight: INTEGER
  END;
  
PROCEDURE ReadMatrix(VAR FIn: TEXT; VAR NumVert: TVertex; VAR MatrixGraph: TAdjacencyMatrix);
PROCEDURE PrintMatrix(VAR FOut: TEXT; NumVert: TVertex; VAR MatrixGraph: TAdjacencyMatrix);
PROCEDURE ReadList(VAR FIn: TEXT; VAR NumVert: TVertex; VAR NumEdg: TEdge; VAR ListVertices: TEdgeList);
PROCEDURE PrintList(VAR FOut: TEXT; NumVert: TVertex; NumEdg: TEdge; VAR ListVertices: TEdgeList);
PROCEDURE ConvertMatrixToList(NumVert: TVertex; VAR NumEdg: TEdge; VAR MatrixGraph: TAdjacencyMatrix; VAR ListVertices: TEdgeList);
PROCEDURE ConvertListToMatrix(NumVert: TVertex; NumEdg: TEdge; VAR MatrixGraph: TAdjacencyMatrix; VAR ListVertices: TEdgeList);

IMPLEMENTATION

PROCEDURE ReadMatrix(VAR FIn: TEXT; VAR NumVert: TVertex; VAR MatrixGraph: TAdjacencyMatrix);
VAR
  I, J: INTEGER;
BEGIN
  READLN(FIn, NumVert);
  FOR I := 1 TO NumVert
  DO
    BEGIN
      FOR J := 1 TO NumVert
      DO
        READ(FIn, MatrixGraph[I, J]);
      READLN(FIn)
    END
END;


PROCEDURE PrintMatrix(VAR FOut: TEXT; NumVert: TVertex; VAR MatrixGraph: TAdjacencyMatrix);
VAR
  I, J: INTEGER;
BEGIN
  WRITELN(FOut, NumVert);
  FOR I := 1 TO NumVert
  DO
    BEGIN
      FOR J := 1 TO NumVert
      DO
        WRITE(FOut, MatrixGraph[I, J], ' ');
      WRITELN
    END
END;          
      
PROCEDURE ReadList(VAR FIn: TEXT; VAR NumVert: TVertex; VAR NumEdg: TEdge; VAR ListVertices: TEdgeList);
VAR
  I: INTEGER;
BEGIN
  READLN(FIn, NumVert, NumEdg);
  FOR I := 1 TO NumEdg
  DO
    READLN(FIn, ListVertices[I].Vert1, ListVertices[I].Vert2, ListVertices[I].Weight)
END;

PROCEDURE PrintList(VAR FOut: TEXT; NumVert: TVertex; NumEdg: TEdge; VAR ListVertices: TEdgeList);
VAR
  I: INTEGER;
BEGIN
  WRITELN(FOut, NumVert, ' ', NumEdg);
  FOR I := 1 TO NumEdg
  DO
    WRITELN(FOut, ListVertices[I].Vert1, ' ', ListVertices[I].Vert2, ' ', ListVertices[I].Weight)
END;

PROCEDURE ConvertMatrixToList(NumVert: TVertex; VAR NumEdg: TEdge; VAR MatrixGraph: TAdjacencyMatrix; VAR ListVertices: TEdgeList);
VAR
  I, J: INTEGER;
BEGIN
  NumEdg := 0;
  FOR I := 1 TO NumVert - 1
  DO
    FOR J := I + 1 TO NumVert
    DO
      IF MatrixGraph[I, J] > 0
      THEN
        BEGIN
          NumEdg := NumEdg + 1;
          ListVertices[NumEdg].Vert1 := I;
          ListVertices[NumEdg].Vert2 := J;
          ListVertices[NumEdg].Weight := MatrixGraph[I, J]
        END
END;

PROCEDURE ConvertListToMatrix(NumVert: TVertex; NumEdg: TEdge; VAR MatrixGraph: TAdjacencyMatrix; VAR ListVertices: TEdgeList);
VAR
  I, J, CEdge: INTEGER;
BEGIN
  FOR CEdge := 1 TO NumEdg
  DO
    BEGIN
      I := ListVertices[CEdge].Vert1;
      J := ListVertices[CEdge].Vert2;
      MatrixGraph[I, J] := ListVertices[CEdge].Weight;
      MatrixGraph[J, I] := ListVertices[CEdge].Weight
    END
END;

BEGIN
END.
