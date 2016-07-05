//: Playground - noun: a place where people can play

import UIKit


var str = "Hello, playground"

NSTimeIntervalSince1970


let tt: NSTimeInterval = 1452764088193


let st: String? =  ""

st?.isEmpty
if let p = st {
    p
} else {
    "dd"
}
//st!.isEmpty
0x2d
45
str = "#12342d"
let co = 0xbbbbbb
let t : Int = Int(co)

//let hex = str

//func colorWithHexString (hex:String) -> UIColor {
    var cString:String = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
    
    if (cString.hasPrefix("#")) {
        cString = (cString as NSString).substringFromIndex(1)
    }
    
//    if (countElements(cString) != 6) {
//        return UIColor.grayColor()
//    }

    var rString = (cString as NSString).substringToIndex(2)
    var gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
    var bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    NSScanner(string: rString).scanHexInt(&r)
    NSScanner(string: gString).scanHexInt(&g)
    NSScanner(string: bString).scanHexInt(&b)
    UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    
//    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
//}




if str.characters.count == 7 {
    var r = (str as NSString).substringWithRange(NSMakeRange(1, 2))
    var g = (str as NSString).substringWithRange(NSMakeRange(3, 2))
    var b = (str as NSString).substringWithRange(NSMakeRange(5, 2))
    b = "0x"+b
    
    
    var hexString = "2b"
    var result:UInt32 = 0
//    NSScanner.scannerWithString(hexString).scanHexInt(&result)//result = 43
//    NSScanner.s
    NSScanner.scanHexInt(NSScanner(string: hexString))
    
//    let char: Character
//    unsigned char whole_byte;
//    char byte_chars[3] = {'\0','\0','\0'};
//    int i;
//    for (i=0; i < [command length]/2; i++) {
//        byte_chars[0] = [command characterAtIndex:i*2];
//        byte_chars[1] = [command characterAtIndex:i*2+1];
//        whole_byte = strtol(byte_chars, NULL, 16);
//        [commandToSend appendBytes:&whole_byte length:1];
//    }
//    NSLog(@"%@", commandToSend);
    
    
//    let nsdataUTF16 = b.dataUsingEncoding(NSUTF16LittleEndianStringEncoding)
//    [b dataUsingEncoding:NSUTF16LittleEndianStringEncoding];//转HEX
    
//    NSString* newStr = [[NSString alloc]  initWithData: nsdataUTF16 encoding:NSUTF16LittleEndianStringEncoding];//转回字符
    let p = Int(b)
    
}

func toColor(str: String) -> UIColor? {
    (str as NSString).substringWithRange(NSMakeRange(2, 2))
    return nil
//    let rgb(r: String, g: String, b: String)
}

let formatter = NSDateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
let currentDateStr = formatter.stringFromDate(NSDate())
let date2Str = formatter.stringFromDate(NSDate(timeIntervalSince1970: tt / 1000))

let date1 = NSDate()
//let date2 = formatter.dateFromString(date2Str)
let date3 = NSDate(timeIntervalSince1970: tt/1000)

// 计算时间间隔
//let aTimer = date1.timeIntervalSinceDate(date2!)
//
//let minute = aTimer/60






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

