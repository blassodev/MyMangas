//
//  MangaRepository.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 11/2/24.
//

import Foundation

protocol MangaRepository {
    func getMangas() async throws -> MangaListDTO
    func searchMangas(searchTitle: String, searchDemographics: [String]?) async throws -> MangaListDTO
}

class MangasRepositoryImpl: MangaRepository {
    func getMangas() async throws -> MangaListDTO {
        guard let url = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/list/mangas?per=20") else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(MangaListDTO.self, from: data)
        } catch {
            throw error
        }
    }
    
    func searchMangas(searchTitle: String, searchDemographics: [String]?) async throws -> MangaListDTO {
        guard let url = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/search/manga?per=20") else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody: [String: Any] = [
            "searchTitle": searchTitle,
            "searchDemographics": searchDemographics ?? [],
            "searchContains": true
        ]
        
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(MangaListDTO.self, from: data)
        } catch {
            throw error
        }
    }
}
