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
