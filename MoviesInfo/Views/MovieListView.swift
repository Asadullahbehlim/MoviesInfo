//
//  MovieListView.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 26/05/22.
//

import SwiftUI

struct MovieListView: View {
    let movies: [MovieViewModel]
    var body: some View {
        List(self.movies, id: \.imdbId) {
           movie in
            //Text(movie.title)
            
            ExtractedView(movie: movie)
        }
    }
}

struct ExtractedView: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top){
            NavigationLink (destination: MovieDetailScreen(imdbId: movie.imdbId)) {
                URLImage(url: movie.poster)
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .top)
                    .cornerRadius(12)
                    .shadow(color:.black.opacity(0.5), radius: 3, x: 3, y: 3)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text((movie.title))
                        .font(.headline)
                    
                    Text(movie.year)
                        .font(.headline)
                        .opacity(0.5)
                        .padding(.top, 5)
                }.padding(5)
              //  Spacer()
            }
            
        }.containerShape(Rectangle())
    }
}

