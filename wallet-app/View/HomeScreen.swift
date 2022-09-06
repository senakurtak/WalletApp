//
//  HomeScreen.swift
//  wallet-app
//
//  Created by Sena Kurtak on 6.09.2022.
//

import SwiftUI

struct HomeScreen: View {
    
    @State var cards : [Card] = [
        .init(cardImage: "Card1"),
        .init(cardImage: "Card2")
    ]
    
    @Namespace var animation
    @State var selectedCard: Card?
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 6){
                Text("Welcome Back,")
                    .font(.title.bold())
                    .foregroundColor(.white)
                Text("iJustine")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .trailing, content: {
                Button {
                } label: {
                    Image("Pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                }
            })
            .padding(15)
            VStack(alignment: .leading, spacing: 6){
                Text("Total Balance,")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Text("$1,234,567")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
            }
            .padding(15)
            .padding(.top,10)
            .frame(maxWidth: .infinity, alignment: .leading)
            CardsScrollView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
    }
    @ViewBuilder
    func CardsScrollView()->some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:15){
                ForEach(cards){card in
                    GeometryReader{proxy in
                        let size = proxy.size
                        
                        Image(card.cardImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .rotationEffect(.init(degrees: -90))
                            .frame(width: size.height, height: size.width)
                            .frame(width: size.width , height: size.height)
                    }
                    .frame(width: 300)
                }
            }
            .padding(15)
            .padding(.leading,20)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
