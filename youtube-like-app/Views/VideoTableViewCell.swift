//
//  VideoTableViewCell.swift
//  youtube-like-app
//
//  Created by Zakaria Benharchache on 6/22/20.
//  Copyright © 2020 Zakaria Benharchache. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        self.video = v
        
        //make sure we actually have a video
        guard self.video != nil else {
            return
        }
        
        //set title
        self.titleLabel.text = video?.title
        
        //set date
        let date_formatter = DateFormatter()
        date_formatter.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = date_formatter.string(from: video!.published)
        
        //set thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            //set thumbnail image view
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //download thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //get shared url session object
        let session = URLSession.shared
        
        //create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                // save data in cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                //check downloaded url matches video thumbnail url this cell is set to display
                if url!.absoluteString != self.video!.thumbnail {
                    //video cell has been recycled for another video and no longer matches thumbnail that was downloaded
                    return
                }//end of if statement
                
                //create image object
                let image = UIImage(data: data!)
                
                //set image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }//end of if statement
        }
        
        //Start data task
        dataTask.resume()
        
    }//end of setCell function

}//end of class object
