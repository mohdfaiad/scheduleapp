unit UfrmCadastrarOrcamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UfrmCadastrosBase, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.ImageList, FMX.ImgList, FMX.Ani,
  FMX.Objects, FMX.ListBox, FMX.Layouts, FMX.MultiView, FMX.ListView,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Effects, FMX.Edit,Ucontrollers;

type
  TFrmCadastrarOrcamento = class(TFrmCadastrosBase)
    LayouConteudo: TLayout;
    RecData: TRectangle;
    RectTotal: TRectangle;
    Text2: TText;
    TextData: TText;
    RecTitleProcedimentos: TRectangle;
    LayListview: TLayout;
    ListView1: TListView;
    Layout1: TLayout;
    Layout2: TLayout;
    Circle1: TCircle;
    Text3: TText;
    TextDica: TText;
    Text4: TText;
    LaySalvar: TLayout;
    ImageSalvar: TImage;
    LayCancelar: TLayout;
    ImageCancelar: TImage;
    Text5: TText;
    LayServicos: TLayout;
    BgServicos: TRectangle;
    LayCenterServicos: TLayout;
    BGCadServico: TRectangle;
    Layout3: TLayout;
    Image1: TImage;
    Image2: TImage;
    Text6: TText;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    Text7: TText;
    Text8: TText;
    GlowEffect1: TGlowEffect;
    procedure CadastrarServico(Sender:TObject);
    procedure CancelarServico(Sender:TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Text7Click(Sender: TObject);
    procedure Efeito(Sender:TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastrarOrcamento: TFrmCadastrarOrcamento;

implementation

{$R *.fmx}

{ TFrmCadastrarOrcamento }

procedure TFrmCadastrarOrcamento.CadastrarServico(Sender:TObject);
begin
LayServicos.Visible:=true;
end;

procedure TFrmCadastrarOrcamento.CancelarServico(Sender:TObject);
begin
 LayServicos.Visible:=false;

end;

procedure TFrmCadastrarOrcamento.Efeito(Sender: TObject);
var
Controller:IController;
begin
  inherited;
   Controller:=TController.Create;
   Controller.EfectTextToUp(Sender);
end;

procedure TFrmCadastrarOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
Action:=TCloseAction.caFree;
end;

procedure TFrmCadastrarOrcamento.Text7Click(Sender: TObject);
var
Controller:IController;
begin
  inherited;
   Controller:=TController.Create;
   Controller.EfectTextToUp(Sender);
end;

end.