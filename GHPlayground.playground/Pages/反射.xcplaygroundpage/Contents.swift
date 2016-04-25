//: [Previous](@previous)

import UIKit

//var str = "Hello, playground"


let view = UIView()
class p: UIViewController {
    
}
//var str = UIView.self
let  str = "UIView"

let cls: AnyClass = NSClassFromString(str)!
print(cls)
print(view.dynamicType)
view.dynamicType
let v = Mirror(reflecting: view)
v.subjectType

v.superclassMirror()
v.description

let pp = p()
let ppp = Mirror(reflecting: pp)
print(ppp.subjectType)
let s : String = String(ppp.subjectType)
ppp.superclassMirror()
print("sdfds=\(s)")
//let p = cls()


//let v = NSClassFromString(str)()
//let str: String = NSStringFromClass(UIView.self)


//let str = NSClassFromString("UIView")

//: [Next](@next)
