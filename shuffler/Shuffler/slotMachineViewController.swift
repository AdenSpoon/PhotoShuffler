//
//  slotMachine.swift
//  Shuffler
//
//  Created by Bowen She on 7/21/15.
//  Copyright © 2015 Bowen She. All rights reserved.
//

import UIKit

class slotMachineViewController: UIViewController {
    
    @IBOutlet var wholeView: UIView!
   
    @IBOutlet weak var imageView: UIImageView!
    var capturedImages = [UIImage]()
    var nameArray = [String]() //add names here
    var slotImageGroup: NSMutableArray = []
    //var timer = NSTimer()
    var timeDuration = NSTimeInterval()

  
    
    override func viewDidLoad() {
        self.nameArray = ["Tom", "Jerry"]
        super.viewDidLoad()
        self.initSlotMachine()
        print(slotImageGroup)
        //set the initial value for timeDuration
        self.timeDuration = 0.1
        self.view.backgroundColor = UIColor(red: 0.647, green: 0.651, blue: 0.757, alpha: 1);
     
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func spinTheMachine(sender: AnyObject) {
        
        if(capturedImages.count <= 0){
            self.errorThrower()
        }
            
        else{
            self.slotMachineAnimation()
        }
    }
    
    //init the input(slotImageView) of the slot machine
    func initSlotMachine(){
        
        for image in self.capturedImages {
           
            let slotImageView:UIImageView = UIImageView(frame: CGRectMake(187, 263, 240, 128))
    //make the center of the imageView be at the same position of imageView
            slotImageView.center = imageView.convertPoint( imageView.center, fromView: imageView.superview)
            slotImageView.image = image
            self.slotImageGroup.addObject(slotImageView)
            
        }
        
    }
    
    func slotMachineAnimation(){
        self.timeDuration = 0.1

        
        //let startIndexImage = 0
       //self.foo(startIndexImage, timeDuration: timeDuration)
        
      UIView.transitionWithView(self.imageView, duration: timeDuration, options: .TransitionFlipFromBottom, animations: {
         self.imageView.addSubview(self.slotImageGroup[0] as! UIView)
        }, completion:
        {
            (flag:Bool) in
            if flag {
                self.foo(0, timeDuration: self.timeDuration)
            }
            
        })

       
        
    }
    
    //random number generator with a range containing the bounds
    func randRange (lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    func foo(var startIndexOfImage: Int, var timeDuration:NSTimeInterval) {
       
      
        let count = self.capturedImages.count
        let i1 = startIndexOfImage % count
        let i2 = (startIndexOfImage + 1) % count
        
        if (timeDuration > 2 ) {
            
            let rand = randRange(0, upper: count - 1)
            print(rand)
            
            if(i1 != rand) {
            UIView.transitionFromView(self.slotImageGroup[i1] as! UIView , toView: self.slotImageGroup[rand] as!UIImageView, duration: timeDuration + 1, options: .TransitionFlipFromBottom, completion:nil)
            }
          
            //show the winner when the animation is done
            let alertController = UIAlertController(title: nil, message: "Congrats \(self.nameArray[rand])!", preferredStyle: .Alert);
            let defaultAction = UIAlertAction(title: "Shake to return home", style: .Default, handler: nil);
            alertController.addAction(defaultAction);
            
            presentViewController(alertController, animated: true, completion: nil)
            

            
            return
          
            
        }
        else {
            if(startIndexOfImage > count * 5 && startIndexOfImage > 20) {
            timeDuration = timeDuration + 1
             
            }
            
            
        }
      
       
            //continuously transit from one view to the next view in slotImageGroup
        UIView.transitionFromView(self.slotImageGroup[i1] as! UIView , toView: self.slotImageGroup[i2] as! UIImageView, duration: timeDuration, options: .TransitionFlipFromBottom, completion:{
            (flag:Bool) in
            if flag {
                startIndexOfImage++;
                self.foo(startIndexOfImage, timeDuration: timeDuration)
            }
        })
        
        return
    }



        
   
    func errorThrower() {
        let alert = UIAlertController(title:"Attention:", message:"Please firstly take the pictures then come back to the slot machine", preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,
            handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    

}



