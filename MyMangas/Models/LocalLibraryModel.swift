//
//  LocalLibraryModel.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 14/2/24.
//

import Foundation
import SwiftData

@Model
class LocalLibrary {
    let id: Int
    let demographics: [String]
    let titleJapanese: String
    let themes: [String]
    let chapters: Int?
    let genres: [String]
    let startDate: Date
    let score: Double
    let titleEnglish: String?
    let title: String
    let background: String?
    let url: String
    let authors: [String]
    let endDate: Date?
    let sypnosis: String?
    let volumes: Int?
    let mainPicture: String
    let status: String
    var volumesReaded: [Int] = []
    
    init(id: Int, demographics: [String], titleJapanese: String, themes: [String], chapters: Int?, genres: [String], startDate: Date, score: Double, titleEnglish: String?, title: String, background: String?, url: String, authors: [String], endDate: Date?, sypnosis: String?, volumes: Int?, mainPicture: String, status: String) {
        self.id = id
        self.demographics = demographics
        self.titleJapanese = titleJapanese
        self.themes = themes
        self.chapters = chapters
        self.genres = genres
        self.startDate = startDate
        self.score = score
        self.titleEnglish = titleEnglish
        self.title = title
        self.background = background
        self.url = url
        self.authors = authors
        self.endDate = endDate
        self.sypnosis = sypnosis
        self.volumes = volumes
        self.mainPicture = mainPicture
        self.status = status
        print(self.volumes ?? "")
    }
    
}

