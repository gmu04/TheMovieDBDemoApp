// TMDBService.swift by Gokhan Mutlu on 31.03.2022

import Foundation

/*
 The Moview DB = TMDB
 */
final class TMDBService<S:Session>{
	
	//injecting session
	init(session:S){
		self.client = HttpClient(session: session)
	}
	
	
	internal func getUpcomingMovies(by page:Int = 1, completion:@escaping (Result<JsonResponse, ApiError>)->()){
		
		//prepare search url - "8196754"
		guard let validUrl = URL.getTMDBUrl(.movie_upcoming(page)) else { fatalError("Url is not valid!") }
		
		//call API client to search
		client.httpGetFor(url: validUrl){ result in
			
			switch result{
				case .failure(let apiError):
					completion(.failure(apiError))
				
				case .success(let data):
					
					let result = TMDBParser<JsonResponse>().parse(data: data)
					if case let .success(jsonResponse) = result{
						//print(JsonResponse)
						completion(.success(jsonResponse))
					}else{
						completion(.failure(.jsonParsing("Check the logs...")))
					}
					
			}
		}
		
	}
	
	internal func getMovie(_ id:Int, completion:@escaping (Result<Movie, ApiError>)->()){
		
		guard let validUrl = URL.getTMDBUrl(.movie_id(id)) else { fatalError("Url is not valid!") }
		
		//call API client to search
		client.httpGetFor(url: validUrl){ result in
			
			switch result{
				case .failure(let apiError):
					completion(.failure(apiError))
				
				case .success(let data):
					let result = TMDBParser<Movie>().parse(data: data)

					//return launches
					if case let .success(movie) = result{
						//print(JsonResponse)
						completion(.success(movie))
					}else{
						completion(.failure(.jsonParsing("Check the logs...")))
					}
			}
		}
		
	}
	
	
	//MARK: - Properties
	
	private var launches:[Movie]?
	private let client:HttpClient<S>
	
}


