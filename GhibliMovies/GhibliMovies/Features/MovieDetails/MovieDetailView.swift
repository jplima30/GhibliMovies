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
            // Esta VStack NÃO tem padding lateral para o banner encostar nas bordas! 🖼️
            VStack(alignment: .leading, spacing: 20) {
                
                // 1. Banner (Ocupa a largura total)
                AsyncImage(url: URL(string: movie.movieBanner)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 250)
                .clipped()

                // 2. Grupo de Conteúdo (Aqui aplicamos o padding para TODOS os textos) 📝
                VStack(alignment: .leading, spacing: 12) {
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(movie.originalTitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    // Agora a HStack técnica está no mesmo grupo e terá o mesmo alinhamento! 📊
                    HStack {
                        Text("\(movie.rtScore)%")
                        Divider().frame(height: 20)
                        Text(movie.releaseDate)
                        Divider().frame(height: 20)
                        Text("\(movie.runningTime) min")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal) // O "segredo" está aqui: só este bloco tem margem! 👈
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
