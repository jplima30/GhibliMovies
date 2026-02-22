import Foundation
@testable import GhibliMovies

// Usamos uma "class" em vez de "struct" para podermos alterar a variável facilmente nos testes
class MockMovieService: MovieServiceProtocol {
    
    // 1. O nosso interruptor (começa desligado)
    var shouldReturnError = false
    
    // 2. Um erro genérico do sistema para simularmos falha de rede
    let mockError = URLError(.notConnectedToInternet)

    func fetchMovies() async throws -> [Film] {
        
        // 3. Verificamos se o interruptor está ligado
        if shouldReturnError {
            throw mockError
        }
        
        // 4. Se não houver erro, devolvemos a lista com o filme de teste (o seu código atual)
        let filmTest = Film(
            id: "123", title: "Meu Filme de Teste", originalTitle: "Test Movie",
            image: "", movieBanner: "", description: "Um filme criado apenas para testes.",
            director: "João Paulo", producer: "Estúdio Ghibli Mock",
            releaseDate: "2026", runningTime: "120", rtScore: "100"
        )
        return [filmTest]
    }
}
