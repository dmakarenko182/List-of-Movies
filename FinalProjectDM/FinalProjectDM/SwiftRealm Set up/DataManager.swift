//
//  DataManager.swift
//  FinalProjectDM
//
//  Created by Danylo Makarenko on 08.08.2022.
//

import Foundation
import RealmSwift

struct DataManager {
    
    static let globalDataManager = DataManager()
    
    let realm = try! Realm()
    
    
    func saveMediaData(media: Media?, type: Bool) {
        
        let mediaSavedRealm = MediaModel()
        
        mediaSavedRealm.movieName = media?.originalTitle ?? ""
        mediaSavedRealm.mediaType = media?.mediaType ?? ""
        mediaSavedRealm.posterPath = media?.posterPath ?? ""
        mediaSavedRealm.overview = media?.overview ?? ""
        mediaSavedRealm.voteAverage = media?.voteAverage ?? 0.0
        mediaSavedRealm.movieReleaseDate = media?.releaseDate  ?? ""
        mediaSavedRealm.tvName = media?.originalName ?? ""
        mediaSavedRealm.firstAirDate = media?.firstAirDate ?? ""
        mediaSavedRealm.type = type
        
        
        try! realm.write({
            realm.add(mediaSavedRealm)
        })
    }
    
    func getMediaData() -> [MediaModel] {
        
        var savedMoviesArray : [MediaModel] = []
        

        let movieResults = realm.objects(MediaModel.self)

        
        for movie in movieResults {
            savedMoviesArray.append(movie)
        }
        
        
        return savedMoviesArray
    }
    
}
