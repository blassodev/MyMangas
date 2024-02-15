//
//  LibraryView.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 14/2/24.
//

import SwiftUI
import SwiftData

struct LibraryView: View {
    @State var mangaPath: [LocalLibrary] = []
    @Query() private var library: [LocalLibrary]
    var body: some View {
        NavigationStack(path: $mangaPath) {
            ScrollView {

                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100)),
                     GridItem(.flexible(minimum: 100)),
                     GridItem(.flexible(minimum: 100)),
                ]) {
                    ForEach(library) { manga in
                        NavigationLink(value: manga) {
                            MangaItem(imageUrl: manga.mainPicture, title: manga.title, genre: manga.genres.first ?? "", publico: manga.demographics.first ?? "")
                                           }

                    }
                    
                }
            }
            .navigationTitle("Mi biblioteca")
            .navigationDestination(for: LocalLibrary.self) { manga in
                LocalMangaDetailView(manga: manga)
        }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
