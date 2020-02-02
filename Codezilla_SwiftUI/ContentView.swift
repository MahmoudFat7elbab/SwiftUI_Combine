//
//  ContentView.swift
//  Codezilla_SwiftUI
//
//  Created by Mahmoud Fathelbab on 1/31/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   // private var marvelCharcters: [MarvelCharcter] = MarvelCharcter.mockedData
    
    @EnvironmentObject var marvelObj :MarvelData
   
    var body: some View {
        NavigationView(){
            List {
                Section{
                    Toggle("Show Best", isOn: $marvelObj.showBest)
                }
                
                ForEach(marvelObj.marvelCharcters) { marvel in
                    if marvel.isBest || !self.marvelObj.showBest{
                        NavigationLink(destination: MarvelCharacterDetailsView(marvelCharcter: marvel))
                                           {
                                               MarvelSwiftUICell(marvelCharcter: marvel)
                                           }
                    }
                   
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Hello Codezilla")
        }
        
    }
    
}

#if DEBUG
struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            
            ContentView()
                .previewDevice("iPhone SE")
            .environmentObject(MarvelData())
            
            ContentView()
                .previewDevice("iPhone X")
            .environmentObject(MarvelData())
            ContentView()
                .previewDevice("iPhone 11 Pro").environment(\.sizeCategory, .extraExtraExtraLarge).environment(\.colorScheme, .dark)
            .environmentObject(MarvelData())
        }
    }
}
#endif
