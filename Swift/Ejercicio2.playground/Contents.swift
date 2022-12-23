import UIKit


// MARK -- Ejercicio2


func sumFirst50PrimeNumbers(){
    var primos: [Int] = []
    var cont = 0

    for i in 2...1000{
        for j in 1...i{
            if(i % j == 0){
                cont += 1
            }
        }
        
        if( cont > 2){
        }else if(primos.count < 100){
            primos.append(i)
        }
        cont = 0
    }

    var suma = primos[0...49].reduce(0, +)
    print("The sum of the first 50 numbers:  \(suma) \n")
}

sumFirst50PrimeNumbers()

