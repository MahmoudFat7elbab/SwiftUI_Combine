//
//  MarvelCharcter.swift
//  Codezilla_SwiftUI
//
//  Created by Mahmoud Fathelbab on 1/31/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation
import SwiftUI

struct MarvelCharcter: Hashable, Identifiable {
    let id: String = UUID().uuidString
    let image: String
    let title: String
    let desc: String
    var isBest: Bool = false
    
    static var mockedData: [MarvelCharcter] = {
        return [
            MarvelCharcter(
                image: "A-Bomb (HAS)",
                title: "A-Bomb (HAS)",
                desc: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion."
            ),
            MarvelCharcter(
                image: "A.I",
                title: "A.I.M",
                desc: "AIM is a terrorist organization bent on destroying the world."
            ),
            MarvelCharcter(
                image: "Abyss (Age of Apocalypse)",
                title: "Abyss (Age of Apocalypse)",
                desc: "Formerly known as Emil Blonsky, a spy of Soviet Yugoslavian origin working for the KGB",
                isBest: true
            ),
            MarvelCharcter(
                image: "Abyss",
                title: "Abyss",
                desc: "Formerly known as Emil Blonsky, a spy of Soviet Yugoslavian origin working for the KGB"
            ),
            MarvelCharcter(
                image: "Adam Warlock",
                title: "Adam Warlock",
                desc: "Adam Warlock is an artificially created human who was born in a cocoon at a scientific complex called The Beehive."
            ),
         
        ]
    }()
}
