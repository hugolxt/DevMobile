//
//  ContentView.swift
//  projet test schedule
//
//  Created by Lextrait Hugo on 14/02/2022.
//

import SwiftUI

struct ContentView: View {
    // creation de lobservable object
    @ObservedObject var record = Api()
    
    var body: some View {
        
        if self.record.loaded == true { // check si l'api a déja retourné les informations -> alors la variable bool est passé true et on contruit notre liste d'événements
            if let data = self.record.record?.records{ // initialisation des datasà travers la récupération de l'ObservedObject
                List(data){ // Initialisation de notre liste de data contenant toute nos records
                    record in
                    Text("ID : "+record.id) // Affichage des ID correspondants à chaque Records
                }   // YESSSSSS ca fonctionne :)
            }
        }
        else {
            Text("no loaded") // dans le cas ou les datas ne sont pas fetch
        }
        
    }
}
