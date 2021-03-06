unit model.agendados;

interface
uses
model.funcionario,model.cliente,model.servico,model.empresa,system.Generics.collections;
Type
TAgendados = class
  private
    FClientes: TObjectList<TCliente>;
    FEmpresa: TEmpresa;
    FFuncionarios: TObjectList<TFuncionario>;
    FServicos: TObjectList<TServico>;
    procedure SetClientes(const Value: TObjectList<TCliente>);
    procedure SetEmpresa(const Value: TEmpresa);
    procedure SetFuncionarios(const Value: TObjectList<TFuncionario>);
    procedure SetServicos(const Value: TObjectList<TServico>);
  public
   property Funcionarios:TObjectList<TFuncionario> read FFuncionarios write SetFuncionarios;
   property Clientes:TObjectList<TCliente> read FClientes write SetClientes;
   property Servicos:TObjectList<TServico> read FServicos write SetServicos;
   property Empresa:TEmpresa read FEmpresa write SetEmpresa;
   destructor destroy;override;
   constructor Create;
end;

implementation

{ TAgendados }

constructor TAgendados.Create;
begin
FFuncionarios:=TObjectList<TFuncionario>.create;
FClientes:=TObjectList<TCliente>.create;
FServicos:=TObjectList<TServico>.create;
FEmpresa:=TEmpresa.create;
end;

destructor TAgendados.destroy;
begin
FFuncionarios.free;
FClientes.Free;
FServicos.Free;
FEmpresa.Free;
  inherited;
end;

procedure TAgendados.SetClientes(const Value: TObjectList<TCliente>);
begin
  FClientes := Value;
end;

procedure TAgendados.SetEmpresa(const Value: TEmpresa);
begin
  FEmpresa := Value;
end;

procedure TAgendados.SetFuncionarios(const Value: TObjectList<TFuncionario>);
begin
  FFuncionarios := Value;
end;

procedure TAgendados.SetServicos(const Value: TObjectList<TServico>);
begin
  FServicos := Value;
end;

end.
