//
//  MovieViewModel.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 25/05/22.
//

import Foundation
import SwiftUI

class MovieListViewModel : ObservableObject{
    
  @Published  var movies = [MovieViewModel]()
    let httpClient = HTTPClient()
    
     func searchByName(_ name: String) {
        httpClient.getMoviesBy(search: name) {
            Result in switch
            Result {
            case.success(let movies) :
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                    }
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}


struct MovieViewModel {
    let movie : Movie
    
    var year: String {
        movie.year
        
    }
    var imdbId: String {
        movie.imdbId
    }
    var title: String {
        movie.title
    }
    var poster: String {
        movie.poster
    }
}
