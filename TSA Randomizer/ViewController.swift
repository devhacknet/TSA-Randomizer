//
//  ViewController.swift
//  TSA Randomizer
//
//  Created by Nguyen Thanh Dat on 4/20/16.
//  Copyright © 2016 Dat Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgArrow: UIImageView!
    var isReady: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func showDirection(sender: AnyObject) {
        if(!isReady) {
            return
        }
        
        if(randomBool()) {
            imgArrow.image = UIImage(named: "left")
            print("left")
        } else {
             imgArrow.image = UIImage(named: "right")
            print("right")
        }
        changeStatus()
        
        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 1 * Int64(NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.changeStatus()
        }
    }
    
    func randomBool() -> Bool {
        return arc4random_uniform(2) == 0 ? true: false
    }
    
    func changeStatus() {
        isReady = !isReady
        imgArrow.hidden = isReady
    }
    
}

