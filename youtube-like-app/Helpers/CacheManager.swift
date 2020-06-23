//
//  CacheManager.swift
//  youtube-like-app
//
//  Created by Zakaria Benharchache on 6/22/20.
//  Copyright © 2020 Zakaria Benharchache. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?){
        
        //store image data and use url as key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        //try to get data for specified url
        return cache[url]
    }
}
