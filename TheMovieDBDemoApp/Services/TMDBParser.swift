// TMDBParser.swift by Gokhan Mutlu on 31.03.2022

import Foundation


struct TMDBParser<T:Decodable>/*:JSonParser*/{
	
	func parse(data: Data) -> Result<T, ApiError> {
		let decoder = JSONDecoder()
		do{
			let apiResponse = try decoder.decode(T.self, from: data)
			return .success(apiResponse)
		}catch{
			print(error)
			print(error.localizedDescription)
			return .failure(.anyError(error))
		}
	}
	
//	typealias T = JsonResponse
//	typealias TError = ApiError
}



//protocol JSonParser{
//	associatedtype T
//	associatedtype TError:Error
//	func parse(data:Data) -> Result<T,TError>
//}
