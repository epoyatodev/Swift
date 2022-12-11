import UIKit

// MARK -- Ejercicio 3

func elementsWithMoreThanTwoVowels(){
    
    var players = ["Vinicius", "Messi", "Ronaldo", "Pedri", "Mbappe", "Modric", "Militao","Morata","Valverde","Benzema", "Piqué" ]
    
    let vowels = Array("aeiou")
    
    var numVowels = 0
    
    for player in players{
        for char in player.lowercased(){
            if vowels.contains(char) {
                numVowels += 1
            }
        }
        if(numVowels > 2){
            print("\(player) have \(numVowels) vowels")
        }
        numVowels = 0
        
    }
}
   
elementsWithMoreThanTwoVowels()
    

