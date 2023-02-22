//
//  ContentView.swift
//  Albums
//
//  Created by Consultant on 2/9/23.
//

import SwiftUI
import CoreData

struct FavoritesView: View {
    @ObservedObject var viewModel = AlbumViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.favorites) { album in
                    NavigationLink {
                        //
                        Text("Item at \(album.name ?? "")")
                    } label: {
                        Text(album.name ?? "")
                    }
                }
            }
            .navigationTitle("Favorites")
        }
        .onAppear {
            viewModel.fetchFavorites()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

//checar en base de datos si la funcion esta guardado "cuando le pique a uno, ya se quede guardado"
//
