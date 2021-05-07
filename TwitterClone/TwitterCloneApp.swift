//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Ali Safdar on 06/05/2021.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
	init() {		
		FirebaseApp.configure()
	}

    var body: some Scene {
        WindowGroup {
			LoginView().preferredColorScheme(.light).environmentObject(LoginViewModel())			
        }
    }
}
