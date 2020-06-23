//
//  Model.swift
//  youtube-like-app
//
//  Created by Zakaria Benharchache on 6/22/20.
//  Copyright © 2020 Zakaria Benharchache. All rights reserved.
//

import Foundation


class Model {
    
    func getVideos() {
        
        //create url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //get url session object
        let session = URLSession.shared
        
        //get a data task from url session object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in

            //check for errors if any
            if error != nil || data == nil {
                return
            }
            
            do {
                //parse data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
            }
            catch {
                
            }
            
            
        }
        //Kick off the task
        dataTask.resume()
        
        
    } // end of getVideos function
    
}//end of class
