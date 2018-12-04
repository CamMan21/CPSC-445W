//
//  ExpenseViewController.swift
//  Budget It!!
//
//  Created by Cameorn Vaughn on 11/12/18.
//  Copyright © 2018 Cameorn Vaughn. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var OBudget: UITextField!
    @IBOutlet weak var Expense: UITextField!
    @IBOutlet weak var newBudget: UITextField!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var originalAmount: UITextField!
    @IBOutlet weak var spent: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.originalAmount.delegate = self
    }
    //Original Budget - Expenses
    @IBAction func totalTapped(_ sender: Any) {
        let num1 = Int(OBudget.text!)!;
        let num2 = Int(Expense.text!)!;
        newBudget.text = String(num1 - num2)
        
        let num3 = Int(originalAmount.text!)!;
        let num4 = Int(newBudget.text!)!;
        spent.text = String(num3-num4 );
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
   
    
    @IBAction func saveTapped(_ sender: Any) {
        
        UserDefaults.standard.set(OBudget.text, forKey: "OBudget")
        newBudget.text = ""
        UserDefaults.standard.set(month.text, forKey: "month")
        UserDefaults.standard.set(originalAmount.text, forKey: "amount")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "OBudget") as? String {
            OBudget.text = x
        }
        if let y = UserDefaults.standard.object(forKey: "month") as? String {
            month.text = y
        }
        if let z = UserDefaults.standard.object(forKey: "amount") as? String {
            originalAmount.text = z
        }
    }
    //total -> Reset -> Save
    
    @IBAction func resetTapped(_ sender: Any) {
        OBudget.text = newBudget.text
        newBudget.text = String(0)
        Expense.text = String(0)
        
    }
    
    @IBAction func progressTapped(_ sender: Any) {
        if spent.text != "" {
            performSegue(withIdentifier: "segue", sender: self)
        }
        
        if originalAmount.text != "" {
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var progressController = segue.destination as! BarGraphViewController
        progressController.myString = spent.text!
        
        var progressController2 = segue.destination as! BarGraphViewController
        progressController2.myString2 = originalAmount.text!
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
