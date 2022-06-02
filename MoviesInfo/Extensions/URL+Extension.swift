//
//  URL+Extension.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 26/05/22.
//

import Foundation

extension URL {
    
    static func forMoviesByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "http://omdbapi.com/?i=\(imdbId)&apikey=\(Constants.API_KEY)")
    }
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "http://omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
}
