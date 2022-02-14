//
//  data.swift
//  projet test schedule
//
//  Created by goldorak on 14/02/2022.
//



import Foundation
import SwiftUI
import UIKit

// creation de la triple nested structure avec les variables du json file qu'on a get de l'api
struct Record: Codable, Hashable { // 1st layer
    let records: [Post]
}

struct  Post: Codable, Hashable,Identifiable{ // 2nd Layer
    var id: String
    //var fields: Fields
}

struct Fields: Codable, Hashable{ // 3rd layer
    var Activity: String
    var Location: String
    var EventType: String
    var End: Date
    var Start: Date
    
}

class  Api : ObservableObject { // Fonction observable qui permet d'initialiser un objet observable permettant le call de l'api et ainsi de récuperer les Events associés à l'aide d'un JSONDecoder
    @Published var record:Record? // variable de type recordes nous permettant d'accerder à nos données
    @Published var loaded:Bool = false  // Variable permettant de check si les données de l'API ont bien été récupérée
    
    init() { // Lancement de la fonction lors de l'initialisation de la classe
        self.getPosts{
            record in
            self.record = record
            self.loaded = true // Si récupéré set à TRUE
        }
    }
    func getPosts(completion: @escaping (Record) ->() ) {
        guard let url = URL(string: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Schedule?api_key=keys7ge2BYFmO6cKO&fields%5B%5D=Activity&fields%5B%5D=Start&fields%5B%5D=Location&fields%5B%5D=Type&fields%5B%5D=End") else {return}
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let recordTest = try! JSONDecoder().decode(Record.self, from: data!) //Decode le Json en le parcourant
                    completion(recordTest)
            }
            .resume()
        }
    }

