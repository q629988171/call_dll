program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Windows;

type
  // ��������ָ��
  TGetDataReference = function(errmsg: PAnsiChar): Integer; cdecl;

var
  DllHandle: THandle = 0;
  GetDataReference: TGetDataReference;
  tmp: PChar = nil;
  S: String;

begin
  try
    try
      { TODO -oUser -cConsole Main : Insert code here }
      // �����ڴ�ռ�
      tmp := StrAlloc(MAX_PATH);

      // ����DLL
      DllHandle := LoadLibrary
        ('C:\Users\Allen\source\repos\Dll4\Debug\Dll4.dll');

      // ȡ������ַ
      @GetDataReference := GetProcAddress(DllHandle, 'test');

      // ����DLL����
      GetDataReference(PAnsiChar(tmp));

      // ȡָ������
      S := String(PAnsiChar(tmp));

      // ��ӡ���
      WriteLn(S);
    except
      on E: Exception do
        WriteLn(E.ClassName, ': ', E.Message);
    end;
  finally
    // �ͷ��ڴ�ռ�
    StrDispose(tmp);

    // �ͷ�DLL
    FreeLibrary(DllHandle);
    WriteLn('Press the ENTER key to stop');
    ReadLn;
  end;

end.
