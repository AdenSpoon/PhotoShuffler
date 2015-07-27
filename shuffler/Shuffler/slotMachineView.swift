//
//  slotMachineView.swift
//  Shuffler
//
//  Created by Bowen She on 7/20/15.
//  Copyright © 2015 Bowen She. All rights reserved.
//

import UIKit

class slotMachineView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var slotMachinePickerView: UIPickerView!
    @IBOutlet weak var spinBut: UIButton!
    
    var capturedImages: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.slotMachinePickerView.delegate = self
        self.slotMachinePickerView.dataSource = self
        for imageView in capturedImages{
        
        print(imageView.image)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func spin(sender: AnyObject) {
        
    }
  
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        print(self.capturedImages.count)
        
        return self.capturedImages.count
        
    }
    
    
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {

        return self.capturedImages[row] as! UIView
    }
    

}
