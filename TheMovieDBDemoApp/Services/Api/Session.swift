// Session.swift by Gokhan Mutlu on 31.03.2022

import Foundation

protocol Session{
	associatedtype Task:DataTask
	
	func dataTask(with url: URL,
				  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> Task
}


protocol DataTask {
	func resume()
}

extension URLSession: Session{ }
extension URLSessionDataTask: DataTask { }
