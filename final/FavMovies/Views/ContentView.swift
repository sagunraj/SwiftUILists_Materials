//
//  ContentView.swift
//  ContentView
//
//  Created by Sagun Raj Lage on 12/09/2021.
//  Copyright © 2021 Sagun Raj Lage. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State var movies = Bundle.main.decode([Movie].self, from: "movies.json")
	@State var searchText = ""

	var body: some View {
		NavigationView {
			MovieListView(movies: $movies, searchText: $searchText)
				.navigationTitle("My Favorite Movies")
				.refreshable {
					refreshMovieList()
				}
		}
		.searchable(text: $searchText)
	}

	func refreshMovieList() {
		movies = Bundle.main.decode([Movie].self, from: "more_movies.json")
		+ Bundle.main.decode([Movie].self, from: "movies.json")
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
