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
    static var PLAYLIST_ID = "RDYzW2VrR5s9Y"
    //"PL9-8NdEyCHscIIN0aggPpOgZVuQSEXKO5" Ertugrul Scenes
    //"PLAz6daIC8ZlpmK7bWniRq_1M0t3UuAkx9" Payitaht Songs
    //"PLMafvfLXuZiOi7S9g6OVrQ3jbI6q_-Rib" Osman Songs
    // list IDs above for different playlsits in case I want to change
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
    static var YOUTUBE_EMBED_URL = "https://www.youtube.com/embed/"
}
