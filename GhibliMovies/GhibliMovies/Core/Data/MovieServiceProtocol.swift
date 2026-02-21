//
//  MovieServiceProtocol.swift
//  GhibliMovies
//
//  Created by Joao Paulo Lima Silva on 19/02/26.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies() async throws -> [Film]
}
