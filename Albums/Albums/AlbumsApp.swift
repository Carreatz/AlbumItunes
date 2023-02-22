//
//  AlbumsApp.swift
//  Albums
//
//  Created by Consultant on 2/9/23.
//

import SwiftUI

@main
struct AlbumsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainTabViews()
                }
    }
}
