// MovieViewModel.swift by Gokhan Mutlu on 31.03.2022

import Foundation


struct MovieViewModel{
	private let movie:Movie
	init(_ movie:Movie){
		self.movie = movie
	}
	
	var id:Int{ return movie.id }
	var name:String{ return movie.original_title }
	var overview:String{ movie.overview	}
	var overviewShort:String{
		let tmp = movie.overview
		return tmp.count < 52 ? tmp : "\(tmp.substring(...52) ?? "")..."
	}
	var release_date:String{ return movie.release_date }
	var poster_path:String{ return movie.poster_path }
	var vote_average:Double{ movie.vote_average }
	
	
	static var placeholder:MovieViewModel{
		MovieViewModel(Movie(id: 676705, original_title: "Pil's Adventures", overview: "Pil, a little vagabond girl, lives on the streets of the medieval city of Roc-en-Brume, along with her three tame weasels. She survives of food stolen from the castle of the sinister Regent Tristain. One day, to escape his guards, Pil disguises herself as a princess. Thus she embarks upon a mad, delirious adventure, together with Crobar, a big clumsy guard who thinks she's a noble, and Rigolin, a young crackpot jester. Pil is going to have to save Roland, rightful heir to the throne under the curse of a spell. This adventure will turn the entire kingdom upside down, and teach Pil that nobility can be found in all of us.", poster_path: "/xy6wQ09rMIN2FfWPHJXCWyRZ3P9.jpg", release_date: "2021-08-11", vote_average: 7))
	}
}

extension String{
	fileprivate func substring(_ bounds: PartialRangeThrough<Int>) -> String?{
		guard self.count > bounds.upperBound else { return nil }
		
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return String(self[startIndex...end])
	}
}


