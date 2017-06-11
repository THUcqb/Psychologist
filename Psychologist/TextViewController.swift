//
//  TextViewController.swift
//  Psychologist
//
//  Created by 陈齐斌 on 22/10/2016.
//  Copyright © 2016 Tsinghua University. All rights reserved.
//

import UIKit

class MyTextViewController: UIViewController {
    
    struct Item {
        var itemTitle: String
        var itemDetail: String
    }
    
    var item = Item(itemTitle: "", itemDetail: "") {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var detailsToShow: UITextView! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        self.detailsToShow?.text = item.itemTitle + "\n\n" + item.itemDetail
    }
}
