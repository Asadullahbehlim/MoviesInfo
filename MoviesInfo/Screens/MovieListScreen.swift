//
//  MovieListScreen.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 26/05/22.
//

import SwiftUI

struct MovieListScreen: View {
    
  @ObservedObject private var movieListVM: MovieListViewModel
    @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            
            TextField.init("Search", text: $movieName) {_ in}
                .onSubmit {
                self.movieListVM.searchByName(movieName)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 10)
                .padding(.vertical, 4)

            Spacer()
                .navigationTitle("Movies")
            
            if movieListVM.loadingState == .success {
                MovieListView(movies: movieListVM.movies)
            }
            else if movieListVM.loadingState == .failed {
                FailedView()
            }
            else if movieListVM.loadingState == .loading {
                LoadingView()
            }
          //  MovieListView(movies: self.movieListVM.movies)
           Spacer()
                
        }
       
        .padding()
        .embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
