//
//  Genre.swift
//  Genre
//
//  Created by Sagun Raj Lage on 12/09/2021.
//  Copyright © 2021 Sagun Raj Lage. All rights reserved.
//

import Foundation

enum Genre: String, CaseIterable, Codable {
	case drama = "Drama"
	case action = "Action"
	case biography = "Biography"
	case western = "Western"
	case sciFi = "Sci-Fi"
	case romance = "Romance"
	case comedy = "Comedy"
}
