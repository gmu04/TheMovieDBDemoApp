// JsonResponse.swift by Gokhan Mutlu on 31.03.2022

import Foundation

struct JsonResponse:Decodable{
	let total_pages:Int
	let page:Int
	let results:[Movie]
}
