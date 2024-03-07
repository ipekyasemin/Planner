//
//  ToDoListView.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//
import FirebaseFirestoreSwift
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items :[ToDoListItem]
    
    init() {
        do {
            var userId = Auth.auth().currentUser?.uid
            let db = Firestore.firestore()
            
            self._items = FirestoreQuery(collectionPath: "todos/\(userId!)")
            db.collection("todos").document(userId!)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    let source = document.metadata.hasPendingWrites ? "Local" : "Server"
                    print("\(source) data: \(document.data() ?? [:])")
                }
            
            self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId!))
            
        }catch {
            
         }
        
        
    }
    
    
    var body: some View {
        NavigationView {
            VStack{
                List(items){ item in
                    
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("sil"){
                                viewModel.delete(id: item.id)
                            }
                        }
                }
                .listStyle(PlainListStyle())
                
            }.navigationTitle("Görevler")
                .toolbar{
                    Button {
                        viewModel.showinNewItemView = true
                        
                    }label: {
                        Image(systemName: "plus")
                        
                    }
                }
                .sheet(isPresented: $viewModel.showinNewItemView,content:{
                    NewItemView(newItemPresented:$viewModel.showinNewItemView)
                })
        }
        
    }
}
 
