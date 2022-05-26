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
            URLImage(url: movie.poster)
                .scaledToFill()
                .frame(width: 120, height: 120, alignment: .top)
                .cornerRadius(12)
                .shadow(color:.black.opacity(0.5), radius: 3, x: 3, y: 3)
            
            VStack(alignment: .leading, spacing: 10) {
                Text((movie.title))
                    .font(.headline)
                
                Text(movie.year)
                    .font(.headline)
                    .opacity(0.5)
                    .padding(.top, 5)
            }.padding(5)
            Spacer()
        }.containerShape(Rectangle())
    }
}

