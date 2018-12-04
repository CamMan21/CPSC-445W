//
//  BarGraphViewController.swift
//  Budget It!!
//
//  Created by Cameorn Vaughn on 12/1/18.
//  Copyright © 2018 Cameorn Vaughn. All rights reserved.
//

import UIKit


class BarGraphViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    var myString = String()
    var myString2 = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = myString;
        
        if myString>myString2{
            let color = UIColor(red: 255,
                                green: 0,
                                blue: 0,
                                alpha:1)
            text.textColor=color
        }
        
        if myString<myString2{
            let color = UIColor(red: 0,
                                green: 255,
                                blue: 0,
                                alpha:0.3)
            text.textColor=color
        }
        
        

        // Do any additional setup after loading the view
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
