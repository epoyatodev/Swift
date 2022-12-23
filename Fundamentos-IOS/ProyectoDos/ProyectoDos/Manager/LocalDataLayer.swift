//
//  LocalDataLayer.swift
//  ProyectoDos
//
//  Created by Enrique Poyato Ortiz on 18/12/22.
//

import Foundation
import UIKit

final class LocalDataLayer {
    private static let token = "token"
    private static let heroes = "heroes"

    static let shared = LocalDataLayer()
    
    
    func save(token: String) {
        UserDefaults.standard.set(token, forKey: Self.token)
    }
    
    func getToken() -> String {
        UserDefaults.standard.string(forKey: Self.token) ?? ""
    }
    func deleteToken() -> Void {
        UserDefaults.standard.set("", forKey: Self.token)
        
    }
    
    func isUserLogged() -> Bool {
        return !getToken().isEmpty
    }
    
    func save(heroes: [Heroe]) {
        if let encodedHeroes = try? JSONEncoder().encode(heroes) {
            UserDefaults.standard.set(encodedHeroes, forKey: Self.heroes)
        }
    }
    
    func getHeroes() -> [Heroe] {
        if let savedHeroesData = UserDefaults.standard.object(forKey: Self.heroes) as? Data {
            do {
                let savedHeroes = try JSONDecoder().decode([Heroe].self, from: savedHeroesData)
                return savedHeroes
            } catch {
                print("Somethinbf went wrong !!!")
                return []
            }
        } else {
            return []
        }
    }
}
