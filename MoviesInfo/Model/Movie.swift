//
//  Movie.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 25/05/22.
//

import Foundation
struct MovieResponse:Codable{
let movies :[Movie]

private enum CodingKeys:String,CodingKey{
case movies = "Search"
}
}

//Model
struct Movie:Codable{
let title:String
let year:String
let imdbId:String
let poster:String
    
private enum CodingKeys:String,CodingKey{
case title = "Title"
case year = "Year"
case imdbId = "imdbID"
case poster = "Poster"
}
}
