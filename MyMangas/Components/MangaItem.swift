//
//  MangaItem.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 11/2/24.
//

import SwiftUI

struct MangaOverlay: View {
    let genre: String
    let publico: String
    var body: some View {
        VStack() {
            Rectangle()
                .overlay(content: {
                Text(genre)
                    .font(.headline)
                    .foregroundColor(.white)
            })
                .background(Color.blue)
                .opacity(0.60)
                .frame(height: 25)

        
            
            Spacer()
            
            Rectangle()
                .overlay(content: {
                Text(publico)
                    .font(.headline)
                    .foregroundColor(.white)
            })
                .background(Color.orange)
                .opacity(0.60)
                .frame(height: 25)
        
        }
    }
}

struct MangaItem: View {
    let imageUrl: String
    let title: String
    let genre: String
    let publico: String
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: imageUrl), content: { image in
                    image.image?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .overlay(MangaOverlay(genre: genre, publico: publico))
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                })
                
            }
            Text(title)
                .font(.caption)
                .frame(width: 100, height: 15)
                .truncationMode(.tail)
        }
    }
}

struct MangaItem_Previews: PreviewProvider {
    static var previews: some View {
        MangaItem(imageUrl: "https://cdn.myanimelist.net/images/manga/1/267715l.jpg", title: "Titulo test test test test test", genre: "Manga", publico: "Shonen")
    }
}
