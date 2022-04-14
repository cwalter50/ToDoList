//
//  AddView.swift
//  ToDoList
//
//  Created by Christopher Walter on 4/14/22.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .frame(height: 55)
//                    .background(Color.mint)
                .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(15)
        }
        .navigationTitle("Add an Item 🖊")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPressed()
    {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool
    {
        if textFieldText.count < 3 {
            alertTitle = "Your new ToDo Item must be at least 3 characters long 😨😨"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
       
    }
}
