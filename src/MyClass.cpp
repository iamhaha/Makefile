/*
File name:  MyClass.cpp
Created on: 2013-11-12

@summary:   Sample class implementation 
@author:    dingshenglong<dingshlong@gmail.com>
*/

#include "MyClass.h"
#include <iostream>

MyClass::MyClass(int iValue)
  : mValue(iValue)
{
}

void MyClass::PrintValue()
{
    std::cout << "Value = " << mValue << std::endl;
}
