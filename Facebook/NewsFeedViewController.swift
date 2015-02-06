//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    var refreshControl: UIRefreshControl!

    @IBOutlet weak var loadingAnimation: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingAnimation.stopAnimating()
        feedImageView.alpha = 0


        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        scrollView.insertSubview(refreshControl, atIndex: 0)
    }
    
    func onRefresh() {
        delay(2, {
            self.refreshControl.endRefreshing()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        loadingAnimation.startAnimating()
        
        delay(2, { () -> () in
            self.loadingAnimation.stopAnimating()
            self.scrollView.contentInset.top = 0
            self.scrollView.contentInset.bottom = 50
            self.scrollView.scrollIndicatorInsets.top = 0
            self.scrollView.scrollIndicatorInsets.bottom = 50
            self.feedImageView.alpha = 1
        })
        
    }
}
