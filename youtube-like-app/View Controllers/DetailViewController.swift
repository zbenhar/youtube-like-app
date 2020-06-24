//
//  DetailViewController.swift
//  youtube-like-app
//
//  Created by Zakaria Benharchache on 6/23/20.
//  Copyright © 2020 Zakaria Benharchache. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //clear fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        //check if there is a video
        guard video != nil else {
            return
        }
        
        // otherwise, create embed URL
        let embed_url_string = Constants.YOUTUBE_EMBED_URL + video!.videoId
        
        //Load into webview
        let url = URL(string: embed_url_string)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //set title
        titleLabel.text = video!.title
        
        //set date
        let date_formatter = DateFormatter()
        date_formatter.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = date_formatter.string(from: video!.published)
        
        //set description
        textView.text = video!.description
        
    }//end of function


}
