//
//  MovieCardView.swift
//  GhibliMovies
//
//  Created by Joao Paulo Lima Silva on 13/02/26.
//

import SwiftUI

struct MovieCardView: View {

    let movie: Film
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: movie.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            .frame(height: 200)
            .cornerRadius(12)
            
            Text(movie.title)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        
    }
}

#Preview {
    MovieCardView(movie: Film(
                              id: "1",
                              title: "Castle in the Sky",
                              originalTitle: "Tenkū no Shiro Rapyuta",
                              image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
                              movieBanner: "https://image.tmdb.org/t/p/original/3cyjYtLWCBE1uvWINHFsFnE8LWy.jpg",
                              description: "A young boy and a girl with a magic crystal must race against pirates and foreign agents in a search for a legendary floating castle.",
                              director: "Hayao Miyazaki",
                              producer: "Isao Takahata",
                              releaseDate: "1986",
                              runningTime: "124",
                              rtScore: "95"
                             ))
}
