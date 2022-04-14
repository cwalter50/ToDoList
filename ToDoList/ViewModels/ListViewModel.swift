//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Christopher Walter on 4/14/22.
//

import Foundation

/*
 CRUD Functions
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject
{
    @Published var items: [ItemModel] = []
    
    init()
    {
        getItems()
    }
    
    func getItems()
    {
        let newItems = [
            ItemModel(title: "FirstItem", isCompleted: true),
            ItemModel(title: "SecondItem", isCompleted: false),
            ItemModel(title: "ThirdItem", isCompleted: true)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet)
    {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int)
    {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String)
    {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion() // this will make a new ListModel that has the same id and title but updated isCompleted. 
        }

    }
}
