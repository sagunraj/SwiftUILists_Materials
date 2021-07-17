/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI


struct MovieList: View {
	@Binding var movies: [Movie]
	@Binding var searchText: String

	let wideMonthStyle = Date.FormatStyle.Symbol.Month.wide

	@Environment(\.isSearching) var isSearching

	var searchResults: [Movie] {
		if isSearching && !searchText.isEmpty {
			return movies.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
		} else {
			return movies
		}
	}

	var body: some View {
		List {
			if isSearching && !searchText.isEmpty {
				ForEach(searchResults) { movie in
					VStack(alignment: .leading) {
						Text("**\(movie.name)**")
						Spacer()
						Text("*\(movie.desc)*")
						Spacer()
						Text("Released on: \(movie.releaseDate.formatted(.dateTime.year().day().month(wideMonthStyle)))")
					}
				}
			} else {
				MovieListRow(searchResults: $movies)
			}
		}
	}
}

struct MovieRow_Previews: PreviewProvider {
	static var previews: some View {
		MovieList(movies: .constant([MovieGenerator.getPreviewMovie()]), searchText: .constant(""))
	}
}

struct MovieDetailsView: View {
	let wideMonthStyle = Date.FormatStyle.Symbol.Month.wide

	@Binding var movie: Movie
	var body: some View {
		VStack(alignment: .leading) {
			Text("**\($movie.name.wrappedValue)**")
			Spacer()
			Text("*\($movie.desc.wrappedValue)*")
			Spacer()
			Text("Released on: \($movie.releaseDate.wrappedValue.formatted(.dateTime.year().day().month(wideMonthStyle)))")
		}
	}
}

struct MovieListRow: View {
	@Binding var searchResults: [Movie]
	var body: some View {
		ForEach(Genre.allCases, id: \.self) { genre in
			Section {
				ForEach($searchResults) { $movie in
					if $movie.genre.wrappedValue == genre {
						MovieDetailsView(movie: $movie)
					}
				}
			} header: {
				Text(genre.rawValue)
			}
		}.headerProminence(.increased)
	}
}
