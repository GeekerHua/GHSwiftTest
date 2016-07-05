//: [Previous](@previous)

import UIKit

var str = "Hello, playground"

//: [Next](@next)
extension UIColor {
    func coverToImage(size: CGSize) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        
        //        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, self.CGColor)
        CGContextFillRect(context, rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage
    }
//    convenience init(color: UIColor, size: CGSize) {
//        self.init()
//        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
//        UIGraphicsBeginImageContext(rect.size)
//        let context = UIGraphicsGetCurrentContext()
//        
//        
////        CGContextRef context = UIGraphicsGetCurrentContext();
//        CGContextSetFillColorWithColor(context, color.CGColor);
//        CGContextFillRect(context, rect);
//        let theImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        self = theImage;
//    }
}
UIColor(red: 0.976, green: 0.616, blue: 0.227, alpha:1.00).coverToImage(CGSize(width: 320, height: 64))

//UIImage(color: UIColor.redColor(), size:



//let imgBack = UIImage(data: UIColor.redColor(), scale: CGSize(width: 320, height: 64))


