//
//  ContentView.swift
//  Chapter9SearchApp
//
//  Created by Timur on 10.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    let petArray = ["Cat","Dog","Fish","Donkey","Canary","Camel","Frog"]
    
    var body: some View {
        NavigationView{
            PetListView(animals: petArray)
        }.searchable(text: $searchText){
            ForEach(petArray.filter {$0.hasPrefix(searchText)}, id: \.self) {
                name in Text(name)
            }
        }
    }
}

struct PetListView: View{
    let animals: [String]
    var body: some View {
        List(animals, id: \.self){
            x in Text(x)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
