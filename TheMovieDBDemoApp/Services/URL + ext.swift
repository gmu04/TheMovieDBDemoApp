// URL + ext.swift by Gokhan Mutlu on 31.03.2022

import Foundation

extension URL{
	
	
	internal enum TDMBUrl{
		case movie_upcoming(Int)
	}
	
	
	/*
	 	create a url for API version 3
	 */
	static func getTMDBUrl(_ tmdbUrl:TDMBUrl) -> URL?{
		
		var c = URLComponents()
		c.scheme = "https"
		c.host = "api.themoviedb.org"
		
		switch tmdbUrl {
			case .movie_upcoming(let page):
				c.path = "/3/movie/upcoming"
				c.queryItems = [
					URLQueryItem(name: "api_key", value: TMDB.KEY),
					URLQueryItem(name: "language", value: "en-US"),
					URLQueryItem(name: "page", value: String(page))
				]
			default:
				fatalError("No url described")
		}
		
	

						 
		return c.url
	}
	
}
