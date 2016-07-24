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
    var cellContent:Array = [[String:String]]()
    var segueName = String()
    var filteredContent = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableData(segueName)
        self.title = "Articles"
        //tableView.estimatedRowHeight = 44.0
        //tableView.rowHeight = UITableViewAutomaticDimension
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! ArticleTableViewCell
    
        // Configure the cell...
        //let article = articles[indexPath.row]
        //let article = articles.objectForKey("pdf name") as! String
        cell.mainName.text = articles[indexPath.row]["pdf name"] as? String
        cell.mainName.adjustsFontSizeToFitWidth = true
        
        return cell
    }
    

    // MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! ArticleViewController
        if let indexPath = self.tableView.indexPathForSelectedRow{
            let row = Int(indexPath.row)
            destinationVC.articlePDF = (articles[row]["pdf name"] ) as! String
        }
    }
 
    func loadTableData(segueName:String){
        //path is the pdf list
        // then 'filter' based on the key: "type"
        // then display in the table the selected types of articles, sorted alphabetically
            /*let path = NSBundle.mainBundle().pathForResource("pdf List", ofType:"plist")
            cellContent = NSArray(contentsOfFile:path!)!
            print("loaded cell content is \(cellContent)")
            let descriptor: NSSortDescriptor = NSSortDescriptor(key: "pdf name", ascending: true)
            let sortedResults: NSArray = cellContent.sortedArrayUsingDescriptors([descriptor])
            articles = sortedResults as! [NSDictionary]*/
        
        
        //Test func for segue load
        let path = NSBundle.mainBundle().pathForResource("pdf List", ofType:"plist")
        let cellContent:Array = NSArray(contentsOfFile:path!) as! [[String:String]]
        print("segueName = \(segueName)")
        filteredContent = cellContent.filter{$0["type"] == segueName}
        let filtArray:NSArray = filteredContent as NSArray
        let descriptor: NSSortDescriptor = NSSortDescriptor(key: "pdf name", ascending: true)
        let sortedResults = filtArray.sortedArrayUsingDescriptors([descriptor])
        articles = sortedResults as! [NSDictionary]
        
    }
    

}
