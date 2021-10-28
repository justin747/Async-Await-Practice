//
//  ContentView.swift
//  Async Await Practice
//
//  Created by Justin747 on 10/20/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = CharacterViewModel(
        service: CharacterService()
    )
    
    var body: some View {
        
        NavigationView {
            
            switch vm.state {
                
            case .success(let data):
                List {
                    ForEach(data,
                            id: \.id) { item in
                        Text(item.name)
                    }
                }
                .navigationBarTitle("Characters")
            case .loading:
                ProgressView()
            default:
                EmptyView()
            }
            
        }
        .task {
            await vm.getCharacters()
        }
        .alert("Error",
               isPresented: $vm.hasError,
               presenting: vm.state) { detail in
            
            Button("Retry") {
                Task {
                    await vm.getCharacters()
                }
            }
        } message: { detail in
            
            if case let .failed(error) = detail {
                
                Text(error.localizedDescription)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

