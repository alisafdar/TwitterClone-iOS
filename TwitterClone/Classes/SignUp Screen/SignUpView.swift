//
//  SignUpView.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

import SwiftUI

struct SignUpView: View {
	@State private var name: String = ""
	@State private var email: String = ""
	@State private var password: String = ""
	@State private var confirmPassword: String = ""
	@State var selection: Int? = nil
	
	/// Sign up Properties
	@ObservedObject var session = SignUpViewModel()
	@State var loading = false
	
	/// State Config
	@State var passwordMismatch:Bool = false
	
	@Binding var showView : Bool
	var body: some View {
		NavigationView {
			VStack(content: {
				Image("logo")
					.padding(.init(top: 30, leading: 0, bottom: 0, trailing: 0))
				
				Text("Create your Account")
					.font(.customBold(size: 24)).foregroundColor(Color.black).padding(.horizontal, 16)
					.padding(.top, 36)
								
				RoundedTextField(hint: "Name", email: $name).padding(.top, 32)
				RoundedTextField(hint: "Email", email: $email).padding(.top, 16)
				PasswordTextField(hint: "Password", passwordMismatch: $passwordMismatch,email: $password).padding(.top, 16)
				PasswordTextField(hint: "Confirm Password", passwordMismatch: $passwordMismatch,email: $confirmPassword).padding(.top, 16)
				
				/// Sign in button
				if loading {
					Text("Loading...").font(.customRegular(size: 16)).padding(.vertical, 16)
				} else {
					/// Navigation Link to Home for Testing purpose
					NavigationLink(
						destination: TimelineView(),
						tag: 1, selection: $selection)  {
						Button(action: {
							self.signUp()
						}) {
							Text("Sign up")
								.fontWeight(.semibold)
								.font(.customSemiBold(size: 16))
								.padding(.horizontal, 64)
								.padding(.vertical, 16)
								.foregroundColor(.white)
								.background(LinearGradient(gradient: Gradient(colors: [.buttonStartColor(), .buttonEndColor()]), startPoint: .topTrailing, endPoint: .bottomLeading))
								.cornerRadius(40)
								.padding(.top, 60)
						}
					}
				}
				
				/// Already have account
				HStack(content: {
					Text("Already have account?").font(.customRegular(size: 16))
					Button(action: {
						self.showView = false
					}, label: {
						Text("Sign in").font(.customSemiBold(size: 16))
					})
				}).foregroundColor(Color.black).padding(.vertical, 16)
				Spacer()
			})
		}.navigationBarHidden(true)
	}
	
	func signUp () {
		if password != confirmPassword {
			passwordMismatch = true
		} else {
			loading = true
			passwordMismatch = false
			session.createUser(email: email, password: password) { (result, error) in
				self.loading = false
				if error != nil {
					self.passwordMismatch = true
				} else {
					self.email = ""
					self.password = ""
					self.selection = 1
				}
			}
		}
	}
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
