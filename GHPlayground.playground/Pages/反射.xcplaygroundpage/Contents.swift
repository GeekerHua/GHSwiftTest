//: [Previous](@previous)

import UIKit

//var str = "Hello, playground"


let view = UIView()
class p: UIViewController {
    
}
//var str = UIView.self
let  str = "UIView"

let cls: AnyClass = NSClassFromString(str)!
let ttt = cls.alloc()

print(cls)
print(view.dynamicType)
view.dynamicType
let v = Mirror(reflecting: view)
v.subjectType
//let p = cls()



class Dog: NSObject {
    
}

let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
//拼接成固定格式
let controller: AnyClass? = NSClassFromString(nameSpace + "." + "Dog")
//创建对象
//let viewController = (controller as! UIViewController.Type).init()


v.superclassMirror()
v.description

let pp = p()
let ppp = Mirror(reflecting: pp)
print(ppp.subjectType)
let s : String = String(ppp.subjectType)
ppp.superclassMirror()
print("sdfds=\(s)")
//let p = cls()

String(Mirror(reflecting: pp).subjectType)
//let v = NSClassFromString(str)()
//let str: String = NSStringFromClass(UIView.self)


//let str = NSClassFromString("UIView")

//: [Next](@next)
