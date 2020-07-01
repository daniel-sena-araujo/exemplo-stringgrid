unit formulario_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons;

type
  TCelula = Record
    Coluna : Integer;
    Linha : Integer;
    Marcada : Boolean;
  end;

type
  TPrincipalForm = class(TForm)
    StringGrid: TStringGrid;
    BitBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtnClick(Sender: TObject);
  private
    CelulaSelecionada : TCelula;
    Celulas : array[1..42] of TCelula;
    procedure PreencherCelulas;
    procedure PreencherArray;
    function CelulaEstaMarcada(Coluna: Integer; Linha: Integer):Boolean;
  public

  end;

var
  PrincipalForm: TPrincipalForm;

implementation

{$R *.dfm}

{ TPrincipalForm }

procedure TPrincipalForm.PreencherCelulas;
var
  Linha : Integer;
  Coluna : Integer;
begin
  StringGrid.Cells[1, 0] := 'Dom';
  StringGrid.Cells[2, 0] := 'Seg';
  StringGrid.Cells[3, 0] := 'Ter';
  StringGrid.Cells[4, 0] := 'Qua';
  StringGrid.Cells[5, 0] := 'Qui';
  StringGrid.Cells[6, 0] := 'Sex';
  StringGrid.Cells[7, 0] := 'Sáb';

  StringGrid.Cells[0, 1] := '1pm';
  StringGrid.Cells[0, 2] := '2pm';
  StringGrid.Cells[0, 3] := '3pm';
  StringGrid.Cells[0, 4] := '4pm';
  StringGrid.Cells[0, 5] := '5pm';
  StringGrid.Cells[0, 6] := '6pm';

  for Linha := 1 to 6 do
  begin
    for Coluna := 1 to 7 do
    begin
      if Coluna in [1, 7] then
        StringGrid.Cells[Coluna, Linha] := 'Não'
      else
        StringGrid.Cells[Coluna, Linha] := 'Sim';
    end;
  end;
end;

procedure TPrincipalForm.FormCreate(Sender: TObject);
begin
  PreencherArray();
  PreencherCelulas();
end;

procedure TPrincipalForm.StringGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (ACol = 0) or (ARow = 0) then
    Exit;

  StringGrid.Canvas.Font.Color := clWhite;

  if CelulaEstaMarcada(ACol, ARow) then
    StringGrid.Canvas.Brush.Color := clRed
  else if Odd(ARow) then
    StringGrid.Canvas.Brush.Color := clBlue
  else
    StringGrid.Canvas.Brush.Color := clGreen;

  StringGrid.Canvas.FillRect(Rect);
  StringGrid.Canvas.TextOut(Rect.Left + 2, Rect.Top, StringGrid.Cells[ACol, ARow]);
end;

procedure TPrincipalForm.StringGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CelulaSelecionada.Coluna := ACol;
  CelulaSelecionada.Linha := ARow;
end;

procedure TPrincipalForm.PreencherArray;
var
  Coluna : Integer;
  Linha : Integer;
  Posicao : Integer;
begin
  Posicao := 1;

  for Linha := 1 to 6 do
  begin
    for Coluna := 1 to 7 do
    begin
      Celulas[Posicao].Coluna := Coluna;
      Celulas[Posicao].Linha := Linha;
      Celulas[Posicao].Marcada := False;
      Posicao := Posicao + 1;
    end;
  end;
end;

function TPrincipalForm.CelulaEstaMarcada(Coluna, Linha: Integer): Boolean;
var
  Posicao : Integer;
begin
  Result := False;

  for Posicao := 1 to 42 do
  begin
    if (Celulas[Posicao].Coluna <> Coluna) or (Celulas[Posicao].Linha <> Linha) then
      Continue;

    Result := Celulas[Posicao].Marcada;
    Break;

  end;
end;

procedure TPrincipalForm.BitBtnClick(Sender: TObject);
var
  Posicao : Integer;
begin
  for Posicao := 1 to 42 do
  begin
    if (Celulas[Posicao].Coluna <> CelulaSelecionada.Coluna) or (Celulas[Posicao].Linha <> CelulaSelecionada.Linha) then
      Continue;

    Celulas[Posicao].Marcada := True;
    Break;
  end;

  StringGrid.Repaint();
end;

end.
