// ContentView.swift by Gokhan Mutlu on 31.03.2022

import SwiftUI

struct ContentView: View {
	
	/*
	 
	 //TEST
	 
	 init(){
		let service = TMDBService(session: URLSession.shared)
		service.getUpcomingMovies(by: 1) { result in
			switch result{
				case .success(let jsonResponse):
					for movie in jsonResponse.results{
						print(movie)
					}
				case .failure(let apiError):
					print(apiError.localizedDescription)
			}
		}
		
	}*/
	
    var body: some View {
		VStack {
			Text("Hello, world!")
				.padding()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
