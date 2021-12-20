//
//  ContentView.swift
//  MisakiGallery
//
//  Created by Spike Liao on 2021/12/17.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cardsObj: Cards
    @State private var text: String = ""
    @State var firstAppear: Bool = true
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let columnCount = Int((geometry.size.width / 100).rounded(.down))
                ScrollView(showsIndicators: false) {
                    
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: columnCount)) {
                        ForEach(cardsObj.cards.filter {$0.rarity == 1}) { card in
                            CardIcon(card)
                        }
                    }
                    .padding()
                }
                .onAppear {
                    if firstAppear {
                        loadCards()
                        firstAppear = false
                    }
                }
                .searchable(text: $text)
                .onSubmit(of: .search) {
                    // TODO:
                }
            }
            .navigationTitle("Misaki Gallery")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .navigationViewStyle(.stack)
    }
    
    func loadCards() {
        print("============== Start loading json ==============")
        let start = Date()
        guard let path = Bundle.main.path(forResource: "cards", ofType: "json") else {return}
        print("Asset path: \(path)")
        let url = URL(fileURLWithPath: path)
        do {
            let jsonData = try Data(contentsOf: url)
            let cards = try JSONDecoder().decode([Card].self, from: jsonData)
            cardsObj.cards = cards
            print("Cards count: \(cards.count)")
            let end = Date()
            print("Time elapsed: \(Calendar.current.dateComponents([.nanosecond], from: start, to: end).nanosecond!/1000000)ms")
        } catch {
            print(error)
        }
    }
}

struct CardIcon: View {
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        NavigationLink(destination: IdolView(card.idolID)) {
            VStack {
                CachedAsyncImage(url: URL(string: getCardUrl(imageType: ImageType.icon, resourceId: card.resourceID))){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 64, height: 64)
                
                Text(card.name.split(separator: "　").last!)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

