//
//  ListView.swift
//  ToDoList
//
//  Created by Christopher Walter on 4/14/22.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the first Item",
        "This is the second Item",
        "This is the third Item"
    ]
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        
    }
}


