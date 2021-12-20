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
            LazyVStack {
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
        let url = URL(string: getCardUrl(imageType: ImageType.card, resourceId: card.resourceID))
        CachedAsyncImage(url: url, content: { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .failure:
                ProgressView()
//               errorView(error: error, url: url)
            case .success(let image):
                image.resizable().aspectRatio(contentMode: .fit)
            @unknown default:
                EmptyView()
            }
        })
            .frame(minHeight: 200)
    }
    
    func errorView(error: Error, url: URL?) -> some View {
        print("Error: \(error): \(String(describing: url?.absoluteURL))")
        return VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width:64, height: 64)
                .aspectRatio(contentMode: .fill)
            Text(error.localizedDescription)
                .padding()
        }
    }
}

