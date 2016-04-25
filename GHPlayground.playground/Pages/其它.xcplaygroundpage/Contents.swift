//: [Previous](@previous)

import UIKit

//var str = "Hello, playground"

//let page = -3
//assert(page >= 0, "page can't < 0")


let formatter = NSDateFormatter()
formatter.dateFormat = "YYYY-mm-dd HH:mm:ss"
formatter.stringFromDate(NSDate())



//: [Next](@next)
let text: String = "7.5"
NSNumber(double: Double(text.isEmpty ? "0" : text)!)


let price : NSNumber? = NSNumber(double: 3.2)
 "\(price ?? 0)" == "0" ? "" : "\(price!)"

let dict = ["a" : "32","b": "44"]
let dict2 = ["c" : "23", "d": "45"]



class Person: NSObject {
    var a: String?
    var b: String?
    var c: String?
    var d: String?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
}

dict
let p = Person(dict: dict)
p.setValuesForKeysWithDictionary(dict2)
p


let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
searchBar.backgroundColor = UIColor.greenColor()
searchBar.barStyle = .Black
searchBar.barTintColor = UIColor.whiteColor()
//searchBar.backgroundImage = UIImage()


searchBar




