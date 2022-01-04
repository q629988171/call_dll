program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Windows;

type
  // 声明函数指针
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
      // 申请内存空间
      tmp := StrAlloc(MAX_PATH);

      // 加载DLL
      DllHandle := LoadLibrary
        ('C:\Users\Allen\source\repos\Dll4\Debug\Dll4.dll');

      // 取函数地址
      @GetDataReference := GetProcAddress(DllHandle, 'test');

      // 调用DLL函数
      GetDataReference(PAnsiChar(tmp));

      // 取指针数据
      S := String(PAnsiChar(tmp));

      // 打印结果
      WriteLn(S);
    except
      on E: Exception do
        WriteLn(E.ClassName, ': ', E.Message);
    end;
  finally
    // 释放内存空间
    StrDispose(tmp);

    // 释放DLL
    FreeLibrary(DllHandle);
    WriteLn('Press the ENTER key to stop');
    ReadLn;
  end;

end.
