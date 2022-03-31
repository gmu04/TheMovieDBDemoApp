// Movie.swift by Gokhan Mutlu on 31.03.2022

import Foundation



struct Movie:Decodable{
	let id:Int
	
	let original_title:String
	
	let overview:String
	let poster_path:String
	
	let release_date:String
	
}

