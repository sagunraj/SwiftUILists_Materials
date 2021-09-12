//
//  MovieListView.swift
//  MovieListView
//
//  Created by Sagun Raj Lage on 12/09/2021.
//  Copyright © 2021 Sagun Raj Lage. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
	@Binding var movies: [Movie]
	@Binding var searchText: String

	@Environment(\.isSearching) var isSearching

	var searchResults: [Movie] {
		return movies.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
	}

	var body: some View {
		List {
			if isSearching && !searchText.isEmpty {
				ForEach(searchResults) { movie in
					movieRow(movie: movie)
				}
			} else {
				movieListWithGenres
					.headerProminence(.increased)
			}
		}
	}

	var movieListWithGenres: some View {
		ForEach(Genre.allCases, id: \.self) { genre in
			Section {
				ForEach(movies) { movie in
					if movie.genre == genre {
						movieRow(movie: movie)
					}
				}
			} header: {
				Text(genre.rawValue)
			}
		}
	}

	func movieRow(movie: Movie) -> some View {
		VStack(alignment: .leading) {
			Text("**\(movie.name)**")
			Spacer()
			Text("*\(movie.desc)*")
			Spacer()
			Text("Released on: \(movie.releaseDate.formatted(.dateTime.year().day().month(.wide)))")
		}
		.swipeActions(allowsFullSwipe: true) {
			Button(role: .destructive) {
				movies.removeAll { $0.id == movie.id }
			} label: {
				Label("Delete", systemImage: "trash")
			}
		}
		.listRowSeparator(.visible)
		.listRowSeparatorTint(nil)
	}
}

struct MovieListView_Previews: PreviewProvider {
	static var previews: some View {
		MovieListView(movies: .constant([PreviewMovieGenerator.getPreviewMovie()]), searchText: .constant(""))
	}
}
