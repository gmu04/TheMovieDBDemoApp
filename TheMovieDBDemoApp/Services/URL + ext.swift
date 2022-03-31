// URL + ext.swift by Gokhan Mutlu on 31.03.2022

import Foundation

extension URL{
	
	internal enum TDMBUrl{
		case movie_upcoming(Int)
		case movie_id(Int)
		case now_playing
	}
	
	/*
	 	create a url for API version 3
	 */
	static func getTMDBUrl(_ tmdbUrl:TDMBUrl) -> URL?{
		
		var c = URLComponents()
		c.scheme = "https"
		c.host = "api.themoviedb.org"

		c.queryItems = [
			URLQueryItem(name: "api_key", value: TMDB.KEY),
			URLQueryItem(name: "language", value: "en-US"),
		]

		
		switch tmdbUrl {
			case .movie_upcoming(let page):
				c.path = "/3/movie/upcoming"
				c.queryItems! += [ URLQueryItem(name: "page", value: String(page)) ]
				
			case .movie_id(let movie_id):
				c.path = "/3/movie/\(movie_id)"
				
			case .now_playing:
				c.path = "/3/movie/now_playing"
				
			@unknown default:
				fatalError("Url not defined")
		}
		
	

						 
		return c.url
	}
	
}
