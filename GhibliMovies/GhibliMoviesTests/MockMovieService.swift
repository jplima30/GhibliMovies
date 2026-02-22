//
//  MockMovieService.swift
//  GhibliMoviesTests
//
//  Created by Joao Paulo Lima Silva on 20/02/26.
//

import Foundation
@testable import GhibliMovies

struct MockMovieService: MovieServiceProtocol {
    func fetchMovies() async throws -> [Film] {
        let filmTest = Film(
                    id: "123",
                    title: "Meu Filme de Teste",
                    originalTitle: "Test Movie",
                    image: "",
                    movieBanner: "",
                    description: "Um filme criado apenas para testes.",
                    director: "João Paulo",
                    producer: "Estúdio Ghibli Mock",
                    releaseDate: "2026",
                    runningTime: "120",
                    rtScore: "100"
                )
                
                return [filmTest]
    }
}
