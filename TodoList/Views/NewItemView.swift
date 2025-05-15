//
//  NewItemView.swift
//  TodoList
//
//  Created by Sebastian on 2025-05-15.
//

import SwiftUI
 
struct NewItemView: View {
    
    // MARK: Stored properties
    
    // The item currently being added
    @State var newItemDescription = ""
    
    // Access the view model through the environment
    @Environment(TodoListViewModel.self) var viewModel
    
    // Binding to control whether this view is visible
    @Binding var showSheet: Bool
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter a to-do item", text: $newItemDescription)
                    
                    Button("ADD") {
                        // Add the new to-do item
                        viewModel.createToDo(withTitle: newItemDescription)
                        // Clear the input field
                        newItemDescription = ""
                    }
                    .font(.caption)
                    .disabled(newItemDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true)
                }
 
                Spacer()
            }
            .padding(20)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        showSheet = false
                    } label: {
                        Text("Done")
                            .bold()
                    }
                    
                }
            }
        }
 
 
    }
}
 
#Preview {
    NewItemView(showSheet: .constant(true))
}
