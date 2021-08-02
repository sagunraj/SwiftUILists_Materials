// swiftlint:disable all
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

//import Foundation
//
//enum MovieGenerator {
//	static func getPreviewMovie() -> Movie {
//		return Movie(
//			name: "The Shawshank Redemption",
//			desc: """
//Two imprisoned men bond over a number of years, finding solace \
//and eventual redemption through acts of common decency.
//""",
//			releaseDate: DateHelper.getDate(using: "1994-09-10"),
//			genre: .drama)
//	}
//
//	static func getMovies() -> [Movie] {
//		return [
//			Movie(
//				name: "The Shawshank Redemption",
//				desc: """
//Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.
//""",
//				releaseDate: DateHelper.getDate(using: "1994-09-10"),
//				genre: .drama),
//			Movie(
//				name: "The Godfather",
//				desc: """
//An organized crime dynasty's aging patriarch transfers control of his clandestine empire to his reluctant son.
//""",
//				releaseDate: DateHelper.getDate(using: "1972-03-14"),
//				genre: .drama),
//			Movie(
//				name: "Schindler's List",
//				desc: """
//In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes \
//concerned for his Jewish workforce after witnessing their persecution by the Nazis.
//""",
//				releaseDate: DateHelper.getDate(using: "1993-11-30"),
//				genre: .biography),
//			Movie(
//				name: "The Lord of the Rings - The Return of The King",
//				desc: """
//Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as \
//they approach Mount Doom with the One Ring.
//""",
//				releaseDate: DateHelper.getDate(using: "2003-12-01"),
//				genre: .action),
//			Movie(
//				name: "The Good, the Bad and the Ugly",
//				desc: """
//A bounty hunting scam joins two men in an uneasy alliance against a third in a race to \
//find a fortune in gold buried in a remote cemetery.
//""",
//				releaseDate: DateHelper.getDate(using: "1966-12-23"),
//				genre: .western),
//			Movie(
//				name: "The Lord of the Rings: The Fellowship of the Ring",
//				desc: """
//A meek Hobbit from the Shire and eight companions set out on a journey to destroy the \
//powerful One Ring and save Middle-earth from the Dark Lord Sauron.
//""",
//				releaseDate: DateHelper.getDate(using: "2001-12-10"),
//				genre: .action),
//			Movie(
//				name: "Fight Club",
//				desc: """
//An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.
//""",
//				releaseDate: DateHelper.getDate(using: "1999-09-10"),
//				genre: .drama),
//			Movie(
//				name: "Inception",
//				desc: """
//A thief who steals corporate secrets through the use of dream-sharing technology \
//is given the inverse task of planting an idea into the mind of a C.E.O.
//""",
//				releaseDate: DateHelper.getDate(using: "2010-07-08"),
//				genre: .sciFi),
//			Movie(
//				name: "The Lord of the Rings: The Two Towers",
//				desc: """
//While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, \
//the divided fellowship makes a stand against Sauron's new ally, Saruman, and his hordes of Isengard.
//""",
//				releaseDate: DateHelper.getDate(using: "2002-12-05"),
//				genre: .action),
//			Movie(
//				name: "Star Wars: Episode V - The Empire Strikes Back",
//				desc: """
//After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke \
//Skywalker begins Jedi training with Yoda, while his friends are pursued across the galaxy by Darth Vader \
//and bounty hunter Boba Fett.
//""",
//				releaseDate: DateHelper.getDate(using: "1980-05-17"),
//				genre: .action),
//			Movie(
//				name: "The Intouchables",
//				desc: """
//After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to \
//be his caregiver.
//""",
//				releaseDate: DateHelper.getDate(using: "2011-09-23"),
//				genre: .comedy),
//			Movie(
//				name: "Casablanca",
//				desc: """
//A cynical expatriate American cafe owner struggles to decide whether or not to help his former lover and her \
//fugitive husband escape the Nazis in French Morocco..
//""",
//				releaseDate: DateHelper.getDate(using: "1942-11-26"),
//				genre: .romance)
//		]
//	}
//
//	static func getMoreMovies() -> [Movie] {
//		var newMovies = [
//			Movie(
//				name: "Forrest Gump",
//				desc: """
//The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold \
//from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood \
//sweetheart.
//""",
//				releaseDate: DateHelper.getDate(using: "1994-06-23"),
//				genre: .romance),
//			Movie(
//				name: "The Matrix",
//				desc: """
//When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the \
//life he knows is the elaborate deception of an evil cyber-intelligence.
//""",
//				releaseDate: DateHelper.getDate(using: "1999-03-24"),
//				genre: .sciFi),
//			Movie(
//				name: "Goodfellas",
//				desc: """
//The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob \
//partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.
//""",
//				releaseDate: DateHelper.getDate(using: "1990-09-09"),
//				genre: .biography),
//			Movie(
//				name: "Life Is Beautiful",
//				desc: """
//When an open-minded Jewish librarian and his son become victims of the Holocaust, he uses a perfect mixture of will, \
//humor, and imagination to protect his son from the dangers around their camp.
//""",
//				releaseDate: DateHelper.getDate(using: "1990-09-09"),
//				genre: .comedy)
//		]
//
//		newMovies.append(contentsOf: getMovies())
//		return newMovies
//	}
//}

// swiftlint:enable all
