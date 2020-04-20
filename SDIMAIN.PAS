unit SDIMAIN;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.Menus, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ImgList, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin, System.ImageList,
  System.Actions, System.SysUtils;

type
  TSDIAppForm = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ActionList1: TActionList;
    FileNew1: TAction;
    FileOpen1: TAction;
    FileSave1: TAction;
    FileSaveAs1: TAction;
    FileExit1: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    HelpAbout1: TAction;
    StatusBar: TStatusBar;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    Himpunan: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    Button3: TButton;
    GroupBox3: TGroupBox;
    ListBox3: TListBox;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo2: TMemo;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Panel1: TPanel;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Button2: TButton;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure FileSave1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SDIAppForm: TSDIAppForm;

implementation

uses About;

{$R *.dfm}

procedure TSDIAppForm.FileNew1Execute(Sender: TObject);
begin
  { Do nothing }
end;

procedure TSDIAppForm.FileOpen1Execute(Sender: TObject);
begin
  OpenDialog.Execute;
end;

procedure TSDIAppForm.FileSave1Execute(Sender: TObject);
begin
  SaveDialog.Execute;
end;

procedure TSDIAppForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TSDIAppForm.RadioButton1Click(Sender: TObject);
begin
    Edit3.Enabled := true;
end;

procedure TSDIAppForm.RadioButton2Click(Sender: TObject);
begin
    Edit3.Enabled := true;
end;

procedure TSDIAppForm.RadioButton3Click(Sender: TObject);
begin
    Edit3.Enabled := true;
end;

procedure TSDIAppForm.RadioButton4Click(Sender: TObject);
begin
  Edit3.Enabled := false;
end;

procedure TSDIAppForm.RadioButton5Click(Sender: TObject);
begin
    Edit3.Enabled := true;
end;

procedure TSDIAppForm.Edit2Change(Sender: TObject);
var
  lst: TStringList;
  i : integer;
begin
  Label1.Caption := 'Himpunan A = { '+Edit2.Text+' }';
  lst := TStringList.Create;

  try
    lst.LineBreak := ',';
    lst.Text := Edit2.Text;
    Memo1.Lines := lst;
  finally
    lst.Free;
  end;
end;

procedure TSDIAppForm.Edit3Change(Sender: TObject);
var
  lst: TStringList;
  i : integer;
begin
  Label2.Caption := 'Himpunan B = { '+Edit3.Text+' }';
  lst := TStringList.Create;

  try
    lst.LineBreak := ',';
    lst.Text := Edit3.Text;
    Memo2.Lines := lst;
  finally
    lst.Free;
  end;
end;

procedure TSDIAppForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TSDIAppForm.Button1Click(Sender: TObject);
begin
  if messagedlg('Anda Ingin Keluar Aplikasi ini ?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    application.Terminate;
  end;
end;

procedure TSDIAppForm.Button2Click(Sender: TObject);
begin
  RadioButton1.Checked := false;
  RadioButton2.Checked := false;
  RadioButton3.Checked := false;
  RadioButton4.Checked := false;
  RadioButton5.Checked := false;
  Edit2.Text := '';
  Edit3.Text := '';
  ListBox3.Clear;
end;

procedure TSDIAppForm.Button3Click(Sender: TObject);
var
  i,j,l : integer;
  stringdata : string;
  stringdata2 : string;
  data2: string;
  A,B:Array[0..100] of String;
  ada:Boolean;
  ada2:Boolean;

begin
  if RadioButton1.Checked = true then
  begin
      stringdata:='';
      for i := 0 to Memo1.Lines.Count-1 do
      begin
          if Memo2.Lines.IndexOf(Memo1.Lines[i])>=0 then
          stringdata:=stringdata+''+Memo1.Lines.Strings[i]+',';
      end;
      ListBox3.Items.Add('');
      ListBox3.Items.Add('Hasil Irisan kedua Himpunan :');
      if stringdata='' then
      begin
          ListBox3.Items.Add('Tidak ada Irisan');
      end
      else
      begin
          ListBox3.Items.Add('A n B = { '+stringdata+' }');
      end;
      ListBox3.Items.Add('-------------------------');
  end
  else if RadioButton2.Checked = true then
  begin
      stringdata:='';
      For i:=0 to Memo1.Lines.Count-1 do
          A[i]:=Memo1.Lines.Strings[i];
      For j:=0 to Memo2.Lines.Count-1 do
          B[j]:=Memo2.Lines.Strings[j];
      For i:=0 to Memo1.Lines.Count-1 do
          stringdata:=stringdata+''+A[i]+',';
      For j:=0 to Memo2.Lines.Count-1 do
      begin
          ada:=false;
          For i:=0 to Memo1.Lines.Count-1 do
          if A[i]=B[j] then ada:=true;
          if ada=false then stringdata:=stringdata+''+B[j]+',';
      end;
      ListBox3.Items.Add('Hasil Gabungan kedua Himpunan :');
      ListBox3.Items.Add('A u B = { '+stringdata+' }');
      ListBox3.Items.Add('-------------------------');
  end
  else if RadioButton3.Checked = true then
  begin
      stringdata:='';
      For i:=0 to Memo1.Lines.Count-1 do
          A[i]:=Memo1.Lines.Strings[i];
      For j:=0 to Memo2.Lines.Count-1 do
          B[j]:=Memo2.Lines.Strings[j];
      For i:=0 to Memo1.Lines.Count-1 do
      begin
          ada:=false;
          For j:=0 to Memo2.Lines.Count-1 do
          if A[i]=B[j] then ada:=true;
          if ada=false then stringdata:=stringdata+''+A[i]+',';
      end;
      ListBox3.Items.Add('Hasil Selisih kedua Himpunan :');
      ListBox3.Items.Add('A - B = { '+stringdata+' }');
      ListBox3.Items.Add('-------------------------');
  end
  else if RadioButton4.Checked = true then
  begin
      j:=1;
      for i:=0 to Memo1.Lines.Count-1 do
      begin
          j := (j * 2);
      end;
      ListBox3.Items.Add('Banyaknya Himpunan Kuasa A : '+System.SysUtils.IntToStr(j));
  end
  else if RadioButton5.Checked = true then
  begin
      stringdata:='';
      ada := false;
      ada2 := false;
      For i:=0 to Memo1.Lines.Count-1 do
          A[i]:=Memo1.Lines.Strings[i];
      For j:=0 to Memo2.Lines.Count-1 do
          B[j]:=Memo2.Lines.Strings[j];
      For i:=0 to Memo1.Lines.Count-1 do
      begin
          ada:=false;
          For j:=0 to Memo2.Lines.Count-1 do
          if A[i]=B[j] then ada:=true;
          if ada=false then stringdata:=stringdata+''+A[i]+',';
      end;
      if ada = true then
      begin
          ListBox3.Items.Add('Hasil Himpunan Bagian :');
          ListBox3.Items.Add('A = { '+edit2.Text+' } adalah himpunan bagian dari B = { '+edit3.Text+' }');
          ListBox3.Items.Add('-------------------------');
      end
      else if ada = false then
      begin
          ListBox3.Items.Add('Hasil Himpunan Bagian :');
          ListBox3.Items.Add('A  = { '+edit2.Text+' } adalah bukan himpunan bagian dari B = { '+edit3.Text+' }');
          ListBox3.Items.Add('-------------------------');
      end;
  end;

end;



end.
