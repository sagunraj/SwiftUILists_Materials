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

import Foundation

extension Bundle {
	func decode<T: Decodable>(
		_ type: T.Type,
		from file: String,
		dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .iso8601,
		keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys
	) -> T {
		guard let url = self.url(forResource: file, withExtension: nil) else {
			fatalError("Failed to locate \(file) in bundle.")
		}

		guard let data = try? Data(contentsOf: url) else {
			fatalError("Failed to load \(file) from bundle.")
		}

		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = dateDecodingStrategy
		decoder.keyDecodingStrategy = keyDecodingStrategy

		do {
			return try decoder.decode(T.self, from: data)
		} catch DecodingError.keyNotFound(let key, _) {
			fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)'")
		} catch DecodingError.typeMismatch(_, let context) {
			fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
		} catch let DecodingError.valueNotFound(type, context) {
			fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
		} catch DecodingError.dataCorrupted(_) {
			fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
		} catch {
			fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
		}
	}
}
