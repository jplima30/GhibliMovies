//
//  Film.swift
//  GhibliMovies
//
//  Created by Joao Paulo Lima Silva on 11/02/26.
//

import Foundation

import Foundation

struct Film: Codable, Identifiable {
    let id: String
    let title: String
    let originalTitle: String
    let image: URL
    let movieBanner: URL
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
    let runningTime: String
    let rtScore: String

    enum CodingKeys: String, CodingKey {
        case id, title, image, description, director, producer
        
                case originalTitle = "original_title"
                case movieBanner = "movie_banner"
                case releaseDate = "release_date"
                case runningTime = "running_time"
                case rtScore = "rt_score"
    }
}
