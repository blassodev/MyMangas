//
//  MangaDTO.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 11/2/24.
//

import Foundation

// MARK: - Manga
struct MangaListDTO: Codable {
    let items: [MangaDto]
    let metadata: MetadataDto
}

// MARK: - Item
struct MangaDto: Codable {
    let demographics: [DemographicDto]
    let titleJapanese: String
    let themes: [ThemeDto]
    let chapters: Int?
    let genres: [GenreDto]
    let startDate: Date
    let score: Double
    let titleEnglish: String?
    let title: String
    let background: String?
    let id: Int
    let url: String
    let authors: [AuthorDto]
    var endDate: Date?
    let sypnosis: String?
    let volumes: Int?
    let mainPicture, status: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.demographics = try container.decode([DemographicDto].self, forKey: .demographics)
        self.titleJapanese = try container.decode(String.self, forKey: .titleJapanese)
        self.themes = try container.decode([ThemeDto].self, forKey: .themes)
        self.chapters = try container.decodeIfPresent(Int.self, forKey: .chapters)
        self.genres = try container.decode([GenreDto].self, forKey: .genres)
        self.score = try container.decode(Double.self, forKey: .score)
        self.titleEnglish = try container.decodeIfPresent(String.self, forKey: .titleEnglish)
        self.title = try container.decode(String.self, forKey: .title)
        self.background = try container.decodeIfPresent(String.self, forKey: .background)
        self.id = try container.decode(Int.self, forKey: .id)
        self.url = try container.decode(String.self, forKey: .url)
        self.authors = try container.decode([AuthorDto].self, forKey: .authors)
        self.sypnosis = try container.decodeIfPresent(String.self, forKey: .sypnosis)
        self.volumes = try container.decodeIfPresent(Int.self, forKey: .volumes)
        self.status = try container.decode(String.self, forKey: .status)
        
        self.mainPicture = try container.decode(String.self, forKey: .mainPicture)
                    .replacingOccurrences(of: "\"", with: "")
        
        let dateString = try container.decode(String.self, forKey: .startDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: dateString) {
            self.startDate = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .startDate, in: container, debugDescription: "Date string does not match format expected by formatter.")
        }
        
        if let endDateString = try container.decodeIfPresent(String.self, forKey: .endDate) {
            if let endDate = dateFormatter.date(from: endDateString) {
                self.endDate = endDate
            } else {
                throw DecodingError.dataCorruptedError(forKey: .endDate, in: container, debugDescription: "Date string does not match format expected by formatter.")
            }
        } else {
            self.endDate = nil
        }
    }
}

// MARK: - Author
struct AuthorDto: Codable {
    let id: UUID
    let role, lastName, firstName: String
}

// MARK: - Demographic
struct DemographicDto: Codable {
    let id: UUID
    let demographic: String
}

// MARK: - Genre
struct GenreDto: Codable {
    let genre: String
    let id: UUID
}

// MARK: - Theme
struct ThemeDto: Codable {
    let id: UUID
    let theme: String
}

// MARK: - Metadata
struct MetadataDto: Codable {
    let page, per, total: Int
}
extension MangaDto {
    var toPresentation: Manga {
        return Manga(id: id,
                     demographics: demographics.map { $0.toPresentation },
                     titleJapanese: titleJapanese,
                     themes: themes.map { $0.toPresentation },
                     chapters: chapters,
                     genres: genres.map { $0.toPresentation },
                     startDate: startDate,
                     score: score,
                     titleEnglish: titleEnglish,
                     title: title,
                     background: background,
                     url: url,
                     authors: authors.map { $0.toPresentation },
                     endDate: endDate,
                     sypnosis: sypnosis,
                     volumes: volumes,
                     mainPicture: mainPicture,
                     status: status)
    }
}

extension DemographicDto {
    var toPresentation: Demographic {
        return Demographic(id: id, demographic: demographic)
    }
}

extension ThemeDto {
    var toPresentation: Theme {
        return Theme(id: id, theme: theme)
    }
}

extension GenreDto {
    var toPresentation: Genre {
        return Genre(genre: genre, id: id)
    }
}

extension AuthorDto {
    var toPresentation: Author {
        return Author(id: id, role: role, lastName: lastName, firstName: firstName)
    }
}
