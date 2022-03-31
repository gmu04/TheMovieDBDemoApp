// MovieListCellView.swift by Gokhan Mutlu on 31.03.2022

import SwiftUI

struct MovieListCellView: View {
	
	var movieVM:MovieViewModel
	
	var body: some View {
		HStack(spacing: 8) {
			AsyncImageView(url: movieVM.poster_path, width: 104, height: 104)
			
			VStack(alignment:.leading) {
				Text(movieVM.name)
					.font(.custom("SF Pro Text", size: 15))
					.fontWeight(.bold)
					.padding(.vertical, 8)
				
				Text(movieVM.overviewShort)
					.font(.custom("SF Pro Text", size: 13))
					.fontWeight(.medium)
					.foregroundColor(.gray)
					.padding(.vertical, 8)
				
				HStack {
					Spacer()
					Text(movieVM.release_date)
						.font(.custom("SF Pro Text", size: 12))
						.fontWeight(.medium)
						.foregroundColor(.gray)
				}
			}
			//.background(Color.pink)
			//.frame(maxWidth: .infinity)
		}
	}
}


struct MovieListCellView_Previews: PreviewProvider {
    static var previews: some View {
		MovieListCellView(movieVM: MovieViewModel.placeholder)
			//.previewLayout(.sizeThatFits)
			
    }
}
