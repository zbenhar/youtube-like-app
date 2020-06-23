//
//  Response.swift
//  youtube-like-app
//
//  Created by Zakaria Benharchache on 6/22/20.
//  Copyright © 2020 Zakaria Benharchache. All rights reserved.
//

import Foundation


struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
