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
    var segueName = identified
    var filteredContent = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableData(identified)
        self.title = identified
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleTableViewCell
    
        // Configure the cell...
        //let article = articles[indexPath.row]
        //let article = articles.objectForKey("pdf name") as! String
        cell.mainName.text = articles[(indexPath as NSIndexPath).row]["pdf name"] as? String
        cell.mainName.adjustsFontSizeToFitWidth = true
        
        return cell
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ArticleViewController
        if let indexPath = self.tableView.indexPathForSelectedRow{
            let row = Int((indexPath as NSIndexPath).row)
            destinationVC.articlePDF = (articles[row]["pdf name"] ) as! String
        }
    }
 
    func loadTableData(_ segueName:String){
        //func for segue load
        let path = Bundle.main.path(forResource: "pdf List", ofType:"plist")
        let cellContent:Array = NSArray(contentsOfFile:path!) as! [[String:String]]
        filteredContent = cellContent.filter{$0["type"] == segueName}
        let filtArray:NSArray = filteredContent as NSArray
        let descriptor: NSSortDescriptor = NSSortDescriptor(key: "pdf name", ascending: true)
        let sortedResults = filtArray.sortedArray(using: [descriptor])
        articles = sortedResults as! [NSDictionary]
        
    }
    

}
