//
//  ContentView.swift
//  wallet-app
//
//  Created by Sena Kurtak on 5.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeScreen()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
