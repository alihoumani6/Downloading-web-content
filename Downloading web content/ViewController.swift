//
//  ViewController.swift
//  Downloading web content
//
//  Created by Ali H on 2015-01-21.
//  Copyright (c) 2015 Ali H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //define the url
        let url = NSURL(string: "http://www.reddit.com/r/all.compact")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){
            (data, response, error) in
            
            if (error == nil)
            {
                //converts to readable format
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                println(urlContent)
                
                dispatch_async(dispatch_get_main_queue()){
                
                self.webView.loadHTMLString(urlContent! as String, baseURL: nil)
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

