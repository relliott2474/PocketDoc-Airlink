//
//  ArticleTableViewCell.swift
//  PocketDoc-Airlink
//
//  Created by Rod Elliott-Mullens on 7/24/16.
//  Copyright © 2016 Rod. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var mainName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
