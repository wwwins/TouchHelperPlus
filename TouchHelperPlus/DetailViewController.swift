//
//  DetailViewController.swift
//  TouchHelperPlus
//
//  Created by wwwins on 2014/12/3.
//  Copyright (c) 2014年 isobar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var detailDescriptionLabel: UILabel!


  var detailItem: AnyObject? {
    didSet {
        // Update the view.
        self.configureView()
    }
  }

  func configureView() {
    // Update the user interface for the detail item.
    if let detail: AnyObject = self.detailItem {
        if let label = self.detailDescriptionLabel {
            label.text = detail.description
        }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.configureView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func clicked(sender: AnyObject) {
    self.performSegueWithIdentifier("IdentifierToWebView", sender: self)
  }
  
  
  // MARK: - Segues
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "IdentifierToWebView" {
      let kaw = segue.destinationViewController as KAWModalWebViewController;
      kaw.url = NSURL(string: "http://google.com")
    }
  }

  
}

