//
//  MoviesListView.swift
//  GhibliMovies
//
//  Created by Joao Paulo Lima Silva on 12/02/26.
//

import SwiftUI

struct MoviesListView: View {
    
    @StateObject var viewModel = MoviesListViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.films) { film in
                        MovieCardView(movie: film)
                        
                    }
                    .navigationTitle("Ghibli Movies")
                    .padding()
                }
            }
            .task {
                await viewModel.loadMovies()
            }
            
        }
    }
}

#Preview {
    MoviesListView()
}
