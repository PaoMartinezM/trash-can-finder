//
//  ClassificationsTableViewController.swift
//  TrashCanFinderAcatlan
//
//  Created by Iván Martínez on 22/11/22.
//

import UIKit

class ClassificationsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInsetAdjustmentBehavior = .never
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GarbageClassification.classifications.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassificationTableViewCell", for: indexPath)

        if let classificationCell = cell as? ClassificationTableViewCell {
            let classification = GarbageClassification.classifications[indexPath.row]
            classificationCell.nameLabel.text = classification.readableName
            
            if let icon = UIImage(named: classification.iconName) {
                classificationCell.iconImageView?.image = icon
            }
            
            return classificationCell
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowClassificationDetails", sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ClassificationDetailsViewController, let indexPath = sender as? IndexPath {
            let classification = GarbageClassification.classifications[indexPath.row]
            destination.classification = classification
        }
    }
    

}
