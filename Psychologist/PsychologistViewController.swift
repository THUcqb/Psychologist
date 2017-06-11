//
//  ViewController.swift
//  Psychologist
//
//  Created by 陈齐斌 on 22/10/2016.
//  Copyright © 2016 Tsinghua University. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination = segue.destination
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController!
        }
        
        if let hvc = destination as? CalculatorViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "happy":
                    hvc.welcome = "I'm a happy calculator😂"
                case "sad":
                    hvc.welcome = "I'm a sad calculator.😒"
                default:
                    hvc.welcome = "I'm a calculator🙂"
                }
            }
        }
    }
}
