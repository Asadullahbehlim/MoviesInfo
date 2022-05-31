
//
//  MovieDetailScreen.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 30/05/22.
//

import SwiftUI

struct MovieDetailScreen: View {
    let imdbId: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    
    var body: some View {
        VStack{
            if movieDetailVM.loadingState == .loading {
                LoadingView()
            }
            else if movieDetailVM.loadingState == .success {
             //  MovieDetailView(movieDetail: movieDetailVM)
                MovieDetailView(movieDetail: movieDetailVM)
                
            }
            else if movieDetailVM.loadingState == .failed {
                FailedView()
            }
            
        }
        .onAppear {
            self.movieDetailVM.getDetailsByImdbId(imdbId: self.imdbId)
        }
    }
}

struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen(imdbId: "tt1204829")
    }
}
