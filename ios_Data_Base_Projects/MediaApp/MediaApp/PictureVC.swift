//
//  PictureVC.swift
//  MediaApp
//
//  Created by admin on 27/09/22.
//

import UIKit

class PictureVC: UIViewController {

    @IBOutlet weak var imageV: UIImageView!
    
    
    @IBOutlet weak var shareB: UIButton!
    
    var picUrl: URL?
    var shareController: UIActivityViewController?
    //UIDocumentInteractionController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageV.isHidden = true
    }
    
    @IBAction func takeClick(_ sender: Any) {
        
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: false)
        }else {
            
            showAlert(title: "NO CAMERA", msg: "this functionality needs a camera")
        }
        
    }
    
    
    @IBAction func selectClick(_ sender: Any) {
        
        let picker = UIImagePickerController()
        
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        picker.allowsEditing = true
        picker.allowsEditing = true
            present(picker, animated: false)
        
    }
    
    
    @IBAction func shareClicked(_ sender: Any) {
        
        guard let picUrl = picUrl else{
            showAlert(title: "", msg: "Please select a picture.")
            return
        }
        
        shareController = UIActivityViewController(activityItems: [picUrl], applicationActivities: nil)
       present(shareController!, animated: false)
//        shareController = shareFile(fileUrl: picUrl)
//        shareController?.delegate = self
//        shareController?.presentOptionsMenu(from: view.frame, in: view, animated: false)
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

extension PictureVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        imageV.isHidden = false
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            imageV.image = image
            dismiss(animated: false)
            if let pData = image.pngData() {
                let filename = "temp_\(UUID().uuidString).png"
                picUrl = saveToDocumentDir(dataToSave: pData, filename: filename)
            }
             UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            
            
            
        }
    }
        
//        if let imageUrl =  info[UIImagePickerController.InfoKey.imageURL] as? URL {
//
//            print("Image Url: \(imageUrl)")
//            picUrl = imageUrl
//        }else {
//            print("IMAGE NOT FOUND")
//        }
//
//
//        picker.dismiss(animated: false)
//    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: false) //dismiss the cancel alert by the phone and add our alert
        showAlert(title: "ERROR", msg: "Picture was not selected")
        print("Cancelled")
    }
    
}


