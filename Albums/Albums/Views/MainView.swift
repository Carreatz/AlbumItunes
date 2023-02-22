//
//  MainView.swift
//  Albums
//
//  Created by Consultant on 2/13/23.
//

import SwiftUI

struct MainView: View {
    private var gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = AlbumViewModel()
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    if let albums = viewModel.album {
                        LazyVGrid(columns: gridItems) {
                            ForEach(albums.results) { album in
                                NavigationLink {
                                AlbumNavView(album: album)
                                } label: {
                                    CellView(viewModel: viewModel, album: album)
                                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                                }
                            }
                        }
                        .navigationTitle("Albums")
                    }
                }
                .background(Color.cyan)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
