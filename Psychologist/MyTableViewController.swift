//
//  MyTableViewController.swift
//  Psychologist
//
//  Created by 陈齐斌 on 23/10/2016.
//  Copyright © 2016 Tsinghua University. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        
    }
    
    private struct Item {
        var itemTitle: String
        var itemDetail: String
    }
    
    private var detailsToShow = Item(itemTitle: "", itemDetail: "")
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.detailsToShow = self.items[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "showdetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            
            switch identifier {
            case "showdetails":
                if let hvc = segue.destination as? MyTextViewController {
                    hvc.item.itemTitle = detailsToShow.itemTitle
                    hvc.item.itemDetail = detailsToShow.itemDetail
                }
            default:
                break
            }
        }
    }
    
    private var items = [[Item]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [[Item(itemTitle: "today bicycle", itemDetail: "interesting"), Item(itemTitle: "lunch", itemDetail: "")], [Item(itemTitle: "learning segues", itemDetail: "")]]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items[section].count
    }
    
    private struct Storyboard {
        static let CellReuseIdentifier = "Items"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.CellReuseIdentifier, for: indexPath) as! MyTableViewCell
        
        // Configure the cell...
        cell.itemTextLabel.text = items[indexPath.section][indexPath.row].itemTitle
        
        //        cell.textLabel?.text = item
        //        cell.detailTextLabel?.text = item
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
