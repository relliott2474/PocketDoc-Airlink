//
//  ArticleTableViewController.swift
//  PocketDoc-Airlink
//
//  Created by HotRod on 6/16/16.
//  Copyright © 2016 Rod. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController {
    var articles = [NSDictionary]()
    var cellContent = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableData()
        self.title = "Articles"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! MedicinesTableViewCell
        
        // Configure the cell...
        //let article = articles[indexPath.row]
        //let article = articles.objectForKey("pdf name") as! String
        cell.mainName.text = articles[indexPath.row]["pdf name"] as? String
        return cell
    }
    

    // MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        let destinationVC = segue.destinationViewController as! ArticleViewController
        if let indexPath = self.tableView.indexPathForSelectedRow{
            let row = Int(indexPath.row)
            destinationVC.articlePDF = (articles[row]["pdf name"] ) as! String
        }
        //destinationVC.articlePDF = articles["pdf name"] as? String
    }
 
    func loadTableData(){
            let path = NSBundle.mainBundle().pathForResource("pdf List", ofType:"plist")
            cellContent = NSArray(contentsOfFile:path!)!
            print("loaded cell content is \(cellContent)")
            let descriptor: NSSortDescriptor = NSSortDescriptor(key: "pdf name", ascending: true)
            let sortedResults: NSArray = cellContent.sortedArrayUsingDescriptors([descriptor])
            articles = sortedResults as! [NSDictionary]
    }

}
