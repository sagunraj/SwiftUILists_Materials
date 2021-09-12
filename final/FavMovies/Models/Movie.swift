//
//  Movie.swift
//  Movie
//
//  Created by Sagun Raj Lage on 12/09/2021.
//  Copyright © 2021 Sagun Raj Lage. All rights reserved.
//

import Foundation

struct Movie: Identifiable, Codable {
	var id: Int
  var name: String
  var desc: String
  var releaseDate: Date
	var genre: Genre
}
