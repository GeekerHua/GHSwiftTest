//: [Previous](@previous)

import UIKit


//: [Next](@next)
let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
label.backgroundColor = UIColor.yellowColor()


let str = NSMutableAttributedString(string: "百度百科")
str.addAttribute(NSLinkAttributeName, value: "http://www.baidu.com", range: NSRange(location: 0, length: 2))
label.userInteractionEnabled = true
label.attributedText = str



extension NSObject {
    class var nameOfClass: String {
         NSStringFromClass(self)
        return NSStringFromClass(self).componentsSeparatedByString(".").last! as String
    }
    
    //用于获取 cell 的 reuse identifier
    class var identifier: String {
        return String(format: "%@_identifier", self.nameOfClass)
    }
}


UITabBarController.nameOfClass