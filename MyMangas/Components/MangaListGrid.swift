//
//  MangaListGrid.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 11/2/24.
//

import SwiftUI


struct MangaListGrid: View {
    @State var mangaPath: [Manga] = []
    @State var search = ""
    @ObservedObject var viewModel = ExploreVM()


    var body: some View {
        NavigationStack(path: $mangaPath){
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100)),
                     GridItem(.flexible(minimum: 100)),
                     GridItem(.flexible(minimum: 100)),
                ]) {
                    ForEach(viewModel.mangas) { manga in
                        NavigationLink(value: manga) {
                            MangaItem(imageUrl: manga.mainPicture, title: manga.title, genre: manga.genres.first?.genre ?? "", publico: manga.demographics.first?.demographic ?? "")
                                           }

                    }
                    
                }
            }
            .navigationTitle("Explorar")
            .navigationDestination(for: Manga.self) { manga in
                MangaDetailView(manga: manga)
            }
            .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always))
            .onSubmit(of: .search) {
                Task {
                    await viewModel.filterMangasByText(text: search)
                    print(search)
                }
            }

        }

        .onAppear() {
            Task {
                await viewModel.fetchMangas()
            }
        }
    }
}

struct MangaListGrid_Previews: PreviewProvider {
    static var previews: some View {
        MangaListGrid()
    }
}
