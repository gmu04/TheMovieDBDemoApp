// MovieList.swift by Gokhan Mutlu on 31.03.2022

import SwiftUI

struct MovieListView: View {
	
	@StateObject var movieListVM = MovieListViewModel(session:URLSession.shared)
	
    var body: some View {
		NavigationView {
			VStack {
				List{
					ForEach(movieListVM.movies, id:\.id) { movieVM in
						NavigationLink {
							MovieDetailView(id: movieVM.id, title: movieVM.name)
						} label: {
							MovieListCellView(movieVM: movieVM)
						}
						
						
					}
				}
				.listStyle(.plain)
			}
			.navigationBarHidden(true)
		}
		.edgesIgnoringSafeArea(.all)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

