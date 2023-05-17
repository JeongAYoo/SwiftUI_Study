//
//  MainView.swift
//  SwiftUI_Study
//
//  Created by Jade Yoo on 2023/05/17.
//

import SwiftUI
import Kingfisher

struct URLImage: View {
    let posterPath: String
    
    var body: some View {
        KFImage(URL(string: Endpoint.posterURL + posterPath)!)
            .placeholder { _ in
                ProgressView()
            }
            .resizable()
            .scaledToFill()
            .frame(height: 170)
            .cornerRadius(8)
            .padding(5)
    }
}

struct MainView: View {
    @StateObject var viewModel = MovieViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.movieData, id: \.self.id) { movie in
                        VStack(alignment: .center, spacing: 5) {
                            URLImage(posterPath: movie.poster_path)
                            Text(movie.title)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                            Text(movie.release_date)
                                .font(.subheadline)
                                .fontWeight(.light)
                            Text(String(format: "평점: %.1f", movie.vote_average))
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }.padding(3)
                    }
                }.task {
                    viewModel.fetchMovieData()
                }
            }
            .navigationBarTitle("Boxoffice", displayMode: .inline)
            .toolbar {
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person.crop.circle")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
