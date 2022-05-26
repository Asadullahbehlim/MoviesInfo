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
    
    // @Escaping Closure Runs After Execution of Function
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?,NetworkError>) -> Void) {
       
        guard let url = URL(string: "http://omdbapi.com/?s=\(search)&apikey=\(Constants.API_KEY)") else {
            return completion(.failure(.badURL))
        }
        URLSession.shared.dataTask(with:url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            //   completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
            
            
            //Decoding Succesfull else decodingError
              guard let movies = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
              return completion(.failure(.decodingError))
              }
            return completion(.success(movies.movies))
        }.resume()
}
}
