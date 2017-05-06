//
//  FirstViewController.swift
//  tabAppQueueStack
//
//  Created by Admin on 04/05/2017.
//  Copyright © 2017 home. All rights reserved.
//

import UIKit

import ListQueueStack

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private var myQueue = Queue<Int>()
    
    @IBOutlet weak var labelQueue: UILabel!
    
    @IBOutlet weak var labelCurrentAction: UILabel!
    
    @IBAction func queue(_ sender: UIButton) {
        let newItem = Int(arc4random_uniform(10))
        
        myQueue.addItem(newItem)
        
        updateLabelsText(currentOperationDescription: "Added value <\(newItem)> into queue")
    }
    
    @IBAction func dequeue(_ sender: UIButton) {
        
        
        let currentOperationDescription: String
        if let deletedItem = myQueue.getItem() {
            currentOperationDescription = "Removed value <\(deletedItem)> from queue"
        } else {
            currentOperationDescription = "Queue is empty!"
        }
        
        updateLabelsText(currentOperationDescription: currentOperationDescription)
    }
    
    func updateLabelsText(currentOperationDescription: String){
        let text = myQueue.descriptionString()
        
        labelQueue.text = text == "" ? "Queue is empty" : text
        
        labelCurrentAction.text = currentOperationDescription
    }
   
}

