//
//  Constants.swift
//  youtube-like-app
//
//  Created by Zakaria Benharchache on 6/22/20.
//  Copyright © 2020 Zakaria Benharchache. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyBBOTPSUmC2L6o6893Orw9JD5AUjLY7nQo"
    static var PLAYLIST_ID = "PLCuVYHE7O2A0MZ6UdQSF3VJrWRiZXW9Op"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
