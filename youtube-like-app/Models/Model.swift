//
//  Model.swift
//  youtube-like-app
//
//  Created by Zakaria Benharchache on 6/22/20.
//  Copyright © 2020 Zakaria Benharchache. All rights reserved.
//

import Foundation

protocol Model_Delegate {
    func videosFetched(_ videos:[Video])
}


class Model {
    
    var delegate:Model_Delegate?
    
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
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        //call "videosFetched" method of delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }//end of if statement
                
                //dump(response)
            }
            catch {
                
            }
            
            
        }
        //Kick off the task
        dataTask.resume()
        
        
    } // end of getVideos function
    
}//end of class
