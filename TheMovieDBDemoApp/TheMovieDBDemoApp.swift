// TheMovieDBDemoApp.swift by Gokhan Mutlu on 31.03.2022

import SwiftUI
import Firebase

@main
struct TheMovieDBDemoApp: App {
	var body: some Scene {
		WindowGroup {
			MovieListView()
		}
	}
	
	
	init() {
		navigationBarSetup()
		
		#warning("Firebase Analytics and Crashlytics are added for demonstration of Cocapods use.")
		//FirebaseApp.configure()
	}
	
	
	fileprivate func navigationBarSetup() {
		// this is not the same as manipulating the proxy directly
		let appearance = UINavigationBarAppearance()
		
		// this overrides everything you have set up earlier.
		appearance.configureWithTransparentBackground()
		
		// this only applies to small titles
		appearance.titleTextAttributes = [
			.font : UIFont.systemFont(ofSize: 15, weight: .bold),
			NSAttributedString.Key.foregroundColor : UIColor.black]
		
		//In the following two lines you make sure that you apply the style for good
		UINavigationBar.appearance().scrollEdgeAppearance = appearance
		UINavigationBar.appearance().standardAppearance = appearance
		
		// This property is not present on the UINavigationBarAppearance
		// object for some reason and you have to leave it til the end
		UINavigationBar.appearance().tintColor = UIColor.black
		UINavigationBar.appearance().backgroundColor = .white
	}
	
}
