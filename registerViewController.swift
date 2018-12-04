//
//  registerViewController.swift
//  Budget It!!
//
//  Created by Cameorn Vaughn on 10/16/18.
//  Copyright © 2018 Cameorn Vaughn. All rights reserved.
//

import UIKit

class registerViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userFristNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func registerButtonTapped(_ sender: AnyObject) {
        let userFirstName = userFristNameTextField.text;
        let userLastName=userLastNameTextField.text;
        let userEmail = userEmailTextField.text;
        let userName = userNameTextField.text;
        let passWord = passWordTextField.text;
        let passwordConfirm = passwordConfirmTextField.text;
        
        // Check if field is empty
        
        if (userFirstName?.isEmpty ?? true  ||  userLastName?.isEmpty ?? true || userEmail?.isEmpty ?? true || userName?.isEmpty ?? true || passWord?.isEmpty ?? true || passwordConfirm?.isEmpty ?? true) {
            
            
            // Display alert
            displayAlert(userMessage: "All fields must be completed")
            return;
        }
        
        //Compare password with confirmPassword
        if (passWord != passwordConfirm){
            
            //Display alert
            displayAlert(userMessage: "Passwords do not Match")
            return;
        }
        
        //Data Storage
        UserDefaults.standard.set(userEmail, forKey: "userEmail");
        UserDefaults.standard.set(userFirstName, forKey: "userFirstName");
        UserDefaults.standard.set(userLastName, forKey: "userLastName");
        UserDefaults.standard.set(userName, forKey: "userName");
        UserDefaults.standard.set(passWord, forKey: "password");
        UserDefaults.standard.synchronize();
        
        //Confirmation Message
        //
        var myAlert = UIAlertController(title:"Alert",message:"Registration Complete! Thank you!",preferredStyle:UIAlertController.Style.alert);
        //
        let okAction = UIAlertAction(title:"OK",style: UIAlertAction.Style.default){
            action in
            self.dismiss(animated: true, completion:nil);
        }
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true,completion:nil);
        
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
