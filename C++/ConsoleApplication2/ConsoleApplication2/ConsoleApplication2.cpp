#include <iostream>
#include <Windows.h>
#include <string>

using namespace std;

int main()
{
	//声明函数指针，告诉程序从动态链接库导入的地址是什么类型的函数
	typedef int(*test)(char *errmsg);

	// 加载DLL
	HINSTANCE hDll = LoadLibrary(R"(C:\Users\Allen\source\repos\Dll4\Debug\Dll4.dll)");

	//查找函数地址
	test p_test = (test)GetProcAddress(hDll, "test");

	char tmp[MAX_PATH];
	
	// 使用dll中导出的函数
	p_test(tmp);

	//打印结果
	cout << tmp << endl;

	//释放DLL
	FreeLibrary(hDll);

	return 0;
}