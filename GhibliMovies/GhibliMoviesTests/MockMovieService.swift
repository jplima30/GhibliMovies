import Foundation
@testable import GhibliMovies

// Usamos uma "class" em vez de "struct" para podermos alterar a variável facilmente nos testes
class MockMovieService: MovieServiceProtocol {
    
    var shouldReturnError = false
    
    let mockError = URLError(.notConnectedToInternet)

    func fetchMovies() async throws -> [Film] {
        
        if shouldReturnError {
            throw mockError
        }
        
        let filmTest = Film(
            id: "123", title: "Meu Filme de Teste", originalTitle: "Test Movie",
            image: "", movieBanner: "", description: "Um filme criado apenas para testes.",
            director: "João Paulo", producer: "Estúdio Ghibli Mock",
            releaseDate: "2026", runningTime: "120", rtScore: "100"
        )
        return [filmTest]
    }
}
