//
//  TweetModel.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//
import Foundation
struct TweetModel: Identifiable {
	var id: String = UUID().uuidString
	var name: String
	var message: String
	var dateTime :Int64
}
