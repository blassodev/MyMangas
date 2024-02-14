//
//  MangaMock.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 13/2/24.
//

import Foundation

struct MangaExamples {
    static let mangaExample = Manga(
        id: 1,
        demographics: [
            Demographic(id: UUID(), demographic: "Shonen"),
            Demographic(id: UUID(), demographic: "Seinen")
        ],
        titleJapanese: "進撃の巨人",
        themes: [
            Theme(id: UUID(), theme: "Acción"),
            Theme(id: UUID(), theme: "Fantasía"),
            Theme(id: UUID(), theme: "Drama")
        ],
        chapters: 139,
        genres: [
            Genre(genre: "Shonen", id: UUID()),
            Genre(genre: "Acción", id: UUID()),
            Genre(genre: "Drama", id: UUID())
        ],
        startDate: Date(timeIntervalSince1970: 1307155200), // Fecha de inicio: 5 de abril de 2010
        score: 9.0,
        titleEnglish: "Attack on Titan",
        title: "Shingeki no Kyojin Volume 0",
        background: "La humanidad lucha por sobrevivir contra gigantes devoradores de humanos",
        url: "https://www.mymangas.com/shingeki-no-kyojin",
        authors: [
            Author(id: UUID(), role: "Historia & Arte", lastName: "Isayama", firstName: "Hajime")
        ],
        endDate: Date(timeIntervalSince1970: 1616865600), // Fecha de finalización: 9 de abril de 2021
        sypnosis: "En un mundo donde la humanidad está al borde de la extinción, los supervivientes se refugian en ciudades fortificadas mientras luchan contra los titanes.",
        volumes: 34,
        mainPicture: "https://www.mymangas.com/shingeki-no-kyojin/cover.jpg",
        status: "Finalizado"
    )
}
