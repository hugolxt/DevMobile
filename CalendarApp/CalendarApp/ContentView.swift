//
//  ContentView.swift
//  CalendarApp
//
//  Created by Hugo Lextrait on 31/01/2022.
//

import SwiftUI
import Combine

struct ContentView : View {
    // Local initialization of the list that we should have retrieve from the API thanks to @Observable class and @ObservedItem
    var recordList = [
        Events(id: "0", fields: Fields(Activity: "Breakout session (Friday)", Location: "rec2AeKjMRbEQ43hi", EventType:"Breakout session" ,End: "2015-03-04",Start: "2019-11-16")),
        Events(id: "1", fields: Fields(Activity: "Breakout session (Saturday)", Location: "rec2AeKjMRbEQ43hi", EventType:"Breakout session" ,End: "2015-03-04",Start: "2019-11-16")),
        Events(id: "2", fields: Fields(Activity: "Meal at McDonalds", Location: "rec2AeKjMRbEQ43hi", EventType:"Meal" ,End: "2015-03-04",Start: "2019-11-17"))
    ]

    var body: some View {
        // Front Initialization of
        Group { // Vertical groups like divs
            HStack { // Horizontal groups like divs
                Button("<") { // Header
                    print("Button tapped!")
                }
                Text("Calendar Application")
            }
            
            List(recordList, id: \.id) { event in
              HStack { // Creattion of the list
                  Text(event.fields.Activity ?? "Not found")
                  Text(event.fields.Start ?? "Not found")
                  Button("  >") {
                      print("Button tapped!")
                  }
              }
            }
            Text("Footer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

