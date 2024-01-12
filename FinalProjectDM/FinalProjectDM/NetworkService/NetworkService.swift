//
//  NetworkService.swift
//  FinalProjectDM
//
//  Created by Danylo Makarenko on 19.07.2022.
//

import Foundation
import Alamofire


enum VideoType {
    case tv
    case movie
}
protocol NetworkMediaHelper {
    typealias getMediaArray = (_ result: [Media]) -> Void
}




class NetworkService: NetworkMediaHelper {
    
    var mediaArray: [Media] = []
    
    let mainUrl = "https://api.themoviedb.org/3/"
    
    
    func createRequest(_ search: Bool, _ type: VideoType,  searchText: String?, completion: @escaping getMediaArray) {
        
        var currentUrl = ""
        
        if search {
            if type == .movie {
                currentUrl = mainUrl + "search/movie?api_key=dde65bc0949868e34b6684e1d2fe7687&language=en-US&query=\(searchText?.replacingOccurrences(of: " ", with: "%20") ?? "")"
            } else {
                currentUrl = mainUrl + "search/tv?api_key=dde65bc0949868e34b6684e1d2fe7687&language=en-US&query=\(searchText?.replacingOccurrences(of: " ", with: "%20") ?? "")"
            }
            
        } else {
                if type == .movie {
                    currentUrl = self.mainUrl + "trending/movie/week?api_key=dde65bc0949868e34b6684e1d2fe7687"
                } else {
                    currentUrl = self.mainUrl + "trending/tv/week?api_key=dde65bc0949868e34b6684e1d2fe7687"
                }
            
        }
        
        AF.request(currentUrl).responseJSON { response in
            do {
                let responseModel = try JSONDecoder().decode(Results.self, from: response.data!)
                guard let resultArray = responseModel.results else {return}
                self.mediaArray = resultArray
                
                DispatchQueue.main.async {
                    completion(resultArray)
                }
                
            } catch {
                print(error)
            }
        }
    }
}

