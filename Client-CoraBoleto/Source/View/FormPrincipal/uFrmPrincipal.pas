{====================================================================================}
{             RSC SISTEMAS                                                           }
{        SOLUÇÕES TECNOLÓGICAS                                                       }
{         rscsistemas.com.br                                                         }
{          +55 92 4141-2737                                                          }
{      contato@rscsistemas.com.br                                                    }
{                                                                                    }
{ Desenvolvidor por:                                                                 }
{   Roniery Santos Cardoso                                                           }
{     roniery@rscsistemas.com.br                                                     }
{     +55 92 984391279                                                               }
{                                                                                    }
{                                                                                    }
{ Versão Original RSC SISTEMAS                                                       }
{                                                                                    }
{ Faça uma  doação:                                                                  }
{ Pix - Email: roniery@rscsistemas.com.br                                            }
{ Banco: NuBank                                                                      }
{                                                                                    }
{                                                                                    }
{                                                                                    }
{ Componente Client do Componente -> TRscCoraBoleto                                  }
{ Componente OpenSource                                                              }
{ Licença Pública Geral GNU v3.0                                                     }
{ Permissions of this strong copyleft license are conditioned on making available    }
{ complete source code of licensed works and modifications, which include larger     }
{ works using a licensed work, under the same license. Copyright and license         }
{ notices must be preserved. Contributors provide an express grant of patent rights. }
{                                                                                    }
{====================================================================================}

unit uFrmPrincipal;

interface

uses
    Winapi.Windows
  , Winapi.Messages
  , Winapi.ShellAPI

  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.UITypes
  , System.ImageList
  , System.IniFiles
  , System.Threading
  , System.JSON
  , System.Generics.Collections

  , REST.Json

  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , Vcl.ImgList
  , Vcl.Imaging.pngimage
  , Vcl.WinXPickers
  , Vcl.CheckLst
  , Vcl.Grids
  , Vcl.DBGrids
  , Vcl.Buttons

  , Rsc.Api.Cora.Boleto
  , Rsc.Api.Cora.Boleto.Credenciais
  , Rsc.Api.Cora.Boleto.Schema.Resp.Token
  , Rsc.Api.Cora.Boleto.Schema.Resp.NewBoleto
//  , Rsc.Api.Cora.Boleto.Schema.Resp.NewBoletoPix
  , Rsc.Api.Cora.Boleto.Schema.Resp.BoletoDetalhes
  , Rsc.Api.Cora.Boleto.Schema.Resp.Boletos
  , Rsc.Api.Cora.Boleto.Schema.Resp.NewWebhook
  , Rsc.Api.Cora.Boleto.Schema.Resp.Webhooks

  , Rsc.Api.Cora.Boleto.Schema.Req.NewBoleto
//  , Rsc.Api.Cora.Boleto.Schema.Req.NewBoletoPix
  , Rsc.Api.Cora.Boleto.Schema.Req.AlterarNotificacaoBoleto
  , Rsc.Api.Cora.Boleto.Schema.Req.NewWebhook

  , Rsc.Api.Cora.Boleto.Classes.ServicesReq
  , Rsc.Api.Cora.Boleto.Classes.Notifications

  , Rsc.Api.Cora.Boleto.Schema.Req.NewCarne
  , Rsc.Api.Cora.Boleto.Schema.Resp.NewCarne

  , Data.DB

  , FireDAC.Stan.Intf
  , FireDAC.Stan.Option
  , FireDAC.Stan.Param
  , FireDAC.Stan.Error
  , FireDAC.DatS
  , FireDAC.Phys.Intf
  , FireDAC.DApt.Intf
  , FireDAC.Comp.DataSet
  , FireDAC.Comp.Client
  , FireDAC.Stan.StorageBin

  , IdSSLOpenSSL
  , IdHTTP


  ;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_Token: TButton;
    pgc: TPageControl;
    tbs_Credenciais: TTabSheet;
    btn_Configurar: TButton;
    tbs_token: TTabSheet;
    Label1: TLabel;
    edt_usuario: TEdit;
    edt_Password: TEdit;
    Label2: TLabel;
    Panel4: TPanel;
    btn_SalvarConfig: TButton;
    mm_Resp_token: TMemo;
    bnt_Webhooks: TButton;
    tbs_webhooks: TTabSheet;
    Panel5: TPanel;
    btn_webhook_novo: TButton;
    btn_webhook_deletar: TButton;
    btn_webhook_listar: TButton;
    Panel6: TPanel;
    btn_token_webhook: TButton;
    btn_SolicitarAutorizacao: TButton;
    mm_webhook: TMemo;
    btn_boletos: TButton;
    tbs_Boletos: TTabSheet;
    Panel7: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    pgc_Boletos: TPageControl;
    tbs_Boleto_Novo: TTabSheet;
    Button5: TButton;
    Button6: TButton;
    RscCoraBoleto1: TRscCoraBoleto;
    pgc_NovoBoleto: TPageControl;
    tbs_nb_identificacao: TTabSheet;
    tbs_nb_customer: TTabSheet;
    tbs_nb_services: TTabSheet;
    tbs_nb_payment_terms: TTabSheet;
    tbs_nb_notifications: TTabSheet;
    tbs_nb_payment_forms: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edt_nb_code: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    edt_nb_Cliente_Nome: TEdit;
    btn_gerarGuid_novoBoleto: TButton;
    edt_nb_Cliente_Email: TEdit;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edt_nb_Cliente_Documento: TEdit;
    cbb_nb_Cliente_Tipo_Documento: TComboBox;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edt_nb_Cliente_end_rua: TEdit;
    edt_nb_Cliente_end_numero: TEdit;
    Label10: TLabel;
    edt_nb_Cliente_end_Bairro: TEdit;
    Label11: TLabel;
    edt_nb_Cliente_end_Cidade: TEdit;
    edt_nb_Cliente_end_UF: TEdit;
    Label12: TLabel;
    edt_nb_Cliente_end_Complemento: TEdit;
    Label13: TLabel;
    edt_nb_Cliente_end_CEP: TEdit;
    Label14: TLabel;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edt_nb_Servico_nome: TEdit;
    edt_nb_Servico_ServicoDescricao: TEdit;
    edt_nb_Servico_Valor: TEdit;
    Label17: TLabel;
    btn_nb_AddServico: TSpeedButton;
    dbgServicos: TDBGrid;
    dsServicos: TDataSource;
    fdmServicos: TFDMemTable;
    fdmServicosremover: TStringField;
    fdmServicosnome: TStringField;
    fdmServicosdescricao: TStringField;
    fdmServicosvalor: TFloatField;
    imgList32: TImageList;
    imgDelete: TImage;
    fdmServicostotal: TAggregateField;
    lbl_VlrServicosBoleto: TLabel;
    Panel8: TPanel;
    Label18: TLabel;
    GroupBox6: TGroupBox;
    dtp_nb_TPgto_DataVencimento: TDateTimePicker;
    Label20: TLabel;
    GroupBox7: TGroupBox;
    Label19: TLabel;
    edt_nb_TPgto_MultaValor: TEdit;
    GroupBox8: TGroupBox;
    Label21: TLabel;
    edt_nb_TPgto_MultaValor_InteresseAvaliar: TEdit;
    GroupBox9: TGroupBox;
    Label22: TLabel;
    edt_nb_TPgto_DescontoValor: TEdit;
    Label23: TLabel;
    cbbx_nb_TPgto_DescontoTipo: TComboBox;
    GroupBox10: TGroupBox;
    Label25: TLabel;
    cbbx_nb_Notifica_Email: TComboBox;
    GroupBox11: TGroupBox;
    Label24: TLabel;
    Edt_nb_Notifica_nomeEmail: TEdit;
    Label26: TLabel;
    Edt_nb_Notifica_EmailEnd: TEdit;
    GroupBox12: TGroupBox;
    chkb_nb_Notifica_Regras: TCheckListBox;
    GroupBox13: TGroupBox;
    chkb_nb_FormasPgto: TCheckListBox;
    btn_nb_SolicitarNovoBoleto: TSpeedButton;
    Label27: TLabel;
    edt_CodInternoCliente: TEdit;
    btn_GerarTokenTransacao: TButton;
    tbs_BoletoConsultar: TTabSheet;
    tbs_BoletoCancelar: TTabSheet;
    tbs_BoletoEditarNotificacao: TTabSheet;
    tbs_BoletoListarTodos: TTabSheet;
    Panel10: TPanel;
    SpeedButton2: TSpeedButton;
    Panel11: TPanel;
    SpeedButton3: TSpeedButton;
    Panel12: TPanel;
    SpeedButton4: TSpeedButton;
    Panel13: TPanel;
    SpeedButton5: TSpeedButton;
    fdm_ListaBoletos: TFDMemTable;
    ds_ListaBoletos: TDataSource;
    dbg_ListaBoletos: TDBGrid;
    fdm_ListaBoletoscode: TStringField;
    fdm_ListaBoletosid: TStringField;
    fdm_ListaBoletosstatus: TStringField;
    fdm_ListaBoletostotal_amount: TFloatField;
    fdm_ListaBoletostotal_paid: TFloatField;
    fdm_ListaBoletoscustomer_Name: TStringField;
    fdm_ListaBoletoscustomer_email: TStringField;
    fdm_ListaBoletoscustomer_amount: TFloatField;
    fdm_ListaBoletosservices_description: TStringField;
    btn_AtualizarTokenTransacao: TButton;
    chk_carne: TCheckBox;
    GroupBox14: TGroupBox;
    edt_NumParc: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    edt_dia_venc: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_TokenClick(Sender: TObject);
    procedure btn_ConfigurarClick(Sender: TObject);
    procedure btn_SalvarConfigClick(Sender: TObject);
    procedure btn_token_webhookClick(Sender: TObject);
    procedure bnt_WebhooksClick(Sender: TObject);
    procedure btn_webhook_novoClick(Sender: TObject);
    procedure btn_webhook_deletarClick(Sender: TObject);
    procedure btn_webhook_listarClick(Sender: TObject);
    procedure btn_boletosClick(Sender: TObject);

    procedure OnToken(Sender : TObject; Const Token: TToken = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure OnGerarBoleto(Sender : TObject; Const Boleto: TBoletoResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure OnConsultarBoleto(Sender : TObject; Const BoletoDetalhes: TBoletoDetalhesResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure OnConsultarBoletos(Sender : TObject; Const BoletosList: TBoletosListResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure OnDeletarBoleto(Sender : TObject; Const Erro: String    = '';  CodResp: integer  = -1);
    procedure OnAlterarNotificacaoBoleto(Sender : TObject; Const Erro: String    = '';  CodResp: integer  = -1);

    procedure OnNewWebhook(Sender : TObject; Const NewWebhook: TWebhookResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure OnConsultarWebhooks(Sender : TObject; Const Webhooks: TWebhooksListResp = nil; Erro: String    = '';  CodResp: integer  = -1);
    procedure OnDeletarWebhook(Sender : TObject; Const Erro: String    = '';  CodResp: integer  = -1);
    procedure btn_gerarGuid_novoBoletoClick(Sender: TObject);
    procedure btn_nb_AddServicoClick(Sender: TObject);
    procedure dbgServicosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fdmServicosAfterPost(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure btn_nb_SolicitarNovoBoletoClick(Sender: TObject);
    procedure btn_SolicitarAutorizacaoClick(Sender: TObject);
    procedure btn_GerarTokenTransacaoClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btn_AtualizarTokenTransacaoClick(Sender: TObject);
    procedure RscCoraBoleto1GerarCarne(Sender: TObject; const Carne: TCarneResp;
      Erro: string; CodResp: Integer);

  protected
    procedure ConfigCoraBoleto(vRscCoraBoleto: TRscCoraBoleto);
    function BuscarCodeCallBack: Boolean;
    function RemoveCodeCallBack: Boolean;
  private
    function IniConfigReadString(const Section,
  Ident, Default: string): string;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

const
  URL_BASE                  = 'https://multisofterp.com.br';
  URL_CALLBACK              = URL_BASE  + '/callback/calback?autcli={autcli}';
  URL_RECUPERAR_CALLBACK    = URL_BASE  + '/callback/enviacode?autcli={autcli}';
  URL_REMOVER_CODE_CALLBACK = URL_BASE  + '/callback/deletecode?autcli={autcli}&session_state={session_state}';

implementation

{$R *.dfm}

procedure TFrmPrincipal.ConfigCoraBoleto(vRscCoraBoleto: TRscCoraBoleto);
begin
  if vRscCoraBoleto <> nil then
    begin
      vRscCoraBoleto.Credenciais.client_id      :=  Trim(edt_usuario.Text);
      vRscCoraBoleto.Credenciais.client_secret  :=  Trim(edt_Password.Text);
      vRscCoraBoleto.DownalodPDF                :=  True;
      vRscCoraBoleto.PathDownloadPDF            :=  ExtractFilePath(ParamStr(0))  + 'Boletos/';
      CreateDir(vRscCoraBoleto.PathDownloadPDF);
    end;
end;

function TFrmPrincipal.BuscarCodeCallBack: Boolean;
var
  StrmBody      : TStringStream ;
  StrlHeader    : TStringList;
  vIdHTTP       : TIdHTTP;
  SSLHandler    : TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase      : string;
  JsonAry       : TJSONArray;
  JsonObj       : TJSONObject ;
  arqIni        : TIniFile;
begin
  Result      :=  False;
  StrlHeader  :=  TStringList.Create;
  StrmBody    :=  TStringStream.Create('', TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.ContentType         :=  'application/json';
      vIdHTTP.ConnectTimeout              :=  800;

      sUrlBase  :=  StringReplace(URL_RECUPERAR_CALLBACK, '{autcli}', Trim(edt_CodInternoCliente.Text), [rfReplaceAll]);

      try
        mm_Resp_token.Lines.Add('Buscando resposta do CallBack');
        vIdHTTP.Get(sUrlBase, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              JsonAry        := TJSONObject.ParseJsonValue(UTF8ToWideString(RawByteString(StrmBody.DataString))) as TJSONArray;
              try
                if JsonAry.Count > 0 then
                  begin
                    JsonObj  :=  JsonAry.Items[0] as TJSONObject;

                    arqIni  := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
                    try
                      try
                        arqIni.WriteString('AUTENTICACAO', 'Id', JsonObj.GetValue<string>('Id'));
                        arqIni.WriteString('AUTENTICACAO', 'Code', LowerCase(JsonObj.GetValue<string>('code')));
                        arqIni.WriteString('AUTENTICACAO', 'Session_State', JsonObj.GetValue<string>('session_state'));
                        arqIni.WriteString('AUTENTICACAO', 'AuthCli', JsonObj.GetValue<string>('autcli'));

                        mm_Resp_token.Lines.Add('--------------------------------------');
                        mm_Resp_token.Lines.Add('Objeteve Resposta do CallBack');
                        mm_Resp_token.Lines.Add('');
                        mm_Resp_token.Lines.Add('Id: '  + JsonObj.GetValue<string>('Id'));
                        mm_Resp_token.Lines.Add('Code: '  + JsonObj.GetValue<string>('code'));
                        mm_Resp_token.Lines.Add('Session_State: '  + JsonObj.GetValue<string>('session_state'));
                        mm_Resp_token.Lines.Add('AuthCli: '  + JsonObj.GetValue<string>('autcli'));
                        mm_Resp_token.Lines.Add('--------------------------------------');

                        Result  :=  True;
                        RemoveCodeCallBack;
                      except on E: Exception do
                        begin
                          mm_Resp_token.Lines.Add('Erro ao tentar gravar dados: '  + sLineBreak  + e.Message);
                        end;
                      end;
                    finally
                      arqIni.Free;
                    end;
                  end;
              finally
                JsonAry.DisposeOf;
              end;
            end;
        else
          mm_Resp_token.Lines.Add(UTF8ToWideString(UTF8Encode(StrlHeader.Text)));
        end;
      Except on E: Exception do
        mm_Resp_token.Lines.Add('Erro Inesperado: '  + e.Message);
      end;
    except on E: Exception do
      begin
        mm_Resp_token.Lines.Add('Erro Inesperado: '  + e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    StrlHeader.Free;
  end;
end;

function TFrmPrincipal.RemoveCodeCallBack: Boolean;
var
  StrmBody      : TStringStream ;
  StrlHeader    : TStringList;
  vIdHTTP       : TIdHTTP;
  SSLHandler    : TIdSSLIOHandlerSocketOpenSSL;
  sUrlBase      : string;
begin
  Result      :=  False;
  StrlHeader  :=  TStringList.Create;
  StrmBody    :=  TStringStream.Create('', TEncoding.UTF8);
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
      SSLHandler.SSLOptions.CertFile          :=  '';
      SSLHandler.SSLOptions.KeyFile           :=  '';
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         :=  '';
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.ContentType         :=  'application/json';
      vIdHTTP.ConnectTimeout              :=  800;

      sUrlBase  :=  StringReplace(URL_REMOVER_CODE_CALLBACK, '{autcli}', Trim(edt_CodInternoCliente.Text), [rfReplaceAll]);
      sUrlBase  :=  StringReplace(sUrlBase, '{session_state}', Trim(IniConfigReadString('AUTENTICACAO', 'Session_State', '')), [rfReplaceAll]);

      try
        mm_Resp_token.Lines.Add('Removendo code do CallBack');
        vIdHTTP.Get(sUrlBase, StrmBody);
        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              mm_Resp_token.Lines.Add(UTF8ToWideString(RawByteString(StrmBody.DataString)));
            end;
        else
          mm_Resp_token.Lines.Add(UTF8ToWideString(RawByteString(StrmBody.DataString)));
        end;
      Except on E: Exception do
        mm_Resp_token.Lines.Add('Erro Inesperado: '+sLineBreak+ e.Message);
      end;
    except on E: Exception do
      begin
        mm_Resp_token.Lines.Add('Erro Inesperado: '+sLineBreak+ e.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    StrlHeader.Free;
  end;
end;

procedure TFrmPrincipal.RscCoraBoleto1GerarCarne(Sender: TObject;
  const Carne: TCarneResp; Erro: string; CodResp: Integer);
begin
  if Erro = EmptyStr then
    begin
      ShowMessage('Carne criado:'  + sLineBreak  + Carne.ToString);
    end
  else
    begin
      MessageDlg(Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
    end;
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
var
  invoice_id  : string;
begin
  invoice_id  :=  InputBox('Consultar Boleto', 'Informe o id do boleto', 'inv_901vUFSTyQxCJeDM2JpiqlQ');

  ConfigCoraBoleto(RscCoraBoleto1);
  RscCoraBoleto1.Token.access_token :=  IniConfigReadString('TOKEN_TRANSACAO', 'Access_Token', '');
  RscCoraBoleto1.ConsultarBoleto(invoice_id);
end;

procedure TFrmPrincipal.SpeedButton3Click(Sender: TObject);
var
  invoice_id  : string;
begin
  invoice_id  :=  InputBox('Consultar Boleto', 'Informe o id do boleto', 'inv_901vUFSTyQxCJeDM2JpiqlQ');

  ConfigCoraBoleto(RscCoraBoleto1);
  RscCoraBoleto1.Token.access_token :=  IniConfigReadString('TOKEN_TRANSACAO', 'Access_Token', '');
  RscCoraBoleto1.DeletarBoleto(invoice_id);
end;

procedure TFrmPrincipal.SpeedButton4Click(Sender: TObject);
var
  invoice_id  : string;
  Notifica : TNotification;
begin
  invoice_id  :=  InputBox('Consultar Boleto', 'Informe o id do boleto', 'inv_901vUFSTyQxCJeDM2JpiqlQ');

  Notifica := TNotification.Create;
  try
    Notifica.Channels           :=  ['EMAIL'];
    Notifica.Destination.Email  :=  'fulano@ciclano.com.br';
    Notifica.Destination.Name   :=  'Fulano Ciclano Oliveira';
    Notifica.Rules              :=  ['NOTIFY_ON_DUE_DATE', 'NOTIFY_WHEN_PAID'];

    ConfigCoraBoleto(RscCoraBoleto1);
    RscCoraBoleto1.Token.access_token :=  IniConfigReadString('TOKEN_TRANSACAO', 'Access_Token', '');
    RscCoraBoleto1.AlterarNotificacaoBoleto(invoice_id, Notifica);
  finally
    Notifica.Free;
  end;
end;

procedure TFrmPrincipal.SpeedButton5Click(Sender: TObject);
var
  Status  : string;
begin
  fdm_ListaBoletos.EmptyDataSet;
  Status  :=  InputBox('Consultar Boleto', 'Informe o Status: [DRAFT, RECURRENCE_DRAFT, OPEN, IN_PAYMENT, PAID, LATE, CANCELLED, INITIATED]', '');

  ConfigCoraBoleto(RscCoraBoleto1);
  RscCoraBoleto1.Token.access_token :=  IniConfigReadString('TOKEN_TRANSACAO', 'Access_Token', '');
  RscCoraBoleto1.ConsultarBoletos('2022-03-01', '2024-04-13', Status);
end;

procedure TFrmPrincipal.dbgServicosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.FieldName = 'remover' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Draw(Rect.Left + 10, Rect.Top, imgDelete.Picture.Graphic);
    end;
end;

procedure TFrmPrincipal.fdmServicosAfterPost(DataSet: TDataSet);
begin
  lbl_VlrServicosBoleto.Caption :=  FormatFloat('#0.00', StrToFloat(fdmServicos.FieldByName('total').AsString));
end;

procedure TFrmPrincipal.bnt_WebhooksClick(Sender: TObject);
begin
  pgc.ActivePage  :=  tbs_webhooks;
end;

procedure TFrmPrincipal.btn_AtualizarTokenTransacaoClick(Sender: TObject);
var
  refresh_token   : string;
begin
  refresh_token :=  IniConfigReadString('TOKEN_TRANSACAO', 'refresh_token', '');

  if refresh_token = EmptyStr then
    begin
      MessageDlg('refresh_token não encontrado: ', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0 );
      Exit;
    end;

  ConfigCoraBoleto(RscCoraBoleto1);
  RscCoraBoleto1.NewToken(refresh_token);
end;

procedure TFrmPrincipal.btn_boletosClick(Sender: TObject);
begin
  pgc.ActivePage  :=  tbs_Boletos;
end;

procedure TFrmPrincipal.btn_ConfigurarClick(Sender: TObject);
begin
  pgc.ActivePage  :=  tbs_Credenciais;
end;

procedure TFrmPrincipal.btn_TokenClick(Sender: TObject);
begin
  pgc.ActivePage  :=  tbs_token;
end;

procedure TFrmPrincipal.btn_SalvarConfigClick(Sender: TObject);
var
  arqIni  : TIniFile;
begin
  arqIni  := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
  try
    try
      arqIni.WriteString('CREDENCIAIS', 'UserName', edt_usuario.Text);
      arqIni.WriteString('CREDENCIAIS', 'Password', edt_Password.Text);

      arqIni.WriteString('INFORMACAO-CLIENTE', 'CodIdentificacao', edt_CodInternoCliente.Text);

      MessageDlg('Dados Gravados Com Sucesso', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK],0 );
    except on E: Exception do
      begin
        MessageDlg('Erro ao tentar gravar dados: '  + sLineBreak  + e.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
      end;
    end;  
  finally
    arqIni.Free;
  end;
end;

procedure TFrmPrincipal.btn_SolicitarAutorizacaoClick(Sender: TObject);
var
  sUrl    : string;
begin
  ConfigCoraBoleto(RscCoraBoleto1);
  sUrl  :=  StringReplace(URL_CALLBACK, '{autcli}', Trim(edt_CodInternoCliente.Text), [rfReplaceAll]);

  RscCoraBoleto1.SolicitarAutorizacao(sUrl, 'invoice');

  {$REGION 'Monitorar_solicitacao'}
  TTask.Run(
  procedure
  var
    CountReq  : integer;
  begin
    CountReq  :=  1;
    while not BuscarCodeCallBack do
      begin
        Sleep(1000);
        Inc(CountReq);
        if CountReq > 120 then
          begin
            mm_Resp_token.Lines.Add('Não obteve resposta do CallBack ----------------');
            Exit;
          end;
      end;
  end);
  {$ENDREGION}
end;

procedure TFrmPrincipal.btn_GerarTokenTransacaoClick(Sender: TObject);
var
  sUrl    : string;
  sCode   : string;
begin
  sCode :=  IniConfigReadString('AUTENTICACAO', 'Code', '');

  if sCode = EmptyStr then
    begin
      MessageDlg('Code não encontrado: ', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0 );
      Exit;
    end;

  sUrl  :=  StringReplace(URL_CALLBACK, '{autcli}', Trim(edt_CodInternoCliente.Text), [rfReplaceAll]);

  ConfigCoraBoleto(RscCoraBoleto1);
  RscCoraBoleto1.NewToken(sCode, sUrl);
end;

procedure TFrmPrincipal.btn_token_webhookClick(Sender: TObject);
begin
  ConfigCoraBoleto(RscCoraBoleto1);
  RscCoraBoleto1.NewToken;
end;

procedure TFrmPrincipal.btn_webhook_deletarClick(Sender: TObject);
var
  webId : string;
begin

  webId :=  InputBox('Deletar WebHook;', 'Informe o Id do Webhook', '');
  if webId <> EmptyStr then
    begin
      ConfigCoraBoleto(RscCoraBoleto1);
      RscCoraBoleto1.Token.access_token :=  IniConfigReadString('TOKEN_WEBHOOK', 'Access_Token', '');
      RscCoraBoleto1.DeletarWebhook(webId);
    end;
end;

procedure TFrmPrincipal.btn_webhook_listarClick(Sender: TObject);
begin
    ConfigCoraBoleto(RscCoraBoleto1);
    RscCoraBoleto1.Token.access_token :=  IniConfigReadString('TOKEN_WEBHOOK', 'Access_Token', '');
    RscCoraBoleto1.ConsultarWebhooks;
end;

procedure TFrmPrincipal.btn_webhook_novoClick(Sender: TObject);
var
  webhook       : TWebhookReq;
  webId : string;
  webIdGuid : TGUID;
  sUrlCalback, sResource, sTriger: string;
begin
  sUrlCalback :=  '';
  sResource   :=  '';
  sTriger     :=  '';

  sUrlCalback :=  InputBox('Criar WebHook;', 'Informe a url de calback', 'https://multisofterp.com.br');
  if sUrlCalback = EmptyStr then
    Exit;

  sResource :=  InputBox('Criar WebHook;', 'Informe o Recurso', 'invoice');
  if sResource = EmptyStr then
    Exit;

  sTriger :=  InputBox('Criar WebHook;', 'Informe o status:'
    + sLineBreak
    + 'drafted - created - paid - canceled - overdue'
    + sLineBreak
    + '"*" o esterisco quer dizer que todos os status'
    + sLineBreak
    + ' vão passar por esse webhook'
    , 'paid');
  if sTriger = EmptyStr then
    Exit;

  CreateGUID(webIdGuid);
  webId :=  GUIDToString(webIdGuid);
  webId :=  StringReplace(webId, '{', '', [rfReplaceAll]);
  webId :=  StringReplace(webId, '}', '', [rfReplaceAll]);

  webId :=  InputBox('Criar WebHook;', 'Informe o Id do Webhook', webId);
  if webId <> EmptyStr then
    begin
      webhook       := TWebhookReq.Create;
      try
        ConfigCoraBoleto(RscCoraBoleto1);

        webhook.Resource  :=  sResource;
        webhook.Trigger   :=  sTriger;
        webhook.Url       :=  sUrlCalback;
        RscCoraBoleto1.Token.access_token :=  IniConfigReadString('TOKEN_WEBHOOK', 'Access_Token', '');
        RscCoraBoleto1.CriarWebhook(webhook, webId);
      finally
        webhook.Free;
      end;
    end;
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  pgc_Boletos.ActivePage          :=  tbs_Boleto_Novo;
  pgc_NovoBoleto.ActivePage       :=  tbs_nb_identificacao;
end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
begin
  pgc_Boletos.ActivePage          :=  tbs_BoletoConsultar;
end;

procedure TFrmPrincipal.Button4Click(Sender: TObject);
begin
  pgc_Boletos.ActivePage          :=  tbs_BoletoCancelar;
end;

procedure TFrmPrincipal.Button5Click(Sender: TObject);
begin
  pgc_Boletos.ActivePage          :=  tbs_BoletoListarTodos;
end;

procedure TFrmPrincipal.Button6Click(Sender: TObject);
begin
  pgc_Boletos.ActivePage          :=  tbs_BoletoEditarNotificacao;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  C: Integer;
  arqIni  : TIniFile;
  I: Integer;
begin

  Application.Title :=  'Client API de Boletos CORA by Roniery Santos Cardoso - RSC SISTEMAS';
  Self.Caption  :=  Application.Title;

  for C := 0 to Self.ComponentCount - 1 do
    begin
      if Components[C] is TPanel then
        begin
          TPanel(Components[C]).BevelOuter        :=  bvNone;
          TPanel(Components[C]).Color             :=  clHighlight;
          TPanel(Components[C]).ParentBackground  :=  False;
          TPanel(Components[C]).ParentColor       :=  False;
          TPanel(Components[C]).Caption           :=  EmptyStr;

          case TPanel(Components[C]).Tag of
            1:
              begin  
                TPanel(Components[C]).Color :=  clHotLight;
              end;
            2:
              begin  
                TPanel(Components[C]).Color :=  clActiveCaption;
              end;              
          else
            begin
              TPanel(Components[C]).Color   :=  clWhite;
            end;
          end;
          
        end;

//      if Components[C] is TEdit then
//        begin
//          TEdit(Components[C]).Text              :=  EmptyStr
//        end;
    end;

  for C := 0 to pgc.PageCount - 1 do
    begin
      pgc.Pages[C].TabVisible  :=  False;       
    end;

  for C := 0 to pgc_Boletos.PageCount - 1 do
    begin
      pgc_Boletos.Pages[C].TabVisible  :=  False;
    end;

  mm_Resp_token.Lines.Clear;

  arqIni  := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
  try
    try
      edt_usuario.Text            :=  arqIni.ReadString('CREDENCIAIS', 'UserName', '');
      edt_Password.Text           :=  arqIni.ReadString('CREDENCIAIS', 'Password', '');

      edt_CodInternoCliente.Text  :=  arqIni.ReadString('INFORMACAO-CLIENTE', 'CodIdentificacao', '');
    except on E: Exception do
      begin
        MessageDlg('Erro ao tentar gravar dados: '  + sLineBreak  + e.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
      end;
    end;
  finally
    arqIni.Free;
  end;

  fdmServicos.Open;
  fdm_ListaBoletos.Open;

  for I := 0 to chkb_nb_Notifica_Regras.Items.Count - 1 do
    begin
      chkb_nb_Notifica_Regras.Checked[I] :=  True;
    end;

  for I := 0 to chkb_nb_FormasPgto.Items.Count - 1 do
    begin
      chkb_nb_FormasPgto.Checked[I] :=  True;
    end;

  dtp_nb_TPgto_DataVencimento.Date  :=  Now + 5;

end;

function TFrmPrincipal.IniConfigReadString(const Section,
  Ident, Default: string): string;
var
  arqIni  : TIniFile;
begin
  arqIni  := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
  try
    try
      Result  :=  arqIni.ReadString(Section, Ident, Default);
    except on E: Exception do
      begin
        MessageDlg('Erro ler informação: '  + sLineBreak  + e.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
      end;
    end;
  finally
    arqIni.Free;
  end;
end;

procedure TFrmPrincipal.btn_gerarGuid_novoBoletoClick(Sender: TObject);
var
  IdBoleto: TGUID;
begin
  CreateGUID(IdBoleto);
  edt_nb_code.Text :=  GUIDToString(IdBoleto);
  edt_nb_code.Text :=  StringReplace(edt_nb_code.Text, '{', '', [rfReplaceAll]);
  edt_nb_code.Text :=  StringReplace(edt_nb_code.Text, '}', '', [rfReplaceAll]);
end;

//-------------------------------------

procedure TFrmPrincipal.OnAlterarNotificacaoBoleto(Sender: TObject;
  const Erro: String; CodResp: integer);
begin
  if Erro = EmptyStr then
    begin
      ShowMessage('Código Resposta: ' + CodResp.ToString + sLineBreak + 'Success: Notificação Alterada.');
    end
  else
    begin
      MessageDlg(Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
    end;
end;

procedure TFrmPrincipal.OnConsultarBoleto(Sender: TObject;
  const BoletoDetalhes: TBoletoDetalhesResp; Erro: String; CodResp: integer);
begin
  if Erro = EmptyStr then
    begin
      ShowMessage(BoletoDetalhes.ToString);
    end
  else
    begin
      MessageDlg(Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
    end;
end;

procedure TFrmPrincipal.OnConsultarBoletos(Sender: TObject;
  const BoletosList: TBoletosListResp; Erro: String; CodResp: integer);
var
  MyElem: TBoletoResp;
begin
  if Erro = EmptyStr then
    begin
      for MyElem in BoletosList.items do
      begin
        fdm_ListaBoletos.Append;
        fdm_ListaBoletos.FieldByName('Code').AsString         :=  MyElem.Code;
        fdm_ListaBoletos.FieldByName('Id').AsString           :=  MyElem.Id;
        fdm_ListaBoletos.FieldByName('Status').AsString       :=  MyElem.Status;
        fdm_ListaBoletos.FieldByName('total_amount').AsFloat  :=  MyElem.total_amount;
        fdm_ListaBoletos.FieldByName('total_paid').AsFloat    :=  MyElem.total_paid;
        fdm_ListaBoletos.FieldByName('customer_Name').AsString         :=  MyElem.Customer.Name;
        fdm_ListaBoletos.FieldByName('customer_Email').AsString        :=  MyElem.Customer.Email;
        fdm_ListaBoletos.FieldByName('services_Amount').AsFloat        :=  MyElem.Services[0].Amount;
        fdm_ListaBoletos.FieldByName('services_Description').AsString  :=  MyElem.Services[0].Description;
        fdm_ListaBoletos.Post;
      end;
    end
  else
    begin
      MessageDlg(Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
    end;
end;

procedure TFrmPrincipal.OnConsultarWebhooks(Sender: TObject;
  const Webhooks: TWebhooksListResp; Erro: String; CodResp: integer);
var
  I: Integer;
begin
  if Erro = EmptyStr then
    begin
      mm_webhook.Lines.Add('Código Resposta: ' + CodResp.ToString);
      mm_webhook.Lines.Add(EmptyStr);

      for i := Low(Webhooks.Items) to High(Webhooks.Items) do
        begin
          mm_webhook.Lines.Add('Active: ' + BoolToStr(Webhooks.Items[I].Active, True));
          mm_webhook.Lines.Add('ConnectionTimeout: ' + Webhooks.Items[I].ConnectionTimeout.ToString);
          mm_webhook.Lines.Add('Expandable: ' + BoolToStr(Webhooks.Items[I].Expandable, True));
          mm_webhook.Lines.Add('Id: ' + Webhooks.Items[I].Id);
          mm_webhook.Lines.Add('IncludeResource: ' + BoolToStr(Webhooks.Items[I].IncludeResource, True));
          mm_webhook.Lines.Add('ReadTimeout: ' + Webhooks.Items[I].ReadTimeout.ToString);
          mm_webhook.Lines.Add('Resource: ' + Webhooks.Items[I].Resource);
          mm_webhook.Lines.Add('Trigger: ' + Webhooks.Items[I].Trigger);
          mm_webhook.Lines.Add('=========================================');
        end;
    end
  else
    begin
      MessageDlg(Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
    end;
end;

procedure TFrmPrincipal.OnDeletarBoleto(Sender: TObject; const Erro: String;
  CodResp: integer);
begin
  if Erro = EmptyStr then
    begin
      ShowMessage('Código Resposta: ' + CodResp.ToString + sLineBreak + 'Success: Boleto removido.');
    end
  else
    begin
      MessageDlg(Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
    end;
end;

procedure TFrmPrincipal.OnDeletarWebhook(Sender: TObject; const Erro: String;
  CodResp: integer);
begin
  if Erro = EmptyStr then
    begin
      mm_webhook.Lines.Add('WebHook deletado com sucesso.');
    end
  else
    begin
      MessageDlg(Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
    end;
end;

procedure TFrmPrincipal.OnGerarBoleto(Sender: TObject;
  const Boleto: TBoletoResp; Erro: String; CodResp: integer);
begin
  if Erro = EmptyStr then
    begin
      ShowMessage('Boleto criado:'  + sLineBreak  + Boleto.ToString);
    end
  else
    begin
      MessageDlg(Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
    end;
end;

procedure TFrmPrincipal.OnNewWebhook(Sender: TObject;
  const NewWebhook: TWebhookResp; Erro: String; CodResp: integer);
begin
  if Erro = EmptyStr then
    begin
      mm_webhook.Lines.Add('Código Resposta: ' + CodResp.ToString);
      mm_webhook.Lines.Add(EmptyStr);
      mm_webhook.Lines.Add('Active: ' + BoolToStr(NewWebhook.Active));
      mm_webhook.Lines.Add('ConnectionTimeout: ' + NewWebhook.ConnectionTimeout.ToString);
      mm_webhook.Lines.Add('Expandable: ' + BoolToStr(NewWebhook.Expandable));
      mm_webhook.Lines.Add('Id: ' + NewWebhook.Id);
      mm_webhook.Lines.Add('IncludeResource: ' + BoolToStr(NewWebhook.IncludeResource));
      mm_webhook.Lines.Add('ReadTimeout: ' + NewWebhook.ReadTimeout.ToString);
      mm_webhook.Lines.Add('Resource: ' + NewWebhook.Resource);
      mm_webhook.Lines.Add('Trigger: ' + NewWebhook.Trigger);
      mm_webhook.Lines.Add('Url: ' + NewWebhook.Url);
    end
  else
    begin
      MessageDlg(Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
    end;
end;

procedure TFrmPrincipal.OnToken(Sender: TObject; const Token: TToken;
  Erro: string; CodResp: integer);
var
  arqIni  : TIniFile;
begin
  if Erro = EmptyStr then
    begin
      mm_Resp_token.Lines.Add('Código Resposta: ' + CodResp.ToString);
      mm_Resp_token.Lines.Add(EmptyStr);
      mm_Resp_token.Text  :=  mm_Resp_token.Text  + sLineBreak  + Token.ToString;

      arqIni  := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
      try
        try
          if Token.refresh_token <> EmptyStr then
            begin
              arqIni.WriteString('TOKEN_TRANSACAO', 'Access_Token', Token.access_token);
              arqIni.WriteString('TOKEN_TRANSACAO', 'Expires_In', Token.expires_in.ToString);
              arqIni.WriteString('TOKEN_TRANSACAO', 'NotBeforePolicy', Token.NotBeforePolicy.ToString);
              arqIni.WriteString('TOKEN_TRANSACAO', 'Refresh_Expires_In', Token.refresh_expires_in.ToString);
              arqIni.WriteString('TOKEN_TRANSACAO', 'refresh_token', Token.refresh_token);
              arqIni.WriteString('TOKEN_TRANSACAO', 'Scope', Token.Scope);
              arqIni.WriteString('TOKEN_TRANSACAO', 'Session_State', Token.session_state);
              arqIni.WriteString('TOKEN_TRANSACAO', 'Token_Type', Token.token_type);
            end
          else
            begin
              arqIni.WriteString('TOKEN_WEBHOOK', 'Access_Token', Token.access_token);
              arqIni.WriteString('TOKEN_WEBHOOK', 'Expires_In', Token.expires_in.ToString);
              arqIni.WriteString('TOKEN_WEBHOOK', 'NotBeforePolicy', Token.NotBeforePolicy.ToString);
              arqIni.WriteString('TOKEN_WEBHOOK', 'Refresh_Expires_In', Token.refresh_expires_in.ToString);
              arqIni.WriteString('TOKEN_WEBHOOK', 'Scope', Token.Scope);
              arqIni.WriteString('TOKEN_WEBHOOK', 'Token_Type', Token.token_type);
            end;
        except on E: Exception do
          begin
            MessageDlg('Erro ao tentar gravar dados: '  + sLineBreak  + e.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
          end;
        end;
      finally
        arqIni.Free;
      end;
    end
  else
    begin
      MessageDlg(Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK],0 );
    end;
end;

procedure TFrmPrincipal.btn_nb_AddServicoClick(Sender: TObject);
begin
  btn_nb_AddServico.Enabled  :=  False;
  if Trim(edt_nb_Servico_nome.Text) = EmptyStr then
    begin
      MessageDlg('Informe o nome do serviço.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
      btn_nb_AddServico.Enabled  :=  True;
      Exit;
    end;
  if Trim(edt_nb_Servico_Valor.Text) = EmptyStr then
    begin
      MessageDlg('Informe o R$ valor do serviço.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
      btn_nb_AddServico.Enabled  :=  True;
      Exit;
    end;
  if Trim(edt_nb_Servico_ServicoDescricao.Text) = EmptyStr then
    begin
      MessageDlg('Informe a descrição do serviço.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
      btn_nb_AddServico.Enabled  :=  True;
      Exit;
    end;

  try
    try
      fdmServicos.Append;
      fdmServicos.FieldByName('nome').AsString      :=  edt_nb_Servico_nome.Text;
      fdmServicos.FieldByName('descricao').AsString :=  edt_nb_Servico_ServicoDescricao.Text;
      fdmServicos.FieldByName('valor').AsString     :=  FormatFloat('#0.00', StrToFloatDef(edt_nb_Servico_Valor.Text, 0));
      fdmServicos.Post;

      edt_nb_Servico_nome.Text              :=  EmptyStr;
      edt_nb_Servico_ServicoDescricao.Text  :=  EmptyStr;
      edt_nb_Servico_Valor.Text             :=  EmptyStr;
    except on E: Exception do
      begin
        MessageDlg(e.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      end;
    end;
  finally
    btn_nb_AddServico.Enabled  :=  True;
  end;
end;

procedure TFrmPrincipal.btn_nb_SolicitarNovoBoletoClick(Sender: TObject);
var
  BoletoReq     : TBoletoReq;
  Servicos      : TServices;
  ServicesArray : TArray<TServices>;
  RulesArray    : TArray<string>;
  I             : Integer;
  Carne         : TCarneReq;

begin

  if chk_carne.Checked then
    begin
      Carne  := TCarneReq.Create;
      try
        Carne.Code                            :=  edt_nb_code.Text;
        Carne.Customer.Address.City           :=  edt_nb_Cliente_end_Cidade.Text;
        Carne.Customer.Address.Complement     :=  edt_nb_Cliente_end_Complemento.Text;
        Carne.Customer.Address.District       :=  edt_nb_Cliente_end_Bairro.Text;
        Carne.Customer.Address.Number         :=  edt_nb_Cliente_end_numero.Text;
        Carne.Customer.Address.State          :=  edt_nb_Cliente_end_UF.Text;
        Carne.Customer.Address.Street         :=  edt_nb_Cliente_end_rua.Text;
        Carne.Customer.Address.zip_code       :=  edt_nb_Cliente_end_CEP.Text;
        Carne.Customer.Document.Identity      :=  edt_nb_Cliente_Documento.Text;
        Carne.Customer.Document.&Type         :=  uppercase(cbb_nb_Cliente_Tipo_Documento.Items[cbb_nb_Cliente_Tipo_Documento.ItemIndex]);
        Carne.Customer.Email                  :=  edt_nb_Cliente_Email.Text;
        Carne.Customer.Name                   :=  edt_nb_Cliente_Nome.Text;

        Carne.Notifications.Channels          :=  [uppercase(cbbx_nb_Notifica_Email.Items[cbbx_nb_Notifica_Email.ItemIndex])];
        Carne.Notifications.Destination.Email :=  Edt_nb_Notifica_nomeEmail.Text;
        Carne.Notifications.Destination.Name  :=  Edt_nb_Notifica_EmailEnd.Text;

        SetLength(RulesArray, chkb_nb_Notifica_Regras.Count);
        for I := 0 to chkb_nb_Notifica_Regras.Count - 1 do
          begin
            if chkb_nb_Notifica_Regras.Checked[I] then
              begin
                RulesArray[I]  :=  chkb_nb_Notifica_Regras.Items[I];
              end;
          end;

        var Fpgto: TArray<string>;
        var qtdechk: integer;

        qtdechk := 0;
        for I := 0 to chkb_nb_FormasPgto.Items.Count - 1 do
          begin
            if chkb_nb_FormasPgto.Checked[I] then
              inc(qtdechk);
          end;


        SetLength(Fpgto, qtdechk);

        if chkb_nb_FormasPgto.Checked[0] then
          begin
            Fpgto[0]  :=  'BANK_SLIP';
          end;

        if chkb_nb_FormasPgto.Checked[1] then
          begin
            Fpgto[1]  :=  'PIX';
          end;

        Carne.installment.number_of             :=  StrToInt(edt_NumParc.Text);
        Carne.installment.due_date.day_of_month :=  StrToInt(edt_dia_venc.Text);

        Carne.payment_forms :=  Fpgto;

        if fdmServicos.Active then
          begin
            fdmServicos.First;
            try
              Carne.Service.Amount       :=  fdmServicos.FieldByName('valor').AsFloat * 100;
              Carne.Service.Description  :=  fdmServicos.FieldByName('descricao').AsString;
              Carne.Service.Name         :=  fdmServicos.FieldByName('nome').AsString;
            except on E: Exception do
            end;
          end;

        Carne.Notifications.Rules :=  RulesArray;

        Carne.payment_terms.Discount.&Type    :=  uppercase(cbbx_nb_TPgto_DescontoTipo.Items[cbbx_nb_TPgto_DescontoTipo.ItemIndex]);
        Carne.payment_terms.Discount.Value    :=  StrToFloatDef(edt_nb_TPgto_DescontoValor.Text, 0);
        Carne.payment_terms.due_date          :=  dtp_nb_TPgto_DataVencimento.Date;
        Carne.payment_terms.Fine.Amount       :=  StrToFloatDef(edt_nb_TPgto_MultaValor.Text, 0) * 100;
        Carne.payment_terms.Interest.Rate     :=  StrToFloatDef(edt_nb_TPgto_MultaValor_InteresseAvaliar.Text, 0);

        ConfigCoraBoleto(RscCoraBoleto1);
        RscCoraBoleto1.Token.access_token :=  IniConfigReadString('TOKEN_TRANSACAO', 'Access_Token', '');
        RscCoraBoleto1.GerarCarne(Carne, edt_nb_code.Text);
      finally
        Carne.Free;
      end;
    end
  else
    begin
      BoletoReq  := TBoletoReq.Create;
      try
        BoletoReq.Code                            :=  edt_nb_code.Text;
        BoletoReq.Customer.Address.City           :=  edt_nb_Cliente_end_Cidade.Text;
        BoletoReq.Customer.Address.Complement     :=  edt_nb_Cliente_end_Complemento.Text;
        BoletoReq.Customer.Address.District       :=  edt_nb_Cliente_end_Bairro.Text;
        BoletoReq.Customer.Address.Number         :=  edt_nb_Cliente_end_numero.Text;
        BoletoReq.Customer.Address.State          :=  edt_nb_Cliente_end_UF.Text;
        BoletoReq.Customer.Address.Street         :=  edt_nb_Cliente_end_rua.Text;
        BoletoReq.Customer.Address.zip_code       :=  edt_nb_Cliente_end_CEP.Text;
        BoletoReq.Customer.Document.Identity      :=  edt_nb_Cliente_Documento.Text;
        BoletoReq.Customer.Document.&Type         :=  uppercase(cbb_nb_Cliente_Tipo_Documento.Items[cbb_nb_Cliente_Tipo_Documento.ItemIndex]);
        BoletoReq.Customer.Email                  :=  edt_nb_Cliente_Email.Text;
        BoletoReq.Customer.Name                   :=  edt_nb_Cliente_Nome.Text;

        BoletoReq.Notifications.Channels          :=  [uppercase(cbbx_nb_Notifica_Email.Items[cbbx_nb_Notifica_Email.ItemIndex])];
        BoletoReq.Notifications.Destination.Email :=  Edt_nb_Notifica_nomeEmail.Text;
        BoletoReq.Notifications.Destination.Name  :=  Edt_nb_Notifica_EmailEnd.Text;

        SetLength(RulesArray, chkb_nb_Notifica_Regras.Count);
        for I := 0 to chkb_nb_Notifica_Regras.Count - 1 do
          begin
            if chkb_nb_Notifica_Regras.Checked[I] then
              begin
                RulesArray[I]  :=  chkb_nb_Notifica_Regras.Items[I];
              end;
          end;

        var Fpgto: TArray<string>;
        var qtdechk: integer;

        qtdechk := 0;
        for I := 0 to chkb_nb_FormasPgto.Items.Count - 1 do
          begin
            if chkb_nb_FormasPgto.Checked[I] then
              inc(qtdechk);
          end;


        SetLength(Fpgto, qtdechk);

        if chkb_nb_FormasPgto.Checked[0] then
          begin
            Fpgto[0]  :=  'BANK_SLIP';
          end;

        if chkb_nb_FormasPgto.Checked[1] then
          begin
            Fpgto[1]  :=  'PIX';
          end;

        BoletoReq.payment_forms :=  Fpgto;

        if fdmServicos.Active then
          begin
            SetLength(ServicesArray, fdmServicos.RecordCount);
            fdmServicos.First;
            try
              while not fdmServicos.Eof do
                begin
                  Servicos              :=  Rsc.Api.Cora.Boleto.Classes.ServicesReq.TServices.Create;
                  Servicos.Amount       :=  fdmServicos.FieldByName('valor').AsFloat * 100;
                  Servicos.Description  :=  fdmServicos.FieldByName('descricao').AsString;
                  Servicos.Name         :=  fdmServicos.FieldByName('nome').AsString;

                  ServicesArray[fdmServicos.RecNo - 1] :=  Servicos;
                  fdmServicos.Next;
                end;
            except on E: Exception do
            end;
          end;

        BoletoReq.Notifications.Rules :=  RulesArray;

        BoletoReq.payment_terms.Discount.&Type    :=  uppercase(cbbx_nb_TPgto_DescontoTipo.Items[cbbx_nb_TPgto_DescontoTipo.ItemIndex]);
        BoletoReq.payment_terms.Discount.Value    :=  StrToFloatDef(edt_nb_TPgto_DescontoValor.Text, 0);
        BoletoReq.payment_terms.due_date          :=  dtp_nb_TPgto_DataVencimento.Date;
        BoletoReq.payment_terms.Fine.Amount       :=  StrToFloatDef(edt_nb_TPgto_MultaValor.Text, 0) * 100;
        BoletoReq.payment_terms.Interest.Rate     :=  StrToFloatDef(edt_nb_TPgto_MultaValor_InteresseAvaliar.Text, 0);

        BoletoReq.services  :=  ServicesArray;

        ConfigCoraBoleto(RscCoraBoleto1);
        RscCoraBoleto1.Token.access_token :=  IniConfigReadString('TOKEN_TRANSACAO', 'Access_Token', '');
        RscCoraBoleto1.GerarBoleto(BoletoReq, edt_nb_code.Text);
      finally
        BoletoReq.Free;
      end;
    end;
end;

end.
