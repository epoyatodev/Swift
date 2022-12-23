import UIKit

// MARK -- Ejercicio6

/**
 Crear las clases necesarias, con los atributos mínimos, para representar las selecciones de fútbol del Mundial de fútbol 2022, por ejemplo: Una clase que represente el Mundial, necesitaremos que contenga un listado de Selecciones, cada selección tendrá sus atributos, como nombre, país, jugadores, seleccionador, etc.
 */

class Selecciones {
    var name: String
    var country: String
    var players: Int
    var coach: String
    
    init(name: String, country: String, players: Int ,coach: String){
        self.name = name
        self.country = country
        self.players = players
        self.coach = coach
    }
    
}

// Instance of Selecciones

let españa = Selecciones(name: "España", country: "España", players: 23, coach: "Luis Enrique")
let francia = Selecciones(name: "Francia", country: "Francia", players: 23, coach: "Luis Enrique")
let eeuu = Selecciones(name: "EEUU", country: "EEUU", players: 23, coach: "Luis Enrique")
let japon = Selecciones(name: "Japón", country: "Japón", players: 23, coach: "Luis Enrique")
let holanda = Selecciones(name: "Paises Bajos", country: "Paises Bajos", players: 23, coach: "Luis Enrique")
let senegal = Selecciones(name: "Senegal", country: "Senegal", players: 23, coach: "Luis Enrique")
let ecuador = Selecciones(name: "Ecuador", country: "Ecuador", players: 23, coach: "Luis Enrique")
let catar = Selecciones(name: "Catar", country: "Catar", players: 23, coach: "Luis Enrique")
let inglaterra = Selecciones(name: "Inglaterra", country: "Inglaterra", players: 23, coach: "Luis Enrique")
let iran = Selecciones(name: "Irán", country: "Irán", players: 23, coach: "Luis Enrique")
let gales = Selecciones(name: "Gales", country: "Gales", players: 23, coach: "Luis Enrique")
let argentina = Selecciones(name: "Argentina", country: "Argentina", players: 23, coach: "Luis Enrique")
let polonia = Selecciones(name: "Polonia", country: "Polonia", players: 23, coach: "Luis Enrique")
let mexico = Selecciones(name: "México", country: "México", players: 23, coach: "Luis Enrique")
let arabiaSaudita = Selecciones(name: "Arabia Saudita", country: "Arabia Saudita", players: 23, coach: "Luis Enrique")
let australia = Selecciones(name: "Australia", country: "Australia", players: 23, coach: "Luis Enrique")
let tunez = Selecciones(name: "Tunez", country: "Tunez", players: 23, coach: "Luis Enrique")
let dinamarca = Selecciones(name: "Dinamarca", country: "Dinamarca", players: 23, coach: "Luis Enrique")
let alemania = Selecciones(name: "Alemania", country: "Alemania", players: 23, coach: "Luis Enrique")
let costaRica = Selecciones(name: "Costa Rica", country: "Costa Rica", players: 23, coach: "Luis Enrique")
let marruecos = Selecciones(name: "Marruecos", country: "Marruecos", players: 23, coach: "Luis Enrique")
let croacia = Selecciones(name: "Croacia", country: "Croacia", players: 23, coach: "Luis Enrique")
let belgica = Selecciones(name: "Bélgica", country: "Bélgica", players: 23, coach: "Luis Enrique")
let canada = Selecciones(name: "Canadá", country: "Canadá", players: 23, coach: "Luis Enrique")
let brasil = Selecciones(name: "Brasil", country: "Brasil", players: 23, coach: "Luis Enrique")
let suiza = Selecciones(name: "Suiza", country: "Suiza", players: 23, coach: "Luis Enrique")
let camerún = Selecciones(name: "Camerún", country: "Camerún", players: 23, coach: "Luis Enrique")
let serbia = Selecciones(name: "Serbia", country: "Serbia", players: 23, coach: "Luis Enrique")
let portugal = Selecciones(name: "Portugal", country: "Portugal", players: 23, coach: "Luis Enrique")
let coreaSur = Selecciones(name: "Corea del Sur", country: "Corea del Sur", players: 23, coach: "Luis Enrique")
let uruguay = Selecciones(name: "Uruguay", country: "Uruguay", players: 23, coach: "Luis Enrique")
let ghana = Selecciones(name: "Ghana", country: "Ghana", players: 23, coach: "Luis Enrique")




class Mundial {
    var selecciones: [Selecciones]
    
    init(selecciones: [Selecciones]) {
        self.selecciones = selecciones
    }
    
    
}


//Instance of Mundial

var mundial = Mundial(selecciones: [españa, francia, eeuu, japon, holanda, senegal, ecuador, catar, inglaterra, iran, gales, argentina, polonia, mexico, arabiaSaudita, australia, tunez, dinamarca, alemania, costaRica, marruecos, croacia, belgica, canada, brasil, suiza, camerún, serbia, portugal, coreaSur, uruguay, ghana])


class Partidos {
    var local: Selecciones
    var visitor: Selecciones
    var resultLocal: Int
    var resultVisitor: Int
    
    init(local: Selecciones = españa, visitor: Selecciones = francia, resultLocal: Int = 0, resultVisitor: Int = 0) {
        self.local = local
        self.visitor = visitor
        self.resultLocal = Int.random(in: 0...4)
        self.resultVisitor = Int.random(in: 0...4)
    }
    var partidos: [Partidos] = []
    func createMatch() -> Array<Partidos>{
        for seleccion in mundial.selecciones{
            for equipos in mundial.selecciones{
                if(seleccion.name == equipos.name){
                    self.local = equipos
                    continue
                }else{
                    self.visitor = equipos
                    
                }
                
                partidos.append(Partidos(local: self.local, visitor: self.visitor, resultLocal: self.resultLocal, resultVisitor: self.resultVisitor))
                
            }
            
        }
        
        return partidos.shuffled()
        
    }
}





// Creo una extension para separar los elementos del array en 8 grupos de 4 elementos

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}



class Grupos {
    var name: TipoGrupos?
    var listadoParticipantes: [Selecciones]
    var listadoPartidos: [Partidos]?
    
    init(name: TipoGrupos = .GrupoA, listadoParticipantes: [Selecciones] = [españa]) {
        self.name = name
        self.listadoParticipantes = listadoParticipantes
    }
    
    enum TipoGrupos {
        case GrupoA
        case GrupoB
        case GrupoC
        case GrupoD
        case GrupoE
        case GrupoF
        case GrupoG
        case GrupoH
    }
    
    // Función en la que creo los grupos, a partir de un array de grupos obtenido por la separacion
    // del array de selecciones en 8 grupos de 4
    
    func createGroups() -> Array<Grupos>{
        var grupos: [Grupos] = []
        let numbers = Array(mundial.selecciones.shuffled())
        let listadoAgrupado = numbers.chunked(into: 4)
        for i in 0...7{
            switch i{
            case 0:
                grupos.append(Grupos(name: .GrupoA, listadoParticipantes: listadoAgrupado[i]))
            case 1:
                grupos.append(Grupos(name: .GrupoB, listadoParticipantes: listadoAgrupado[i]))
            case 2:
                grupos.append(Grupos(name: .GrupoC, listadoParticipantes: listadoAgrupado[i]))
            case 3:
                grupos.append(Grupos(name: .GrupoD, listadoParticipantes: listadoAgrupado[i]))
            case 4:
                grupos.append(Grupos(name: .GrupoE, listadoParticipantes: listadoAgrupado[i]))
            case 5:
                grupos.append(Grupos(name: .GrupoF, listadoParticipantes: listadoAgrupado[i]))
            case 6:
                grupos.append(Grupos(name: .GrupoG, listadoParticipantes: listadoAgrupado[i]))
            case 7:
                grupos.append(Grupos(name: .GrupoH, listadoParticipantes: listadoAgrupado[i]))
                
            default:
                print("")
            }
        }
        return grupos
    }
    
    func printGroups(){
        print("")
        createGroups().forEach { grupo in
            print("\(grupo.name!)")
            for seleccion in grupo.listadoParticipantes{
                print("\(seleccion.name)")
                
            }
            print("")
        }
        
    }
    
    func calculatePoints(seleccion: Selecciones){
        var victorias: Int
        var derrotas: Int
        var total: Int
        
    }
    
    func generateMatchInGroup()-> Array<Partidos>{
        // Partidos Grupo A
        var partidos: [Partidos] = []
        var local = españa
        var visitante = francia
        for seleccion in createGroups()[0].listadoParticipantes{
            local = seleccion
            
                if(seleccion.name == local.name){
                    
                    continue
                    
                }else{
                    partidos.append(Partidos(local: local, visitor: seleccion, resultLocal: Partidos().resultLocal, resultVisitor: Partidos().resultVisitor))
                }
                
                
            
            
            
        }
        return partidos
    }
    
    
    
}



// MARK: -- IMPRIMIR LA SIMULACION DE PARTIDOS ENTRE SELECCIONES


Partidos().createMatch().forEach { partido in
    print("Partido: \(partido.local.name) \(partido.resultLocal) - \(partido.resultVisitor) \(partido.visitor.name)")
}



// MARK: -- IMPRIMIR GRUPOS CON SELECCIONES

Grupos().printGroups()



// MARK: -- NO HE CONSEGUIDO SIMULAR LOS PARTIDOS ENTRE SELECCIONES DENTRO DEL GRUPO

//Grupos().generateMatchInGroup().forEach { partido in
    //print("\(partido.local.name) - \(partido.visitor.name)")
//}


