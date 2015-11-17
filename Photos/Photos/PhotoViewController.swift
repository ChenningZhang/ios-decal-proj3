//
//  PhotoViewController.swift
//  Photos
//
//  Created by Chenning Zhang on 11/16/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var photo: Photo!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var posterName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var likeButton: UIImageView!
    @IBOutlet weak var numLikes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        posterName.text = self.photo.username
        date.text = self.photo.date
        numLikes.text = String(self.photo.likes)
        let url = NSURL(string: self.photo.url)
        if let data = NSData(contentsOfURL: url!) {
            image.image = UIImage(data: data)
        }
        if ((self.photo.isLiked) != nil) {
            likeButton.image = UIImage(named: "like.png")
        } else {
            likeButton.image = UIImage(named: "dislike.png")
        }
        likeButton.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("likeSelector"))
        tapGesture.numberOfTapsRequired = 1
        likeButton.addGestureRecognizer(tapGesture)
    }
    
    func likeSelector() {
        if ((photo.isLiked) != nil) {
            likeButton.image = UIImage(named: "dislike.png")
            numLikes.text = String(self.photo.likes)
            photo.isLiked = false
        } else {
            likeButton.image = UIImage(named: "like.png")
            numLikes.text = String(self.photo.likes + 1)
            photo.isLiked = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
