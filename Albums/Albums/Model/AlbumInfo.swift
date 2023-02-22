//
//  AlbumInfo.swift
//  Albums
//
//  Created by Consultant on 2/13/23.
//

import Foundation

// MARK: - Welcome
struct Container: Codable{
    let feed: Feed
}


// MARK: - Feed
struct Feed: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let id: String
    let artistName, name, releaseDate: String
    let artworkUrl100: String
    let genres: [Genre]
}
extension Result { //extension to give format to the release date
    var formattedReleaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: releaseDate) {
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return releaseDate
        }
    }
}

// MARK: - Genre
struct Genre: Codable {
    let genreID: String
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}



