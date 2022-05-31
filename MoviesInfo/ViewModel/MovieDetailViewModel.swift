//
//  MovieDetailViewModel.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 28/05/22.
//

import Foundation

class MovieDetailViewModel : ObservableObject
{
    private var movieDetail: MovieDetail?
    @Published var loadingState = LoadingState.loading
    
    let httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil ) {
        self.movieDetail = movieDetail
    }
    
    
func getDetailsByImdbId(imdbId: String) {
    httpClient.getMovieDetailsBy(imdbId: imdbId) {
        Result in
        switch Result {
        case .success(let details) :
            DispatchQueue.main.async {
                self.movieDetail = details
                self.loadingState = .success
            }
        case .failure(let error):
            print(error.localizedDescription)
            DispatchQueue.main.async {
                self.loadingState = .failed
            
            
        }
    }
    }
}
    
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    var rating: Int {
        get {
            let ratingDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingDouble ?? 0.0))
        }
    }
    var director: String {
        self.movieDetail?.director ?? ""
    }
}

//    var year: String {
//        self.movieDetail?.year ?? ""
//    }
//    var rated: String {
//        self.movieDetail?.rated ?? ""
//    }
    
//    var director: String {
//        self.movieDetail?.director ?? ""
//    }
//    var actors: String {
//        self.movieDetail?.actors ?? ""
    
 //   var imdbRating: String
    
 //   var imdbId: String


