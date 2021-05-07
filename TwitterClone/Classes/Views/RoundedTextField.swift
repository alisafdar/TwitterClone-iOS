//
//  RoundedTextField.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

import SwiftUI

struct RoundedTextField: View {
	
	var hint: String
	var icon: Image?
	@Binding var email: String
	var body: some View {
		HStack {
			icon
			TextField(hint, text: $email).font(.customRegular(size: 12))
		}.padding(20)
		.keyboardType(.emailAddress)
		.background(Color.white)
		.cornerRadius(40)
		.disableAutocorrection(true)
		.overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.greyColor(), lineWidth: 0.25))
		.padding(.horizontal)
	}
}
