//
//  ItemModel.swift
//  ToDoList
//
//  Created by Christopher Walter on 4/14/22.
//

import Foundation

// Immutable Struct. They are all let constants, so that we can only update things in a function like updateCompletion
struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    // This allows us to create two initializers in one. One init is (id, title, and isCompleted) the other is (title, isCompleted)
    init(id: String = UUID().uuidString, title:String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
