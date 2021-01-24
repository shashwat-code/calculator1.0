import Foundation

func change(f:Double,s:Double)->Double{
    let res  = String(Int(f))+"."+String(Int(s))
    print(res)
    return Double(res)!
}
class CalculatorBrain{
    private var accumulator = 0.0
    var description=""
    func setOperand(operand: Double){
        description.append(String(operand))
        accumulator = operand
        print(accumulator)
    }
    struct pendingInfo {
        var binaryOperation: (Double,Double)->Double
        var op1: Double
    }
    
    var pending:pendingInfo?
    func performOperation(symbol: String){
        if symbol != "="{
            description.append(symbol)
        }
        print(description)
        if let operation = dict[symbol]{
            switch(operation){
            case .constant(let constant):
                accumulator=constant
                
            case .unaryOperation(let foo):
                accumulator = foo(accumulator)
                
            case .binaryOperation(let foo1):
                pendingFunction()
                pending = pendingInfo(binaryOperation: foo1, op1: accumulator)
                
            case .equals: pendingFunction()
            case .clear: accumulator=0
            }
            
            
        }
    }
    private func pendingFunction(){
        if pending != nil{
           print("acc: \(accumulator)")
           print("op1: \(pending!.op1)")
           accumulator=pending!.binaryOperation(pending!.op1,accumulator)
           pending=nil
       }
    }
    
    enum Operations{
        case clear
        case constant(constant: Double)
        case unaryOperation((Double)->Double)
        case equals
        case binaryOperation((Double,Double)->Double)
    }
   
    var dict:Dictionary<String, Operations> = [
        "π":   .constant(constant: Double.pi),
        "√":   .unaryOperation(sqrt),
        "∛":   .unaryOperation({return pow($0,1/3)}),
        "∜":   .unaryOperation({return pow($0,1/4)}),
        "cos": .unaryOperation(cos),
        "sin": .unaryOperation(sin),
        "tan": .unaryOperation(tan),
        "×":   .binaryOperation({return $1*$0 }),
        "+":   .binaryOperation({return $1+$0}),
        "−":   .binaryOperation({return $1-$0}),
        "=":   .equals,
        ".":   .binaryOperation(change),
        "÷":   .binaryOperation({return $0/$1 }),
        "AC":  .clear,
        "X⁻¹": .unaryOperation({return 1/$0}),
        "±":   .unaryOperation({return -1*$0}),
        "%":   .binaryOperation({return Double(Int($0)%Int($1))})
        
    ]
    
   
    var result:Double{
        get{
            return accumulator
        }
    }
    
}
