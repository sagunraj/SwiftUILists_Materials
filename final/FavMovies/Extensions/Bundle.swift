//
//  Bundle.swift
//  Bundle
//
//  Created by Sagun Raj Lage on 12/09/2021.
//  Copyright © 2021 Sagun Raj Lage. All rights reserved.
//

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
