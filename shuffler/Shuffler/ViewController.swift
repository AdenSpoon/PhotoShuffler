//
//  ViewController.swift
//  Shuffler
//
//  Created by Bowen She on 7/2/15.
//  Copyright © 2015 Bowen She. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var nameButton: UIButton!
    
   
    
    var nameArray = [String]()
            // -----need changes: define a name array for the view controller to store names
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameText.placeholder = "Put your children's names here!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "fromViewToShuffler") {
            let nextView = segue.destinationViewController as! shuffleViewController
            nextView.namesOfChildrenArray = nameArray
            // -----need changes: define an array property for the next view, and pass data here
        }
    }
    
    @IBAction func nameConfirmButton(nameButton:UIButton){
        
        let childrenName: String! = nameText.text
        //When no string is in the label, a pop-out message tells users to type the name.
        if (childrenName.isEmpty == true) {
            let alert = UIAlertController(title:"Type your children in the label please😄", message:"Almost get there!", preferredStyle: .Alert)
        
            let action = UIAlertAction(title: "Ok, I get it", style: .Default, handler: nil)
            
            alert.addAction(action)
            
            presentViewController(alert, animated: true, completion: nil)
        }
        //When there is a name in the blank, show users next instuctions about continuing to fill in the left children's name or shuffle the existing names
            else {
            
            let alert2 = UIAlertController(title:"\(childrenName)" + " is in the game", message:"type your next children's name", preferredStyle: .Alert)
           
            
            let action2 = UIAlertAction(title: "Back to the homepage", style: .Default, handler: nil)
            
            alert2.addAction(action2)
            
            presentViewController(alert2, animated: true, completion: nil)
            
           nameArray.append(childrenName)
           print(nameArray)
        }
        
    }
  
}


