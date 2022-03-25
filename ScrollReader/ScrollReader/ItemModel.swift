//
//  ItemModel.swift
//  ScrollReader
//
//  Created by Kiselov, Oleksandr on 3/25/22.
//

import Foundation

struct ItemModel: Hashable {
    let id: Int
    let isTrigger: Bool
    init(id: Int, isTrigger: Bool = false) {
        self.id = id
        self.isTrigger = isTrigger
    }
}
