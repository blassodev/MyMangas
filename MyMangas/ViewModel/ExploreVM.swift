//
//  ExploreVM.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 11/2/24.
//

import Foundation

class ExploreVM: ObservableObject {
    @Published var mangas: [Manga] = []
    private let mangaRepository: MangaRepository
    
    init(mangaRepository: MangaRepository = MangasRepositoryImpl()) {
        self.mangaRepository = mangaRepository
    }
    
    func fetchMangas() async {
        do {
            let mangaListDTO = try await mangaRepository.getMangas()
            let mangas = mangaListDTO.items.map { $0.toPresentation }
            DispatchQueue.main.async {
                self.mangas = mangas
            }
        } catch {
            print("Error fetching mangas: \(error)")
        }
    }
    
    func filterMangasByText(text: String) async {
        do {
            let mangaListDTO = try await mangaRepository.searchMangas(searchTitle: text, searchDemographics: nil)
            let mangas = mangaListDTO.items.map { $0.toPresentation }
            DispatchQueue.main.async {
                self.mangas = mangas
            }
        }
        catch {
            print("Error fetching mangas: \(error)")
        }
    }

}
