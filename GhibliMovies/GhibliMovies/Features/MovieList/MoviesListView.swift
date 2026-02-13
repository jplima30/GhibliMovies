//
//  MoviesListView.swift
//  GhibliMovies
//
//  Created by Joao Paulo Lima Silva on 12/02/26.
//

import SwiftUI

struct MoviesListView: View {
    
    @StateObject var viewModel = MoviesListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.films) { film in
                Text(film.title)
            }
            .navigationTitle("Ghibli Movies")
            .task {
                await viewModel.loadMovies()
            }
        }
    }
}

#Preview {
    MoviesListView()
}
