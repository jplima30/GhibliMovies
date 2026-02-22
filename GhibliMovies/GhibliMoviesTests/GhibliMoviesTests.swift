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
    
    @MainActor
    func test_loadMovies_shouldChangeStateToError() async {
        // Arrange: Configuramos o mock para forçar uma falha
        let mockService = MockMovieService()
        mockService.shouldReturnError = true
        let sut = MoviesListViewModel(service: mockService)
        
        // Act: Tentamos carregar os filmes
        await sut.loadMovies()
        
        // Assert: Verificamos se o estado mudou para erro e se temos uma mensagem
        if case .error(let mensagemDeErro) = sut.state {
            XCTAssertFalse(mensagemDeErro.isEmpty, "A mensagem de erro não deve estar vazia.")
        } else {
            XCTFail("A ViewModel não entrou no estado de erro como era esperado.")
        }
    }
    
    
    
}
