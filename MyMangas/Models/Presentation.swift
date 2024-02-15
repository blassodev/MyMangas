//
//  Presentation.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 11/2/24.
//

import Foundation

struct Manga: Identifiable, Hashable {
    let id: Int
    let demographics: [Demographic]
    let titleJapanese: String
    let themes: [Theme]
    let chapters: Int?
    let genres: [Genre]
    let startDate: Date
    let score: Double
    let titleEnglish: String?
    let title: String
    let background: String?
    let url: String
    let authors: [Author]
    let endDate: Date?
    let sypnosis: String?
    let volumes: Int?
    let mainPicture, status: String
}


struct Demographic: Identifiable, Hashable {
    let id: UUID
    let demographic: String
}

struct Theme: Identifiable, Hashable {
    let id: UUID
    let theme: String
}

struct Genre: Identifiable, Hashable {
    let genre: String
    let id: UUID
}

struct Author: Identifiable, Hashable {
    let id: UUID
    let role, lastName, firstName: String
}

extension Manga {
    func toLocalLibrary() -> LocalLibrary {
        let localDemographics = demographics.map { $0.demographic }
        let localThemes = themes.map { $0.theme }
        let localGenres = genres.map { $0.genre }
        let localAuthors = authors.map { $0.firstName + " " + $0.lastName }
        
        return LocalLibrary(id: id,
                            demographics: localDemographics,
                            titleJapanese: titleJapanese,
                            themes: localThemes,
                            chapters: chapters,
                            genres: localGenres,
                            startDate: startDate,
                            score: score,
                            titleEnglish: titleEnglish,
                            title: title,
                            background: background,
                            url: url,
                            authors: localAuthors,
                            endDate: endDate,
                            sypnosis: sypnosis,
                            volumes: volumes,
                            mainPicture: mainPicture,
                            status: status)
    }
}
