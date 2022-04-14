//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Christopher Walter on 4/14/22.
//

import Foundation

/*
 CRUD Functions: These are the functions on the viewModel
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject
{
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey = "items_list"
    init()
    {
        getItems()
    }
    
    func getItems()
    {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
