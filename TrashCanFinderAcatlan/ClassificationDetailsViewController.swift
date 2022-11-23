//
//  ClassificationDetailsViewController.swift
//  TrashCanFinderAcatlan
//
//  Created by Iván Martínez on 23/11/22.
//

import UIKit

class ClassificationDetailsViewController: UIViewController {

    @IBOutlet weak var mapImageView: UIImageView!
    @IBOutlet weak var classificationNameLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    var classification: GarbageClassification?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let classification = classification {
            classificationNameLabel.text = classification.readableName
            instructionsLabel.text = classification.address
            mapImageView.image = UIImage(named: classification.mapIcon)
        }
    }


}
