

import Foundation
import RealmSwift

class MediaModel: Object {
    
    @objc dynamic var type = true
    @objc dynamic var movieName = ""
    @objc dynamic var mediaType = ""
    @objc dynamic var posterPath = ""
    @objc dynamic var overview = ""
    @objc dynamic var voteAverage = 0.0
    @objc dynamic var movieReleaseDate = ""
    @objc dynamic var tvName = ""
    @objc dynamic var firstAirDate = ""
    
}
