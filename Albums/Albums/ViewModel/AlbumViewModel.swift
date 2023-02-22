//
//  AlbumViewModel.swift
//  Albums
//
//  Created by Consultant on 2/13/23.
//

import SwiftUI
import CoreData

class AlbumViewModel: ObservableObject {
    var container: NSPersistentContainer = PersistenceController.shared.container
    @Published var album: Feed?
    @Published var favorites: [Album] = []
    let baseUrl = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json"
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let album = try JSONDecoder().decode(Container.self, from: data)
                DispatchQueue.main.async {
                    self.album = album.feed
                }
            }
            catch {
                print("Error: \(error)")
            }
        }.resume()
    }
    
    func fetchFavorites() {
        let fetchRequest = Album.fetchRequest()
        do {
            favorites = try container.viewContext.fetch(fetchRequest)
        } catch {
            print("Fetch favorites error: \(error)")
        }
    }
    
    func addToFavorites(result: Result) {
        let album: Album = Album(context: container.viewContext)
        album.id = result.id
        album.name = result.name
        album.artistName = result.artistName
        // Agrega mas parametros - Opcional
        
        do {
            try container.viewContext.save()
            print("Album saved")
        } catch {
            print("Error en guardado: \(error)")
        }
    }
    
    func removeFromFavorites(result: Result) {
        let fetchRequest = Album.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(result.id)")
        
        do {
            try container.viewContext.fetch(fetchRequest).forEach(container.viewContext.delete)
        } catch {
            print("Error en eliminado: \(error)")
        }
    }
    
    func alreadyIsFavorite(result: Result) -> Bool {
        let fetchRequest = Album.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(result.id)")
        do {
            let count = try container.viewContext.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Error en eliminado: \(error)")
        }
        return false
      }
}
