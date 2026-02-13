//
//  MovieService.swift
//  GhibliMovies
//
//  Created by Joao Paulo Lima Silva on 12/02/26.
//

import Foundation

enum MovieError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

class MovieService {
    
    private let baseURL = "https://ghibliapi.vercel.app/films"
    
    func fetchMovies() async throws -> [Film] {
        guard let url = URL(string: baseURL) else {
            throw MovieError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw MovieError.invalidResponse
        }
          do {
            let decoder = JSONDecoder()
            let films = try decoder.decode([Film].self, from: data)
            return films
        } catch {
            throw MovieError.decodingError
        }
    }
}
