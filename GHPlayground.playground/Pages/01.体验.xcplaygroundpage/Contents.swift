//: Playground - noun: a place where people can play

import UIKit


var str = "Hello, playground"

class_getName(UIResponder)
class_getSuperclass(UIButton)
class_isMetaClass(UIView)



//class People {
//    var i = 55
//    var j = 3
//    var btn : UIButton
//
//}

class_getInstanceVariable(class_getSuperclass(UIButton), class_getName(UIControl))

class_copyIvarList(class_getSuperclass(UIButton), nil)

