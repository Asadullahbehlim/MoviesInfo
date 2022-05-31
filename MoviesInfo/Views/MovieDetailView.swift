//
//  MovieDetailView.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 31/05/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetail : MovieDetailViewModel
    
    var body: some View {

        VStack {
        Text(movieDetail.title)
        
        Text(movieDetail.plot)
        
        Text(movieDetail.director)
        
        Text(movieDetail.poster)
        
        Text("\(movieDetail.rating)")
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieDetail: MovieDetailViewModel(movieDetail:MovieDetail(title: "The Racing Brothers, Lets & Go", year:"1996–1997", rated: "TV-PG", plot:"Two competitive brothers, Go and Retsu, meet a man named Dr. Tsuchiya who gives them two cars and tells them to enter the Mini 4WD competition.", director: "N/A", actors: "Ikue Ôtani, Hidenari Ugaki, Masako Katsuki", imdbRating: "7.0", poster: "https://m.media-amazon.com/images/M/MV5BNzcxOGViMjMtNTQ0ZC00ZjJmLWE2MzktN2E4NmU0YjkzM2IxXkEyXkFqcGdeQXVyMTEwNDU1MzEy._V1_SX300.jpg", imdbId: "tt1204829")))
    }
}
