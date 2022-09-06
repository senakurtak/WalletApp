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
    @State var showDetail : Bool = false
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
            .overlay(alignment: .trailing,content: {
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
//        .overlay {
//            if let selectedCard,showDetail{
//                DetailView(card: selectedCard)
//            }
//        }
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
                            .matchedGeometryEffect(id: card.id, in: animation)
                            .rotationEffect(.init(degrees: -90))
                            .frame(width: size.height, height: size.width)
                            .frame(width: size.width , height: size.height)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                                    selectedCard = card
                                    showDetail = true
                                }
                            }
                    }
                    .frame(width: 300)
                }
            }
            .padding(15)
            .padding(.leading,20)
        }
    }
    
    @ViewBuilder
    func DetailView(card: Card)->some View{
        VStack{
            HStack{
                Button{
                    withAnimation(.easeInOut(duration: 0.5)){
                        showDetail = false
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Text("Back")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom,15)
            Image(card.cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 220)
        }
        .padding(15)
        .frame(maxWidth: .infinity, minHeight: .infinity, alignment: .top)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
