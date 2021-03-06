unit model.listAgendar;

interface
uses
model.agendar,system.Generics.collections;
Type
TListAgendar = class
  private
    FRequisicoes: TObjectList<TAgendar>;
    procedure SetRequisicoes(const Value: TObjectList<TAgendar>);
  published
  property Requisicoes:TObjectList<TAgendar> read FRequisicoes write SetRequisicoes;
  constructor create;
  destructor destroy;override;
  public
    class function GetInstance: TListAgendar;
    class procedure ReleaseInstance;
  strict private
    class var FInstance: TListAgendar;
  end;

implementation

{ TListAgendar }

constructor TListAgendar.create;
begin
 FRequisicoes:=TObjectList<TAgendar>.create;
end;

destructor TListAgendar.destroy;
begin
 FRequisicoes.Free;
  inherited;
end;

procedure TListAgendar.SetRequisicoes(const Value: TObjectList<TAgendar>);
begin
  FRequisicoes := Value;
end;

class function TListAgendar.GetInstance: TListAgendar;
begin
  If FInstance = nil Then
  begin
    FInstance := model.listAgendar.TListAgendar.create();
  end;
  Result := FInstance;
end;

class procedure TListAgendar.ReleaseInstance;
begin
  if Assigned(Self.FInstance) then
    Self.FInstance.Free;
end;
initialization
finalization
TListAgendar.ReleaseInstance;
end.
