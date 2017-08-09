//
//  ShowViewController.swift
//  TestFillRule
//
//  Created by Jason Fan on 09/08/2017.
//  Copyright © 2017 QooApp. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    
    var model: TutorialModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "效果页"
        
        let imageview = UIImageView(frame: UIScreen.main.bounds)
        imageview.image = UIImage(named: "screenshot")
        self.view.addSubview(imageview)

        
        let _ = TutorialView(model: model!)

    }
    
    
}
