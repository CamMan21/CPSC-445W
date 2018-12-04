//
//  RootViewController.swift
//  Budget It!!
//
//  Created by Cameronn Vaughn on 10/13/18.
//  Copyright © 2018 Cameronn Vaughn. All rights reserved.
//

import UIKit

class RootViewController: UIViewController
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "LoginViewSeg", sender: self);
    }
    
    
    
    
    


}

