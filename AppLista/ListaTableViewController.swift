//
//  ListaTableViewController.swift
//  AppLista
//
//  Created by ORT1 on 4/16/16.
//  Copyright © 2016 ORT. All rights reserved.
//

import UIKit
import CoreData

class ListaTableViewController: UITableViewController {

    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let moc = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Item")
        do {
            items = try moc.executeFetchRequest(fetchRequest) as! [Item]
        } catch let err as NSError {
            print("ERROR fetching local data, se vira! \(err)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListaPrototypeCell", forIndexPath: indexPath)

        let item = items[indexPath.row]

        cell.textLabel!.text = item.nome
        cell.detailTextLabel!.text = String(item.creationDate)
       
        
        // Configure the cell...

        return cell
    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {

        let deleteAction = UITableViewRowAction(style: .Normal, title: "delete") { (action, indexPath) in

            let alert = UIAlertController(title: "Excluir mesmo?", message: nil, preferredStyle: .ActionSheet)
            
            let deleteAlert = UIAlertAction(title: "Excluir", style: .Default, handler: { (_) in
                // self.deleteItem(indexPath)
            })
            let cancelAlert = UIAlertAction(title: "Cancelar", style: .Default, handler: nil)

            alert.addAction(deleteAlert)
            alert.addAction(cancelAlert)

            self.presentViewController(alert, animated: true, completion: nil)
        }

        deleteAction.backgroundColor = UIColor.redColor()
        
        return [deleteAction]
    }
    
    
    func storeItem(nome: String, creationDate: NSDate = NSDate()){

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

        let moc = appDelegate.managedObjectContext

        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: moc)

        let item = Item(entity: entity!, insertIntoManagedObjectContext: moc)
        item.nome = nome
        item.creationDate = creationDate
        
        do {
            try moc.save()
        } catch let err as NSError {
            print("Não foi possíver armazenar; ERROR: \(err.userInfo), \(err.description), \(err)")
        }

        items.append(item)
    }
    
    func formatDate(date: NSDate, mask: String = " 'Criado em' dd/MM/yy HH:mm ") -> String {
        let formatter = NSDateFormatter()
//        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.dateFormat = mask

        return formatter.stringFromDate(date)
    }
    
    @IBAction func voltaParaLista(segue: UIStoryboardSegue) {
        let sourceVC = segue.sourceViewController as! AdicionarItemViewController
        
        guard let itemName = sourceVC.newItem else {
            return
        }
    
        storeItem(itemName)
//        items.append(Item(nome: itemName))

        tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
