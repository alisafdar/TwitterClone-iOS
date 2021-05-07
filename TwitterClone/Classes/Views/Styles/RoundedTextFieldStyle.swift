//
//  RoundedTextFieldStyle.swift
//  TwitterClone
//
//  Created by Ali Safdar on 07/05/2021.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding(25)
			.background(Color.white)
			.cornerRadius(50)
			.overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.greyColor(), lineWidth: 0.25))
	}
}


