//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Christopher Walter on 4/14/22.
//

import SwiftUI


/*
 
 MVVM Archictecture
 
 Model - data point
 View - UI
 ViewModel - Manages Models for view
 
 */
@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            // add all views into a navigationView
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            
        }
    }
}
