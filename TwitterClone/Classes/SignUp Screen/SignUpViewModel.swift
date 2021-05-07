//
//  SignUpViewModel.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

import SwiftUI
import Combine
import FirebaseAuth

class SignUpViewModel : ObservableObject {
	var didChange = PassthroughSubject<SignUpViewModel, Never>()
	var session: UserModel? { didSet { self.didChange.send(self) }}
	var handle: AuthStateDidChangeListenerHandle?
	
	func listen () {
		handle = Auth.auth().addStateDidChangeListener { (auth, user) in
			if let user = user {
				self.session = UserModel(
					uid: user.uid,
					displayName: user.displayName, email: user.email
				)
			} else {
				self.session = nil
			}
		}
	}
	
	func createUser(email: String, password: String, handler: @escaping AuthDataResultCallback) {
		Auth.auth().createUser(withEmail: email, password: password, completion: handler)
	}
	
	func login(email: String, password: String, handler: @escaping AuthDataResultCallback) {
		Auth.auth().signIn(withEmail: email, password: password, completion: handler)
	}
	
	func logout () -> Bool {
		do {
			try Auth.auth().signOut()
			self.session = nil
			return true
		} catch {
			return false
		}
	}
	
	func removeListener () {
		if let handle = handle {
			Auth.auth().removeStateDidChangeListener(handle)
		}
	}
}
