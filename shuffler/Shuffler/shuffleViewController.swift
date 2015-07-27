//
//  shuffleViewController.swift
//  Shuffler
//
//  Created by Bowen She on 7/2/15.
//  Copyright © 2015 Bowen She. All rights reserved.
//

import UIKit

class shuffleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
 
    @IBOutlet weak var myPickerView: UIPickerView!
   // @IBOutlet weak var myPickerView: UIPickerView!
    var namesOfChildrenArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(namesOfChildrenArray)
        print(namesOfChildrenArray.count)
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
    }
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
                
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return namesOfChildrenArray.count
        
    }
    
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return namesOfChildrenArray[row]
        
    }
    

    
    
    


    
}
