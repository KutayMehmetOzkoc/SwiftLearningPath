import UIKit

func myFirstFunction(){
    print("my function block")
}

myFirstFunction()

func sumFunc(x: Int, y: Int) -> Int{
    return x+y
}

var sum = sumFunc(x: 3, y: 4)

func logicFunction(x: Int, y: Int) -> String{
    if(x>y){
        return "X greater than Y"
    }
    else {
        return "Y greater than X"
    }
}

var summary = logicFunction(x: 4, y:2)

// Optionals


var myName : String = "James"
myName.uppercased()


// ? means maybe there is a value
// ! means must there is a value
var yourName : String?
yourName?.uppercased()

var myAge = "t"
var myInteger = (Int(myAge) ?? 0) * 5

if let myNumber = Int(myAge) {
    print(myNumber * 5)
}else {
    print("Wrong Input")
}
