//
//  MedicineViewController.swift
//  PocketDoc-Airlink
//
//  Created by HotRod on 6/16/16.
//  Copyright © 2016 Rod. All rights reserved.
//

import UIKit

class MedicineViewController: UIViewController {
    var ntitle = String()
    var ndata = String()
    var ntext = String()
    
    @IBOutlet weak var noteTitle: UILabel!
    
    @IBOutlet weak var noteData: UILabel!
    
    @IBOutlet weak var noteText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        noteTitle.text = ntitle
        noteData.text = ndata
        noteText.text = ntext

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       

}
