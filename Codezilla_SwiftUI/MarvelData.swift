//
//  MarvelData.swift
//  Codezilla_SwiftUI
//
//  Created by Mahmoud Fathelbab on 2/1/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit
import Combine
final class MarvelData: ObservableObject {
   @Published var showBest = false
    
   @Published var marvelCharcters = MarvelCharcter.mockedData

}
