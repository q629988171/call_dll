# 项目简介
多语言调用C++的DLL(读配置文件)的范列

## 为什么有这个项目
因为很多配置文件的内容同时存在"ansi"和"utf-8"编码，且还有很多不规范的“注释”，这样会导致"Python"读取配置文件的时候出错，解决方案就是调用第三方DLL来读写配置文件。

## 为什么要用C++写DLL(读配置文件)
因为C++可以返回错误代码，错误说明。DELPHI在读配置文件的时候遇到异常无法返回错误代码和错误说明。

## TODO
- [x] Python
- [x] 易语言
- [ ] C++
- [ ] Delphi
