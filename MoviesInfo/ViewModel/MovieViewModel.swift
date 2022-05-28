//
//  MovieViewModel.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 25/05/22.
//

import Foundation
import SwiftUI

class MovieListViewModel : ViewModelBase {
    
  @Published  var movies = [MovieViewModel]()
    let httpClient = HTTPClient()
    
     func searchByName(_ name: String) {
       
         if name.isEmpty {
             self.loadingState = .failed
             return
         }
         
         self.loadingState = .loading
         
         httpClient.getMoviesBy(search: name.trimmedAndEscaped()) {
            Result in switch
            Result {
            case.success(let movies) :
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case.failure(let error):
                
                DispatchQueue.main.async {
                self.loadingState = .failed
                }
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
