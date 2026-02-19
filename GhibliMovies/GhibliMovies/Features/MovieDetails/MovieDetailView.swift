//
//  MovieDetailView.swift
//  GhibliMovies
//
//  Created by Joao Paulo Lima Silva on 15/02/26.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Film
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                AsyncImage(url: URL(string: movie.movieBanner)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 250)
                .clipped()
                VStack(alignment: .leading, spacing: 12) {
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                    Text(movie.originalTitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    HStack {
                        Text("\(movie.rtScore)%")
                        Divider().frame(height: 20)
                        Text(movie.releaseDate)
                        Divider().frame(height: 20)
                        Text("\(movie.runningTime) min")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Text("Sinopse")
                        .font(.title3)
                        .bold()
                        .padding(.top, 8)
                    Text(movie.description)
                        .font(.body)
                    Text("Diretor")
                        .font(.title3)
                        .bold()
                        .padding(.top, 8)
                    Text(movie.director)
                        .font(.body)
                    Text("Producer")
                        .font(.title3)
                        .bold()
                        .padding(.top, 8)
                    Text(movie.producer)
                        .font(.body)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    MovieDetailView(movie: Film (
        id: "1",
        title: "Castle in the Sky",
        originalTitle: "天空の城ラピュ",
        image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
        movieBanner:"https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg",
        description: "Sinopse de teste",
        director: "Hayao Miyazaki",
        producer: "Isao Takahata",
        releaseDate: "1986",
        runningTime: "124",
        rtScore: "95"
    ))
}
