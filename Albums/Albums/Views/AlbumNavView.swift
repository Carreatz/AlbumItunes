//
//  NavigationView.swift
//  Albums
//
//  Created by Consultant on 2/14/23.
//

import SwiftUI

struct AlbumNavView: View {
    
    @ObservedObject var viewModel = AlbumViewModel()
    let album: Result
    
    var body: some View {
        AsyncImage(url: URL(string: album.artworkUrl100))
        VStack {
            Text(album.artistName.capitalized)
            Text(album.name.capitalized)
            Text(album.formattedReleaseDate.capitalized)
            HStack {
                ForEach (0..<(album.genres.count), id: \.self) { index in
                    Text("\(album.genres[index].name)".capitalized)
                }
            }
        }
    }
}


struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumNavView(album: Result(id: "", artistName: "Peloz", name: "duros", releaseDate: "12/10/17", artworkUrl100: "", genres: []))
    }
}

//crear el boton de la estrella (favorito)
//crear arreglo vacio para guardar la informacion





//sqlite
