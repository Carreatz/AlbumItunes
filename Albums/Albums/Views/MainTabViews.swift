//
//  MainTabViews.swift
//  Albums
//
//  Created by Consultant on 2/15/23.
//

import SwiftUI

struct MainTabViews: View {
    var body: some View {
        TabView{
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            FavoritesView()
                .tabItem{
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
    }
}

struct MainTabViews_Previews: PreviewProvider {
    static var previews: some View {
        MainTabViews()
    }
}
