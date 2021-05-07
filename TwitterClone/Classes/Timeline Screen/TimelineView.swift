//
//  TimelineView.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

import SwiftUI

struct TimelineView: View {
	@ObservedObject var postsViewModel: TimelineViewModel
	
	/// State property wrapper
	@State var tweet: String = ""
	
	init() {
		postsViewModel = TimelineViewModel()
		UITableViewCell.appearance().backgroundColor = .white
		UITableView.appearance().backgroundColor = .white
	}
	
	var body: some View {
		NavigationView {
			VStack {
				HStack {
					Image("logo")
				}.padding(.top, 16)
				
				/// Top space line
				Rectangle().frame(height: 0.25).foregroundColor(Color.purpleColor()).padding(.horizontal, 16).padding(.bottom, 4).padding(.top, 12)
				
				/// List which is listening to the posts available in database
				List(postsViewModel.posts) { post in
					HStack {
						Image("avatar")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(height: 44)
						
						VStack(alignment: .leading) {
							HStack{
								Text(post.name).font(.customSemiBold(size: 18))
								Text("@\(post.name.removingWhitespaces().lowercased()) . \(Date(milliseconds :post.dateTime).timeAgo())").font(.customRegular(size: 16)).foregroundColor(Color.greyColor())
							}
							Text(post.message).font(.customRegular(size: 16)).foregroundColor(Color.gray).padding(.top, 5)
						}.listRowBackground(Color.white)
					}
				}.navigationBarHidden(true).listRowBackground(Color.white)
				
				/// Bottom space line
				Rectangle().frame(height: 0.25).foregroundColor(Color.purpleColor()).padding(.horizontal, 16).padding(.bottom, 4)
				
				/// Message filed
				HStack {
					Image("avatar")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(height: 44)
					
					TextField("Tweet you reply", text: $tweet)
						.font(.customRegular(size: 12)).padding(16)
						.keyboardType(.emailAddress)
						.background(Color.whiteBackgroundColor())
						.cornerRadius(40)
					
					Button(action: {
						self.addPost()
						tweet = ""
					}) {
						Image("send")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(height: 32)
							.foregroundColor(Color.init("ButtonColorStart"))
							
					}
				}.padding(.horizontal, 16)
			}
		}.onAppear() {
			self.postsViewModel.get()
		}.navigationBarHidden(true)
	}
	
	func addPost() {
		if !tweet.isEmpty {
			postsViewModel.add(tweet)
		}
	}
}

//struct TimelineView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimelineView()
//    }
//}
