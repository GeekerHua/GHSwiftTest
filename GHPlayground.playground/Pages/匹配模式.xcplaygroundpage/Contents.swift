//: [Previous](@previous)

import UIKit

// 2

//let offsetY:CGFloat = 9
//switch offsetY {
//case CGFloat.min..<0:
//    print("0")
//case 0..<64:
//    print("1")
//default:
//    print("2")
//}


let count = -7
switch count {
case Int.min..<0: print("Negative count, really?")
case 0: print("Nothing")
case 1: print("One")
case 2..<5: print("A few")
case 5..<10: print("Some")
default: print("Many")
}

Int.min



// 3

enum MenuItem: Int {
    case Home
    case Account
    case Settings
}


let indexPath = NSIndexPath(forRow: 1, inSection: 0)

switch MenuItem(rawValue: indexPath.row) {
case .Home?: print("0")
case .Account?: print("1")
case .Settings?: print("2")
case nil: fatalError("Invalid indexPath!")
}



