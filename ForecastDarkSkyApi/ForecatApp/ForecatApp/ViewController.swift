//
//  ViewController.swift
//  ForecatApp
//
//  Created by student on 9/29/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.2411,88.3162") {
            
            if let data = NSData(contentsOf: url as URL){
                
                
                do {
                    let parsed = try JSONSerialization.jsonObject(with:data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                    
                    let newDict = parsed
                    
                    print(newDict["currently"]!["temperature"] as Any)
                    print(newDict["currently"]!["humidity"] as Any)
                    print(newDict["currently"]!["summary"] as Any)
                    
                    
                    self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!)"
                    self.currentHumidity.text = "\(newDict["currently"]!["humidity"]!!)"
                    self.currentlyInformation.text = "\(newDict["currently"]!["summary"]!!)"
                }
                
                catch let error as NSError {
                    print("A JSON parsithng error occurred, here are the details:\n \(error)")
                }
            }
        }
    }
    
    @IBOutlet weak var currentTemp: UILabel!
    
    @IBOutlet weak var currentHumidity: UILabel!
    
    @IBOutlet weak var currentlyInformation: UILabel!
    
}

