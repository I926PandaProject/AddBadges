//
//  ViewController.swift
//  RedRed
//
//  Created by Zhishan Zhang on 2/28/16.
//  Copyright © 2016 Zhishan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum defaultKeys {
        static let keyOne = "badgeNumber"
    }

    
    var data = ["haha", "2333", "hehe"]
    
    @IBOutlet weak var tableTest: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableTest.dataSource = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addBadge(sender: AnyObject) {
//        let notification = UILocalNotification()
        let defaults = NSUserDefaults.standardUserDefaults()
        if let oldValue = defaults.stringForKey(defaultKeys.keyOne) {
//        oldValue!.toInt()
            let nowValue = Int(oldValue)! + 1
            defaults.setValue(nowValue, forKey: defaultKeys.keyOne)
            UIApplication.sharedApplication().applicationIconBadgeNumber = nowValue;
        } else {
            defaults.setValue("1", forKey: defaultKeys.keyOne)
            defaults.synchronize()
        }
        
    
    }
    

}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell {
        
        let cell = tableTest.dequeueReusableCellWithIdentifier("titleTest", forIndexPath: indexPath) 
        
        cell.textLabel!.text = data[indexPath.row]
        cell.textLabel!.numberOfLines = 0

        
        return cell
    }
}

