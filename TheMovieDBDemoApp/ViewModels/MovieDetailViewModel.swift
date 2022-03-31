// MovieListDetailViewModel.swift by Gokhan Mutlu on 31.03.2022

import Foundation
import Combine

class MovieDetailViewModel<S:Session>:ObservableObject{
	
	@Published var movieVM:MovieViewModel?
	
	private var service:TMDBService<S>!
	
	
	init(session:S){
		//self.id = id
		self.service = TMDBService(session: session)
		
		//call service to cache launches...
		//self.getUpcomingMovies()
	}

	
	func getMovie(_ id:Int){
		
		service.getMovie(id, completion: { result in
			switch result{
				case .success(let movie):
					DispatchQueue.main.async {
						self.movieVM = MovieViewModel(movie)
					}

				case .failure(let apiError):
					print(apiError.localizedDescription)
			}
		})
	}

	
	
}
