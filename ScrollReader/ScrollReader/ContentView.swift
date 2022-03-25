//
//  ContentView.swift
//  ScrollReader
//
//  Created by Kiselov, Oleksandr on 3/24/22.
//

import SwiftUI

// trigger ids
let triggerIds = [26, 45, 79]

struct ContentView: View {
    // array of item model with ids from 0 to 99 and set up trigger ids
    @State var items = Array(generate: {id in ItemModel(id: id, isTrigger: triggerIds.contains(id))}, count: 100)
    
    let columns = [
        GridItem(),
        GridItem()
    ]
    var body: some View {
        // It works with List, but without LazyVGrid
        // List {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(items, id: \.self) { model in
                    Item(itemModel: model)
                        .readView(onChange: {id in
                            if triggerIds.contains(id)  {
                                print("Item with ID: \(id) has been visible")
                            }
                        })
                        .frame(width: 150, height: 150, alignment: .center)
                        .padding(20)
                }
            }
        }
    }
}

extension Item {
    func readView(onChange: @escaping (Int) -> Void) -> some View {
        background(
            Color.clear
                .preference(key: ViewIDPreferenceKey.self, value: self.model.id)
        )
        .onPreferenceChange(ViewIDPreferenceKey.self, perform: onChange)
    }
}

private struct ViewIDPreferenceKey: PreferenceKey {
    static var defaultValue: Int = -1
    static func reduce(value: inout Int, nextValue: () -> Int) {}
}

// generates array with required count calling init on every instanse
extension Array {
    public init(generate: (Int) -> Element, count: Int) {
        self = (0..<count).map(generate)
    }
}

