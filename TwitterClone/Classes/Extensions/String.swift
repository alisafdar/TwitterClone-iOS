//
//  String.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

extension String {
	func removingWhitespaces() -> String {
		return components(separatedBy: .whitespaces).joined()
	}
}
