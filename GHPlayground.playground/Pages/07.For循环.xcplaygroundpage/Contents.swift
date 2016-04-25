//: [Previous](@previous)

import Foundation

for var i = 0; i < 10 ; i++ {
    print(i)
}

for i in 0..<10 {
    print(i)
}

for i in 0...10 {
    print(i)
}

let range = 0...10

for i in range {
    print(i)
}

for (index,value) in [2,24,45,7567,3].enumerate() {
    print("index = \(index) value = \(value)")
}

//: [Next](@next)
