import UIKit

// MARK: -- Ejercicio1


func primeNumbers(){
    var primos: [Int] = []

    var cont = 0
    for i in 2...1000{
        for j in 1...i{
            if(i % j == 0){
                cont += 1
            }
        }
        
        if( cont > 2){                                  //Si tiene mas de dos divisores, es compuesto, sino, es primo
        }else if(primos.count < 100){
            primos.append(i)                            //Añado al array los numeros primos mientras que la longitud del array sea 100
        }
        cont = 0
    }
    primos.reverse()                                    //Doy la vuelta al array y muestro los 10 primeros (10 últimos)

    print("Last 10 prime number: \(primos[0 ... 9]) \n")

    primos.reverse()                                    // Vuelvo a dejar el array en el orden inicial

}


primeNumbers()





















