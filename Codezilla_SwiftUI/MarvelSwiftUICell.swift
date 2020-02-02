//
//  MarvelCell.swift
//  Codezilla_SwiftUI
//
//  Created by Mahmoud Fathelbab on 1/31/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import SwiftUI

struct MarvelSwiftUICell: View {
     var marvelCharcter = MarvelCharcter.mockedData[0]

    var body: some View {
        VStack {
            HStack {
                Image(marvelCharcter.image)
                    .resizable()
                    .frame(width: 80, height: 80)
                     .clipShape(RoundedRectangle(cornerRadius: 12))
                                   .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(Color.secondary))
                
                VStack(alignment: .leading){
                    Text(marvelCharcter.title)
                        .font(.headline)
                        
                    Text(marvelCharcter.desc)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct MarvelSwiftUICell_Previews: PreviewProvider {
    static var previews: some View {
        MarvelSwiftUICell(marvelCharcter: MarvelCharcter.mockedData[1])
    }
}
