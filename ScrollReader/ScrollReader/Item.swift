//
//  Item.swift
//  ScrollReader
//
//  Created by Kiselov, Oleksandr on 3/25/22.
//

import SwiftUI

struct Item: View {
    let model: ItemModel
    var body: some View {
        Rectangle()
            .fill(model.isTrigger ? .red : .gray)
            .overlay(
                Text("id: \(model.id)")
                    .font(.title)
            )
    }
    init(itemModel: ItemModel) {
        self.model = itemModel
    }
}


