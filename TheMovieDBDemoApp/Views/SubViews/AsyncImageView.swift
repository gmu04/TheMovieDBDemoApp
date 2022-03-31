// AsyncImageView.swift by Gokhan Mutlu on 31.03.2022

import SwiftUI


struct AsyncImageView:View{
	let url:String
	let width:CGFloat
	let height:CGFloat
	var isCornerRadius = true
	
	
	private var _url:String{ "https://image.tmdb.org/t/p/original/\(url)" }
	
	let emptyImageName = "film"
	var body: some View {
		
		if let url = URL(string: _url){
			
			AsyncImage(url: url) { phase in
				switch phase {
					case .empty:
						ProgressView()
							.padding(.trailing, 20)
					case .success(let image):
						image
							.resizable()
							//.scaledToFill()
							.frame(maxWidth: width, maxHeight: height)
							
					
					case .failure:
						AsyncImage(url: url) { phase in
							if let image = phase.image {
								image
									.resizable()
									//.scaledToFill()
									.frame(maxWidth: width, maxHeight: height)
								
							} else {
								EmptyImage()
									.frame(maxWidth: width, maxHeight: height)
							}
						}
						
						
					@unknown default:
						EmptyView()
				}
			}
			.frame(maxWidth: width, maxHeight: height)
			.cornerRadius(isCornerRadius ? 5 : 0)
			//.shadow(color: .gray, radius:5)

			
		}else{
			EmptyImage()
				.frame(maxWidth: width, maxHeight: height)
				.padding(2)
		}
	}
}




struct EmptyImage: View {
	let emptyImageName = "film"
	var body: some View {
		Image(systemName: emptyImageName)
			.resizable()
	}
}
