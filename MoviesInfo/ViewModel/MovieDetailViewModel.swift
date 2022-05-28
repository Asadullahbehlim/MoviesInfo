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
    
    private var httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil ) {
        self.movieDetail = movieDetail
    }
}
