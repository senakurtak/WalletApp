//
//  Card.swift
//  wallet-app
//
//  Created by Sena Kurtak on 5.09.2022.
//

import SwiftUI

struct Card : Identifiable{
    var id: String = UUID().uuidString
    var cardImage: String
    var rotation: CGFloat = 0
}
