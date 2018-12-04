//
//  LoginViewController.swift
//  Budget It!!
//
//  Created by Cameorn Vaughn on 10/22/18.
//  Copyright © 2018 Cameorn Vaughn. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userNameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    
    @IBAction func loginButtonPressed(_ sender: AnyObject) {
        
        let userName = userNameTextField.text;
        let passWord = userPasswordTextField.text;
        
        let storedUserName = UserDefaults.standard.string(forKey: "userName");
        let storedPassword = UserDefaults.standard.string(forKey: "password");
        
        if(storedUserName == userName && storedPassword == passWord){
                
                //For succesful Login
                UserDefaults.standard.set(true, forKey:"userLoggedIn");
                UserDefaults.standard.synchronize();
                self.dismiss(animated: true, completion: nil);
            
        }
        else{
            displayAlert(userMessage: "Username or Password is incorrect")
            return;
        }
        
        
    }
    
   
    
    
    func displayAlert(userMessage:String){
        //
        var myAlert = UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
        
        let okAction = UIAlertAction(title:"OK",style: UIAlertAction.Style.default);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true,completion:nil);
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
