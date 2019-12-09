//
//  ViewController.swift
//  ios todo
//
//  Created by Likhith P.s. on 2019-12-08.
//  Copyright © 2019 dinesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var allThing: ListArrayObj!
    var recentVC = ToDoTableController()

    @IBOutlet weak var thingTitleLabel: UITextField!
    
    
    @IBOutlet weak var doneByLabel: UITextField!
    
    @IBAction func saveThing(_ sender: Any) {
        allThing = ListArrayObj()
        let thingObject = ListObject()
        if let text = thingTitleLabel.text{
            thingObject.thingsTitle = text
            if let doneBytext = doneByLabel.text{
                thingObject.doneBy = doneBytext
                recentVC.allThings.thingArray.append(thingObject)
                recentVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
            }
        }
    
    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

