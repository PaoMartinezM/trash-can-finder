//
//  AddTrashViewController.swift
//  TrashCanFinderAcatlan
//
//  Created by Iván Martínez on 23/11/22.
//

import UIKit
import StorageManager

extension UIImage {
    var highestQualityJPEGNSData:NSData { return self.jpegData(compressionQuality: 1.0)! as NSData }
    var highQualityJPEGNSData:NSData    { return self.jpegData(compressionQuality: 0.75)! as NSData}
    var mediumQualityJPEGNSData:NSData  { return self.jpegData(compressionQuality: 0.5)! as NSData }
    var lowQualityJPEGNSData:NSData     { return self.jpegData(compressionQuality: 0.25)! as NSData}
    var lowestQualityJPEGNSData:NSData  { return self.jpegData(compressionQuality: 0.0)! as NSData }
}

class AddTrashViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var trashTypePickerView: UIPickerView!
    @IBOutlet weak var previewImageView: UIImageView!
    
    var selectedTrashType: String?
    var selectedImage: UIImage?
    var trashPoints: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        trashTypePickerView.delegate = self
        trashTypePickerView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func takePicture(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @IBAction func publishPicture(_ sender: UIButton) {
        guard let selectedTrashType = selectedTrashType, let selectedImage = selectedImage, let trashPoints = trashPoints else { return }
        let base64Image = imageTobase64(image: selectedImage)
        
        var storedTrash: [[String: Any]] = []
        
        do {
            storedTrash = try StorageManager.default.arrayValue(in: "trash")
        } catch {}
        let newTrash = [
            "trashType": selectedTrashType,
            "trashPoints": trashPoints,
            "image": base64Image
        ] as [String : Any]
        storedTrash.append(newTrash)
        
        try! StorageManager.default.store(array: storedTrash, in: "trash")
        performSegue(withIdentifier: "ShowTrashList", sender: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }

        previewImageView.image = image
        selectedImage = image
    }
    
    // MARK: - PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GarbageClassification.classifications.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return GarbageClassification.classifications[row].readableName
    }
    
    func imageTobase64(image: UIImage) -> String {
        return image.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTrashType = GarbageClassification.classifications[row].readableName
        trashPoints = GarbageClassification.classifications[row].trashPoints
    }
    
}
