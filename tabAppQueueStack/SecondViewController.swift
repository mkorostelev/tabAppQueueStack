//
//  SecondViewController.swift
//  tabAppQueueStack
//
//  Created by Admin on 04/05/2017.
//  Copyright © 2017 home. All rights reserved.
//

import UIKit

import ListQueueStack

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private var myStack = Stack<Int>()
    
    
    @IBOutlet weak var labelStack: UILabel!

    @IBOutlet weak var labelCurrentAction: UILabel!
    
    @IBAction func push(_ sender: UIButton) {
        let newItem = Int(arc4random_uniform(10))
        
        myStack.addItem(newItem)
        
        updateLabelsText(currentOperationDescription: "Added value <\(newItem)> into stack")
    }
    @IBAction func pop(_ sender: UIButton) {
        let currentOperationDescription: String
        if let deletedItem = myStack.getItem() {
            currentOperationDescription = "Removed value <\(deletedItem)> from stack"
        } else {
            currentOperationDescription = "Stack is empty!"
        }
        
        updateLabelsText(currentOperationDescription: currentOperationDescription)
    }
    
    func updateLabelsText(currentOperationDescription: String){
        let text = myStack.descriptionString()
        
        labelStack.text = text == "" ? "Stack is empty" : text
        
        labelCurrentAction.text = currentOperationDescription
    }
}

