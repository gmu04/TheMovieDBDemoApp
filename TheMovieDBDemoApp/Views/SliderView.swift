// SliderView.swift by Gokhan Mutlu on 31.03.2022

import SwiftUI

struct SliderView:View {
	var now_playing_movies:[MovieViewModel]
	@State var playingIndex = 0
	
	var body: some View {
		VStack {
			if now_playing_movies.indices.contains(playingIndex) {
				let movieVM = now_playing_movies[playingIndex]
				ZStack(alignment: .bottom){
					
					AsyncImageView(url: movieVM.poster_path,
								   width: UIScreen.main.bounds.width,
								   height: 256, isCornerRadius: false)
					
					
					
					VStack(spacing: 10) {
						Text(movieVM.name)
							.font(.system(size: 20, weight: .semibold, design: .default))
						Text(movieVM.overviewShort)
							.font(.system(size: 12, weight: .light, design: .default))
						
						HStack(alignment: .center, spacing: 8) {
							ForEach(0..<5) { i in
								Circle()
									.fill(i <= playingIndex ? Color.white : Color.gray)
									.frame(width: 10, height: 10)

							}
						}
						
					}
					.offset(x: 0, y: -10)
					.foregroundColor(.white)
				}
			}
		}
		.onTapGesture {
			let tmp = playingIndex
			playingIndex += 1
			playingIndex %= 5
			if !now_playing_movies.indices.contains(playingIndex+1) {
				playingIndex = tmp
			}
		}
	}
}

struct SliderView_Previews: PreviewProvider {
	static var previews: some View {
		SliderView(now_playing_movies: [MovieViewModel.placeholder,
										MovieViewModel.placeholder,
										MovieViewModel.placeholder])
	}
}
