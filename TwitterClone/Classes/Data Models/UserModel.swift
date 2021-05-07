//
//  UserModel.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

class UserModel {
	var uid: String
	var email: String?
	var displayName: String?
	
	init(uid: String, displayName: String?, email: String?) {
		self.uid = uid
		self.email = email
		self.displayName = displayName
	}
	
}
