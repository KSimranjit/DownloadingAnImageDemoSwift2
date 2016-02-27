//
//  ViewController.swift
//  Downloading An Image
//
//  Created by Simranjit Kaur on 27/02/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var downloadedImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
            let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Taj_Mahal_in_March_2004.jpg/1920px-Taj_Mahal_in_March_2004.jpg")
        
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data , response, error ) -> Void in
            
                if error != nil{
              
                    print(error)
                }else
                {
                    //Save the image for offline use
                    
                    var documentsDirectory:String?
                    
                    var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                    
                    if paths.count > 0
                    {
                        //Code to save image from url and displaying
                        documentsDirectory = paths[0] as? String
                        
                        let savePath = documentsDirectory! + "/taj.jpg"
                       
                        //Code for saving image for offline use .
                        NSFileManager.defaultManager().createFileAtPath(savePath, contents: data , attributes: nil)
                    
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                           
                            self.downloadedImageView.image = UIImage(named: savePath)
                            //Code for directly displaying from url
                            //if let taj = UIImage(data: data!){
                            //    self.downloadedImageView.image = taj
                            //}
                        })
                    
                    }
                    
                }
            }
            task.resume()
            
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

