from ctypes import *

lib = cdll.LoadLibrary(r"C:\Users\Allen\source\repos\Dll4\x64\Debug\Dll4.dll")
lib.test.restype = c_int
lib.test.argtype = c_char_p

buf = create_string_buffer(260)
lib.test(buf)
print(buf.value.decode("ansi"))
