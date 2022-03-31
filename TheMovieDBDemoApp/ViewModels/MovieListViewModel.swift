// MovieListViewModel.swift by Gokhan Mutlu on 31.03.2022

import Foundation
import Combine

class MovieListViewModel<S:Session>:ObservableObject{
	@Published var movies = [MovieViewModel]()
	@Published var now_playing_movies = [MovieViewModel]()
	
	@Published var page = 1
	var total_pages = 1
	
	private var service:TMDBService<S>!
	
	
	init(session:S){
		self.service = TMDBService(session: session)
		
		self.getUpcomingMovies()

		self.getNowPlayingMovies()
	}
	
	
	func getUpcomingMovies(_ byPage:Int = 1){
		guard  0 < page && page <= total_pages else{ return }
		
		service.getUpcomingMovies(by: byPage) { result in
			switch result{
				case .success(let jsonResponse):
					DispatchQueue.main.async {
						self.movies = jsonResponse.results.map{ MovieViewModel($0) }
						self.page = byPage
					}
					self.total_pages = jsonResponse.total_pages

				case .failure(let apiError):
					print(apiError.localizedDescription)
			}
		}
	}
	
	func getNowPlayingMovies(){
		service.getNowPlayingMovies{ result in
			switch result{
				case .success(let jsonResponse):
					DispatchQueue.main.async {
						self.now_playing_movies = jsonResponse.results.map{ MovieViewModel($0) }
					}
				case .failure(let apiError):
					print(apiError.localizedDescription)
			}
		}
	}
	
	
}



