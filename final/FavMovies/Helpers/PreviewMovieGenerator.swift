//
//  PreviewMovieGenerator.swift
//  PreviewMovieGenerator
//
//  Created by Sagun Raj Lage on 12/09/2021.
//  Copyright © 2021 Sagun Raj Lage. All rights reserved.
//

import Foundation

enum PreviewMovieGenerator {
	static func getPreviewMovie() -> Movie {
		return Movie(
			id: 1,
			name: "The Shawshank Redemption",
			desc: "Two imprisoned men bond over a number of years, finding solace & eventual redemption through acts of...",
			releaseDate: getDate(using: "1994-09-10"),
			genre: .drama
		)
	}

	static func getDate(using dateString: String) -> Date {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		dateFormatter.timeZone = TimeZone.current
		dateFormatter.locale = Locale.current
		return dateFormatter.date(from: dateString) ?? Date()
	}
}
