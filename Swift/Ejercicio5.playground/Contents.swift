import UIKit

// MARK -- Ejercicio5

class PersonMundial {
    var name: String
    var lastName: String
    var age: Int
    var type: [TypePerson]
    
    enum TypePerson {
        case Jugador
        case Seleccionador
        case Médico
    }
    
    init(name: String, lastName: String, age: Int, type: [TypePerson]) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.type = type
    }
}

var personOne = PersonMundial(name: "Sergio",lastName: "Ramos",age: 36,type: [.Jugador])

personOne.name
personOne.lastName
personOne.age
personOne.type
