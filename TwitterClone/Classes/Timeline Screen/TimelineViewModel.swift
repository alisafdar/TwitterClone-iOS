//
//  TimelineViewModel.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

import Combine
import FirebaseFirestore

class TimelineViewModel: ObservableObject {
	
	/// This field defines the path of posts in Firestore Database
	private let path: String = "messages"
	
	/// Firestore Instance
	private let store = Firestore.firestore()
	
	@Published var posts: [TweetModel] = []
	
	func get() {
		store.collection(path).order(by: "dateTime", descending: false).addSnapshotListener { (querySnapshot, error) in
			guard let documents = querySnapshot?.documents else {
				return
			}
			
			self.posts = documents.map { (queryDocumentSnapshot) -> TweetModel in
				let data = queryDocumentSnapshot.data()
				let id = data["id"] as? String ?? ""
				let name = data["name"] as? String ?? ""
				let message = data["message"] as? String ?? ""
				let dateTime = data["dateTime"] as? Int64 ?? 0
				return TweetModel(id: id, name: name, message: message, dateTime: dateTime)
			}
		}
	}
	
	func add(_ message: String) {
		let ref = store.collection(path)
		let docId = ref.document().documentID
		
		let data: [String: Any] = ["id": docId, "name": "Ali Safdar", "message": message, "dateTime" : Date().millisecondsSince1970]
		ref.addDocument(data: data)
	}
}

