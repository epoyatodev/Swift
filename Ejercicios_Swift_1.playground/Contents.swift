import UIKit

// MARK: -- Ejercicio1

var primos: [Int] = []

func numPrimos(){
    var contador = 0
    for i in 2...1000{
        for j in 1...i{
            if(i % j == 0){
                contador += 1
            }
        }
        
        if( contador > 2){                           //Si tiene mas de dos divisores, es compuesto, sino, es primo
        }else if(primos.count < 100){
            primos.append(i)                         //Añado al array los numeros primos mientras que la longitud                                           del array sea 100
        }
        contador = 0
    }
    primos.reverse()                                 //Doy la vuelta al array y muestro los 10 primeros (10 últimos)
    
    print("Últimos 10 números primos: \(primos[0 ... 9])")
    
    primos.reverse()                                // Vuelvo a dejar el array en el orden inicial
}
numPrimos()

// MARK: -- Ejercicio2

func sumaNumerosPrimos(){
    
    var suma = primos[0...49].reduce(0, +)
    print("La suma de los 50 primeros numeros primos es: \(suma)")
    
}

sumaNumerosPrimos()

