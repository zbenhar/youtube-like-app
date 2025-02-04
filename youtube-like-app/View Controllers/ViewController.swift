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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //confirm video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //get a reference to video tapped on
        let selected_video = videos[tableView.indexPathForSelectedRow!.row]
        
        //get reference to detail view controller
        let detail_VC = segue.destination as! DetailViewController
        
        //set video property of detail view controller
        detail_VC.video = selected_video
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //Configure cell with data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        //Return cell
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

