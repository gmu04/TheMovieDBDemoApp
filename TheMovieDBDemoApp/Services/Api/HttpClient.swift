// HttpClient.swift by Gokhan Mutlu on 31.03.2022

import Foundation

final class HttpClient<S:Session>{
	
	//injecting session
	init(session:S){
		self.session = session
	}
	
	func searchFor(url:URL, completion:@escaping (Result<Data, ApiError>)->()){
		
		let task = session.dataTask(with: url) { data, response, error in
			guard let dataValid = data, error == nil else {
				//return completion(.failure(.anyError(error!)))
				return completion(.failure(.any("Problem of accessing the server. Please check first your internet connection.")))
			}
			
			if let res = response as? HTTPURLResponse, res.statusCode != 200{
				return completion(.failure(.any("Http status code:\(res.statusCode) - \(res.debugDescription)")))
			}
			
			if let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode != 200{
				return completion(.failure(.statusCodeNot200(urlResponse.url?.absoluteString ?? "Error! please check your query")))
			}
			
			completion(.success(dataValid))
		}
		
		task.resume()
	}
	
	
	//MARK: - Properties
	
	private let session: S
	
}
