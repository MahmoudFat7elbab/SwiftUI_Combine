//
//  MarvelCharacterDetailsView.swift
//  Codezilla_SwiftUI
//
//  Created by Mahmoud Fathelbab on 1/31/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import SwiftUI

struct MarvelCharacterDetailsView: View {
    var marvelCharcter : MarvelCharcter
    
    @EnvironmentObject var marvelObj : MarvelData
    
    var indexOfMarvelCharcter : Int{
         marvelObj.marvelCharcters.firstIndex(where: { $0.id == marvelCharcter.id })!
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Image(marvelCharcter.image)
                    .resizable()
                    .frame(height :400)
                Text(marvelCharcter.title)
                    .padding(10)
                Text(marvelCharcter.desc)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 10))
                HStack {
                    Spacer()
                    Button(
                        action: {
                            // did tap
                            self.marvelObj.marvelCharcters[self.indexOfMarvelCharcter].isBest = true
3
                        },
                        label: { Text("Mark as Best") }
                    )
                    Spacer()
                }
               
            }
            
        }
        
        .navigationBarTitle(Text(marvelCharcter.title), displayMode: .inline)
    }
}

struct MarvelCharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelCharacterDetailsView(marvelCharcter: MarvelCharcter.mockedData[3])
        .environmentObject(MarvelData())
    }
}
