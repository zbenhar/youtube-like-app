//
//  ViewController.swift
//  youtube-like-app
//
//  Created by Zakaria Benharchache on 6/21/20.
//  Copyright © 2020 Zakaria Benharchache. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, Model_Delegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets itself as datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //Set itself as delegate of model
        model.delegate = self
        
        //mkaing network call to fetch videos from YouTube API
        model.getVideos()
    }
    
    
    
    //MARK: - Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        
        //Set returned videos to video property
        self.videos = videos
        
        //refresh tableview
        tableView.reloadData()
    }
    
    
    
    //MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        //Configure cell with data
        //Get title for video of wish
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        //Return cell
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

