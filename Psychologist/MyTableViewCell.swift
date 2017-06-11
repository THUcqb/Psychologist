//
//  MyTableViewCell.swift
//  Psychologist
//
//  Created by 陈齐斌 on 23/10/2016.
//  Copyright © 2016 Tsinghua University. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    var item: String? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var itemTextLabel: UILabel! {
        didSet {
            updateUI()
        }
    }

    
    func updateUI() {
        self.itemTextLabel?.text = item
    }
}
