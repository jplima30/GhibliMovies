import XCTest
@testable import GhibliMovies

final class GhibliMoviesTests: XCTestCase {
    
    // Colocamos o @MainActor apenas na função de teste
    @MainActor
    func test_loadMovies_shouldPopulateMoviesListWithSuccess() async throws {
        // Arrange: Criamos a ViewModel AQUI DENTRO (o Swift limpa a memória sozinho depois!)
        let sut = MoviesListViewModel(service: MockMovieService())
        
        // Act
        await sut.loadMovies()
        
        // Assert
        if case .success(let filmesBaixados) = sut.state {
            XCTAssertFalse(filmesBaixados.isEmpty, "A lista não deve estar vazia.")
            XCTAssertEqual(filmesBaixados.count, 1)
            XCTAssertEqual(filmesBaixados.first?.title, "Meu Filme de Teste")
        } else {
            XCTFail("O estado falhou ou continuou em loading.")
        }
    }
}
