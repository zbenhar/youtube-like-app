//
//  Video.swift
//  youtube-like-app
//
//  Created by Zakaria Benharchache on 6/22/20.
//  Copyright © 2020 Zakaria Benharchache. All rights reserved.
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippet_Container = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //Parse title
        self.title = try snippet_Container.decode(String.self, forKey: .title)
        
        //Parse description
        self.description = try snippet_Container.decode(String.self, forKey: .description)
        
        //Parse published date
        self.published = try snippet_Container.decode(Date.self, forKey: .published)
        
        //Parse the thumbnails
        let thumbnail_Container = try snippet_Container.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let high_Container = try thumbnail_Container.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try high_Container.decode(String.self, forKey: .thumbnail)
        
        //Parse the video ID
        let resourceId_Container = try snippet_Container.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceId_Container.decode(String.self, forKey: .videoId)
    } //end of decoding protocol for parsing JSON response from API into video objects
    
}//end of struct
