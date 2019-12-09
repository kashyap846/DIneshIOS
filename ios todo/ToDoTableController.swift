//
//  ToDoTableController.swift
//  ios todo
//
//  Created by Likhith P.s. on 2019-12-08.
//  Copyright © 2019 dinesh. All rights reserved.
//

import UIKit

class ToDoTableController: UITableViewController {
    var allThings: ListArrayObj!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        setEditing(false, animated: true)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allThings.thingArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showEachCell", for: indexPath) as! ThingViewCell
        let allThings1 = allThings.thingArray[indexPath.row]
        if(allThings1.isCompletedOut){
            cell.thingsTitleLabel.text = "❌" + " " + allThings1.thingsTitle
            cell.setHighlighted(true, animated: true)
            cell.selectionStyle = .gray
        }else{
            cell.thingsTitleLabel.text = allThings1.thingsTitle
        }
        cell.doneByTextField.text = allThings1.doneBy
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let allThing1 = allThings.thingArray[indexPath.row]
            let title = "Delete \(allThing1.thingsTitle)"
            let msg = "sure! do you want to delete?"
            let warning = UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
            let undoAction = UIAlertAction(title: "Undo",style: .cancel, handler: nil)
            warning.addAction(undoAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {(action) -> Void in self.allThings.removeThing(allThing1)
                tableView.deleteRows(at: [indexPath], with: .automatic)})
            warning.addAction(deleteAction)
            present(warning,animated: true,completion: nil)
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to destinationRowAt: IndexPath) {
        allThings.moveThing(from: fromIndexPath.row, to: destinationRowAt.row)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
            case "newThingItem":
            let detailViewController = segue.destination as! ViewController
            detailViewController.recentVC = self
            default:
            preconditionFailure("segue error")
        }
 
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath) as! ThingViewCell
        var headderText: String = cell.thingsTitleLabel.text!
        if(allThings.thingArray[indexPath.row].isCompletedOut){
            cell.setHighlighted(false, animated: false)
            cell.setSelected(false, animated: false)
            allThings.thingArray[indexPath.row].isCompletedOut = false
            headderText = headderText.replacingOccurrences(of: "❌", with: " ")
            cell.thingsTitleLabel.text = headderText
        }
        else{print("making selected")
            allThings.thingArray[indexPath.row].isCompletedOut = true
            cell.setHighlighted(true, animated: true)
            cell.thingsTitleLabel.text = "❌" + " "  + headderText
            cell.selectionStyle = .gray
            cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height)
            UIView.animate(
                withDuration: 0.8,
                delay: 0.03 * Double(indexPath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    

}
