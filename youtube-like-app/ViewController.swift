//
//  ViewController.swift
//  youtube-like-app
//
//  Created by Zakaria Benharchache on 6/21/20.
//  Copyright © 2020 Zakaria Benharchache. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

