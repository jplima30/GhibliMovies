//
//  MoviesListViewModel.swift
//  GhibliMovies
//
//  Created by Joao Paulo Lima Silva on 12/02/26.
//

import Foundation
import Combine

@MainActor
class MoviesListViewModel: ObservableObject {
    
    enum ViewState {
        case loading
        case success([Film])
        case error(String)
        
    }
    
    @Published var state: ViewState = .loading
    private let service = MovieService()
    
    func loadMovies() async {
        self.state = .loading
        do {
            let movies = try await service.fetchMovies()
            self.state = .success(movies)
        } catch {
            self.state = .error(error.localizedDescription)
            
        }
    }
}



