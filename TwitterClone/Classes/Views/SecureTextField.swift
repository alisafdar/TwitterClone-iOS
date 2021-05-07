//
//  SecureTextField.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

import SwiftUI

struct SecureTextField: View {
	
	var hint: String
	var icon: Image
	@Binding var email: String
	var body: some View {
		HStack {
			icon
			SecureField(hint, text: $email).font(.customRegular(size: 12))
		}.padding(20)
		.keyboardType(.default)
		.background(Color.white)
		.cornerRadius(40)
		.overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.purpleColor(), lineWidth: 0.25))
		.padding(.horizontal)
	}
}

struct PasswordTextField: View {
	var hint: String
	@Binding var passwordMismatch: Bool
	@Binding var email: String
	var body: some View {
		SecureField(hint, text: $email)
			.font(.customRegular(size: 12)).padding(20)
			.keyboardType(.emailAddress)
			.background(Color.white)
			.cornerRadius(40)
			.overlay(
				RoundedRectangle(cornerRadius: 40)
					.stroke(passwordMismatch ? Color.red : Color.greyColor(), lineWidth: 0.25)).padding(.horizontal)
		
	}
}
