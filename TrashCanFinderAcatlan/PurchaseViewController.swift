//
//  PurchaseViewController.swift
//  TrashCanFinderAcatlan
//
//  Created by Iván Martínez on 23/11/22.
//

import UIKit
import StorageManager

class PurchaseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var trashList: [[String: Any]] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    var contador = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        do {
            trashList = (try StorageManager.default.arrayValue(in: "trash")).reversed()
            tableView.reloadData()
        } catch {}
        
        itemsLabel.text = "Items arrojados: \(trashList.count)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trashList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrashListItem", for: indexPath)
        
        if let itemCell = cell as? TrashListItemTableViewCell {
            let trashItem = trashList[indexPath.row]
            
            guard
               let trashType = trashItem["trashType"] as? String,
               let trashPoints = trashItem["trashPoints"] as? Int,
               let image = trashItem["image"] as? String else {
                   print("Data not valid")
                return cell
            }
            
            itemCell.nameLabel.text = trashType
            itemCell.pointsLabel.text = "+\(trashPoints)"
            itemCell.previewImageView.image = convertBase64StringToImage(imageBase64String: image)
            
            contador += trashPoints
            pointsLabel.text = "\(contador) puntos"
            
            return itemCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
        let imageData = Data(base64Encoded: imageBase64String)
        let image = UIImage(data: imageData!)
        return image!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
