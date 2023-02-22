//
//  CellView.swift
//  Albums
//
//  Created by Consultant on 2/13/23.
//

import SwiftUI

struct CellView: View {
    let viewModel: AlbumViewModel
    let album: Result
    @State private var isFavorite = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    AsyncImage(url: URL(string: album.artworkUrl100) ) { image in
                        image //manipulates the image
                        .resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .padding([.top, .leading, .trailing])
                    Text(album.name.capitalized)
                        .scaledToFit()
                    Text("By")
                        .foregroundColor(.black)
                    Text(album.artistName.capitalized)
                        .padding(.bottom)
                    Button(action: {
                        if viewModel.alreadyIsFavorite(result: album) {
                            viewModel.removeFromFavorites(result: album)
                        } else {
                            viewModel.addToFavorites(result: album)
                        }
                        self.isFavorite = viewModel.alreadyIsFavorite(result: album)
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .white)
                    }
                    .onAppear{
                        isFavorite = viewModel.alreadyIsFavorite(result: album)
                    }
                    .padding(10)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Circle())
                }
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(30)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}



struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(viewModel: AlbumViewModel(), album: Result(id: "", artistName: "Duros ", name: "Pelos", releaseDate: "12/10/1989", artworkUrl100: "img", genres: []))
    }
}
