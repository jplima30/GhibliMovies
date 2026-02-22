import XCTest
@testable import GhibliMovies

final class GhibliMoviesTests: XCTestCase {
    
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
        
        let mockService = MockMovieService()
        mockService.shouldReturnError = true
        let sut = MoviesListViewModel(service: mockService)
        
        await sut.loadMovies()
        
        if case .error(let mensagemDeErro) = sut.state {
            XCTAssertFalse(mensagemDeErro.isEmpty, "A mensagem de erro não deve estar vazia.")
        } else {
            XCTFail("A ViewModel não entrou no estado de erro como era esperado.")
        }
    }
    
    @MainActor
        func test_initialState_shouldBeLoading() async {
            // Arrange: Criamos o mock e a ViewModel
            let mockService = MockMovieService()
            let sut = MoviesListViewModel(service: mockService)
            
            // Assert: Verificamos o estado ANTES de mandar carregar os filmes
            if case .loading = sut.state {
                // Se entrar aqui, o teste passa porque começou em loading!
                XCTAssertTrue(true)
            } else {
                XCTFail("A ViewModel não começou no estado .loading como era esperado.")
            }
        }
}
