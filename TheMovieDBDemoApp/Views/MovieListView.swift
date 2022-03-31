// MovieList.swift by Gokhan Mutlu on 31.03.2022

import SwiftUI

struct MovieListView: View {
	
	@StateObject var movieListVM = MovieListViewModel(session:URLSession.shared)
	
    var body: some View {
		NavigationView {
			VStack {
				List{
					
					SliderView(now_playing_movies: movieListVM.now_playing_movies)
						//.background(Color.blue)
						.frame(height: 256)
						.listRowInsets(
							EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

					ForEach(movieListVM.movies, id:\.id) { movieVM in
						NavigationLink {
							MovieDetailView(id: movieVM.id, title: movieVM.name)
						} label: {
							MovieListCellView(movieVM: movieVM)
								.padding(.leading, 16)
								//.background(Color.pink)
								
						}
						//.listRowInsets(.none)
						//.listRowInsets(EdgeInsets())
						.listRowInsets(
							EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16))
					}
				}
				.listStyle(.plain)
			}
			//.frame(width: UIScreen.main.bounds.size.width, alignment: .center)
			.edgesIgnoringSafeArea(.all)
			.navigationBarHidden(true)
		}
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

