//
//  MangaDetailView.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 13/2/24.
//

import SwiftUI

func add() {
    print("Added")
}

struct MangaDetailView: View {
    let manga: Manga
    var body: some View {
        ScrollView() {
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: "https://cdn.myanimelist.net/images/manga/1/100805l.jpg"), content: { image in
                    image.image?
                        .scaledToFit()
                        .frame(height: 500)
                        .clipped()
                })
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7), .clear]), startPoint: .bottom, endPoint: .top)
                Text(manga.title)
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
            }
            Button(action: add) {
                Label("Añadir a mi biblioteca", systemImage: "plus")
            }
            .buttonStyle(.borderedProminent)
                           
            VStack(alignment: .leading) {
                Text(manga.sypnosis ?? "")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        }
    }
}

struct MangaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MangaDetailView(manga: MangaExamples.mangaExample)
    }
}
