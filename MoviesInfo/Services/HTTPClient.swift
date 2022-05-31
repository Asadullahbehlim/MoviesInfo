//
//  HTTPClient.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 25/05/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail,NetworkError>) -> Void) {
        
        guard let url = URL.forMoviesByImdbId(imdbId) else {
            return completion(.failure(.badURL))
        }
        URLSession.shared.dataTask(with:url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
            return completion(.failure(.decodingError))
            }
            return completion(.success(movieDetail))
        }.resume()
    }
    
    // @Escaping Closure Runs After Execution of Function
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?,NetworkError>) -> Void) {
       
        guard let url = URL(string: "http://omdbapi.com/?s=\(search)&apikey=\(Constants.API_KEY)") else {
            return completion(.failure(.badURL))
        }
        URLSession.shared.dataTask(with:url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
          
            
            //Decoding Succesfull else decodingError
              guard let movies = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
              return completion(.failure(.decodingError))
              }
            return completion(.success(movies.movies))
            
        }.resume()
}
}



