//
//  imageViewController.swift
//  LandmarkBookIos
//
//  Created by L60809MAC on 22.02.2022.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // imageView ve landmarkLabel ın içeriği ne olacak buraya yazıyoruz
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
        
    }
    
    

}
