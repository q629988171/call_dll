#include "pch.h"
#include "mydll.h"
#include <Windows.h>

/**
 * \brief ��ȡ�����ļ�
 * \param errmsg ����˵��(����)
 * \return 0
 */
int test(char *errmsg)
{
	char lpReturnedString[MAX_PATH];

	if (!GetPrivateProfileString("System","softname",NULL,lpReturnedString,MAX_PATH,"D:\\temp\\test.ini"))
	{
		LPVOID lpMsgBuf;
		FormatMessage(
			FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
			NULL,
			GetLastError(),
			MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
			(LPTSTR)&lpMsgBuf,
			0,
			NULL
		);
		strcpy_s(errmsg, strlen((LPTSTR)lpMsgBuf) + 1, (LPTSTR)lpMsgBuf);
		LocalFree(lpMsgBuf);
	}
	else
	{
		strcpy_s(errmsg, strlen(lpReturnedString) + 1, lpReturnedString);
	}
	return 0;
}