unit Controller.frmHistorico;

interface
uses
model.agendar,System.SysUtils,{$ifdef Android}AndroidApi.Jni.Toast,{$endif}
model.funcionario,
model.marcacao,
model.cliente,
Fmx.Listview,
Fmx.ImgList,
model.orcamento,
UControllerCadastros;
Type
IController = interface
  ['{040F9407-63D5-47E9-AEA3-F1B8477F6772}']
  procedure ListarClientes(AListview:TListview;AImageList:TImageList);
  procedure ListarAgendamentos(AListview:TListview;AImageList:TImageList;AclientName:string);
  procedure ListarOrcamentos(AListview:TListview;AImageList:TImageList;AclientName:string);
end;

TController = class(TinterfacedObject,IController)
  procedure ListarClientes(AListview:TListview;AImageList:TImageList);
  procedure ListarAgendamentos(AListview:TListview;AImageList:TImageList;AclientName:string);
  procedure ListarOrcamentos(AListview:TListview;AImageList:TImageList;AclientName:string);
end;

implementation

{ TController }

procedure TController.ListarAgendamentos(AListview: TListview;
  AImageList: TImageList;AclientName:string);
 var
 Agendar:TAgendar;
 funcionario:TFuncionario;
 marcacao:TMarcacao;
 Time:TTime;
begin
{$ifdef Android}
 Toast('Aguarde...',LongToast);
{$endif}

 Agendar:=TAgendar.GetInstance;
 AListview.Items.Clear;
 for funcionario in Agendar.Funcionarios do
   begin
    for marcacao in funcionario.Agendamentos.Marcacoes do
    begin
      if marcacao.Cliente.Nome = AclientNAme then
       begin
         With Alistview.Items.Add do
         begin
           Data['Nome']:=marcacao.Cliente.Nome;
           Data['Dia']:= FormatDatetime('dddd dd "de" mmmm "de" yyyy',marcacao.Data);
           Data['Foto']:= AimageList.Source[3].ID;
           Data['Profissional']:= Funcionario.Cordialidade +' '+ Funcionario.Nome;
           Data['Servico']:=Marcacao.Servico.Nome;
           for Time in marcacao.Horas do
           begin
            Data['Horario']:=Data['Horario'].AsString +' '+copy( timetostr(Time),0,5);
           end;
           Data['Status']:= marcacao.Status;
         end;
       end;
    end;
   end;

end;

procedure TController.ListarClientes(AListview: TListview;
  AImageList: TImageList);
 var
  Ctrl:ICadastros;
begin
  Ctrl:=TControllerCadastros.Create;
  Ctrl.ListarClientes(Alistview,AimageList);
end;

procedure TController.ListarOrcamentos(AListview: TListview;
  AImageList: TImageList; AclientName: string);
 var
 Agendar:TAgendar;
 Client:TCliente;
 Orcamento:Torcamento;
begin
 {$ifdef Android}
 Toast('Aguarde...',LongToast);
{$endif}
  Agendar:=TAgendar.GetInstance;
  AListview.Items.Clear;
  try
    for Client in Agendar.Clientes do
    begin
     try
      {  for Orcamento in Client.Orcamentos do
        begin
          with AListview.Items.Add do
            begin
               Data['Nome']:=FormatDatetime('dddd dd "de" mmmm "de" yyyy',orcamento.Data);
               Data['Valor']:= Orcamento.valor;
               Data['Status']:=Orcamento.status;
               Data['Foto']:= AimageList.Source[3].ID;
               Data['Lixo']:= AimageList.Source[2].ID;
            end;
        end;}
     Except
       {$ifdef Android}
          Toast('Este cliente n�o possui or�amentos.',LongToast);
       {$endif}
     end;

    end;
  Except

  end;


end;
end.
