// MovieListDetailView.swift by Gokhan Mutlu on 31.03.2022

import SwiftUI

struct MovieDetailView: View {
	
	@ObservedObject var movieListDetailVM = MovieDetailViewModel(session: URLSession.shared)
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

	
	//var movieVM:MovieViewModel
	let movieTitle:String
	
	init(id:Int, title:String){
		movieTitle = title
		movieListDetailVM.getMovie(id)
	}
	
    var body: some View {
		VStack(alignment:.leading){
				if let movieVM = movieListDetailVM.movieVM{
					AsyncImageView(url: movieVM.poster_path, width: .infinity, height: UIScreen.main.bounds.height*0.3, isCornerRadius: false)
						.padding(.bottom, 10)
					
					
					HStack{
						Image("imdb")
							.resizable()
							.frame(width: 49, height: 24)
							
						Image(systemName: "star.fill")
							.foregroundColor(.yellow)
						
						Text(String(format: "%0.0f", (movieListDetailVM.movieVM?.vote_average ?? 0)))
						Text("/ 10")
							.foregroundColor(.gray)
						
						Text(movieListDetailVM.movieVM?.release_date ?? "")
					}
					.font(.custom("SF Pro Text", size: 13))
					.padding(.horizontal, 16)
					
					Text(movieVM.name)
						.font(.title)
						.padding(.horizontal, 16)
					
					ScrollView{
						Text(movieVM.overview)
							.padding(.horizontal, 16)
					}
				}
				
				Spacer()
				
			}
			.navigationBarTitleDisplayMode(.inline)
			.navigationTitle(movieTitle)
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: backButton)
    }
	
	
	var backButton: some View {
		Button(action: {
			self.presentationMode.wrappedValue.dismiss()
			}) {
				HStack {
					Image(systemName: "chevron.backward")
						.aspectRatio(contentMode: .fit)
						//.foregroundColor(.black)
					//Text("") //translated Back button title
				}
			}
		}
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
		let vm = MovieViewModel.placeholder
		return MovieDetailView(id: vm.id, title: vm.name)
			//(movieVM: MovieViewModel.placeholder)
    }
}
