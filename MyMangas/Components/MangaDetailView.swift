//
//  MangaDetailView.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 13/2/24.
//

import SwiftUI
import SwiftData



struct MangaDetailView: View {
    @Environment(\.modelContext) private var context
    let manga: Manga
    @Query() private var library: [LocalLibrary]
    @State() private var libraryModel: LocalLibrary? = nil
    @State private var showingPopover = false
    
    func checkVolumeColor(volume: Int) -> Color {
        return libraryModel?.volumesReaded.contains(volume) ?? false ? .green : .black
    }
    
    var body: some View {
        ScrollView() {
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: manga.mainPicture), content: { image in
                    image.image?
                        .scaledToFit()
                        .frame(height: 500)
                        .clipped()
                })
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7), .clear]), startPoint: .bottom, endPoint: .top)
                Text(manga.title)
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
            }
            Button(action: {
                if let secureLibraryModel = libraryModel {
                    context.delete(secureLibraryModel)
                }else {
                    context.insert(manga.toLocalLibrary())
                }
                libraryModel = library.first(where: {$0.id == manga.id})
            }) {
                if (libraryModel != nil) {
                    Label("Eliminar de mi biblioteca", systemImage: "minus")

                } else {
                    Label("Añadir a mi biblioteca", systemImage: "plus")
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button("Tomos", action: {
                showingPopover = true
            }).buttonStyle(.borderedProminent)
                           
            VStack(alignment: .leading) {
                Text(manga.sypnosis ?? "")
            }
            
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        }
        .popover(isPresented: $showingPopover) {
        
            if let volumes = libraryModel?.volumes {
                List {
                    ForEach((1...volumes), id: \.self) { volumeNumber in
                        Text("Volumen " + String(volumeNumber))
                            .foregroundStyle(checkVolumeColor(volume: volumeNumber))
                            .swipeActions(edge: .leading) {
                                Button("Eliminar de leidos") {
                                    let index = libraryModel?.volumesReaded.firstIndex(of: volumeNumber)
                                    libraryModel?.volumesReaded.remove(at: index!)
                                    
                                }
                                .tint(.red)
                            }
                            .swipeActions(edge: .trailing) {
                                Button("Marcar como leido") {
                                    libraryModel?.volumesReaded.append(volumeNumber)
                                }
                                .tint(.green)
                            }
                    }
                }
            }
            else {
                Text("Sin tomos")
            }

        }
        .onAppear {
            libraryModel = library.first(where: {$0.id == manga.id})
        }
    }
}

struct MangaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MangaDetailView(manga: MangaExamples.mangaExample)
    }
}
