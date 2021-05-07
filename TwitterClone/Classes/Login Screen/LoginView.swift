//
//  LoginView.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

import SwiftUI

struct LoginView: View {
	@State private var email: String = "ali@gmail.com"
	@State private var password: String = "Test@1234"
	@State var selection: Int? = nil
	@State var showView = false
	
	/// Login Properties
	@EnvironmentObject var session: LoginViewModel
	@State var loading = false
	@State var error = false
	
	var body: some View {
		NavigationView {
			VStack(content: {
				/// App icon
				Image("logo")
					.padding(.init(top: 30, leading: 0, bottom: 0, trailing: 0))
				
				Text("Sign in to your Account")
					.font(.customBold(size: 24))
					.foregroundColor(Color.black)
					.padding(.horizontal, 16)
					.padding(.top, 36)
				
				/// Email field
				RoundedTextField(hint: "Email", icon: Image("email"),email: $email)					
					.padding(.top, 32)
				
				/// Password field
				SecureTextField(hint: "Password", icon: Image("password"), email: $password)
					.padding(.top, 16)
				
				if loading {
					Text("Loading...").font(.customRegular(size: 16))
						.padding(.vertical, 16)
				} else {
					/// Navigation Link to Home for Testing purpose
					NavigationLink(
						destination: TimelineView(),
						tag: 1, selection: $selection)  {
						Button(action: {
							self.signIn()
						}) {
							Text("Sign in")
								.fontWeight(.semibold)
								.font(.customSemiBold(size: 16))
								.padding(.horizontal, 64)
								.padding(.vertical, 16)
								.foregroundColor(.white)
								.background(LinearGradient(gradient: Gradient(colors: [.buttonStartColor(), .buttonEndColor()]),
												   startPoint: .topTrailing,
												   endPoint: .bottomLeading))
								.cornerRadius(40)
								.padding(.top, 60)
						}
					}
				}
				
				HStack(content: {
					Text("Don't have a teamio account yet?")
						.font(.customRegular(size: 16))
					NavigationLink(
						destination: SignUpView(showView: self.$showView),
						isActive: self.$showView,
						label: {
							Text("Signup")
								.bold()
								.font(.customBold(size: 16))
								.foregroundColor(Color.black)
						})
				}).padding(.vertical, 16)
				Spacer()
			})
		}.navigationBarHidden(true)
	}
	
	func signIn () {
		loading = true
		error = false
		session.login(email: email, password: password) { (result, error) in
			self.loading = false
			if error != nil {
				self.error = true
			} else {
				self.email = ""
				self.password = ""
				self.selection = 1
			}
		}
	}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
