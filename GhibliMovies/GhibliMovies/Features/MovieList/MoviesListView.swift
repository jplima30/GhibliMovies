import SwiftUI

struct MoviesListView: View {
    @StateObject var viewModel = MoviesListViewModel(service: MovieService())
    
    
    let columns = [GridItem(.flexible(), spacing: 2), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                        .controlSize(.large)
                    
                case .success(let films):
                    if films.isEmpty {
                        Text("Nenhum filme encontrado")
                            .font(.headline)
                    } else {
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(films) { film in
                                    NavigationLink(destination: MovieDetailView(movie: film)) {
                                        MovieCardView(movie: film)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                                .padding(.horizontal, 12)
                                .padding(.top, 20)
                            }
                        }
                        .refreshable {
                            await viewModel.loadMovies()
                        }
                    }
                    
                case .error(let message):
                    VStack(spacing: 20) {
                        Text(message)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                        Button(action: {
                            Task {
                                await viewModel.loadMovies()
                            }
                        }) {
                            Label("Tentar Novamente", systemImage: "arrow.clockwise")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                }
            }
            .navigationTitle("Ghibli Movies")
            .onAppear {
                Task { await viewModel.loadMovies() }
            }
        }
    }
}

#Preview {
    MoviesListView()
}
