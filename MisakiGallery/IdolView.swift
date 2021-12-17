//
//  IdolView.swift
//  MisakiGallery
//
//  Created by Spike Liao on 2021/12/17.
//

import Foundation
import SwiftUI

struct IdolView: View {
    @EnvironmentObject var cardsObj: Cards
    let id: Int
    
    init(_ id: Int){
        self.id = id
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(cardsObj.cards.filter { $0.idolID == id }) { card in
                    CardView(card)
                }
            }
        }.navigationTitle("Detail")
    }
}

struct CardView: View {
    let card: Card
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        let url = URL(string: getCardUrl(imageType: ImageType.cardBg, resourceId: card.resourceID))
        AsyncImage(url: url, content: { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .failure(let error):
                { () -> Image in
                    print(error)
                    return Image(systemName: "exclamationmark.triangle")
//                        .resizable()
//                        .aspectRatio( contentMode: .fit)
                        
                }()
            case .success(let image):
                image.resizable().aspectRatio(contentMode: .fit)
            @unknown default:
                EmptyView()
            }
        })
            .frame(minHeight: 200)
    }
}

