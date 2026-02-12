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
    
    @Published var films: [Film] = []
    private let service = MovieService()
    
    func loadMovies() async {
        do {
            self.films = try await service.fetchMovies()
        } catch {
            print("Ocorreu um erro: \(error)")
        }
    }
}
