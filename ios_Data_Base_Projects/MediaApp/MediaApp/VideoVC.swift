//
//  VideoVC.swift
//  MediaApp
//
//  Created by admin on 28/09/22.
//

import UIKit
import AVFoundation
import MobileCoreServices
import AVKit

class VideoVC: UIViewController {

    
    var videoURL : URL?
    var shareController: UIDocumentInteractionController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setCategory(.playback, mode: .moviePlayback)
        }catch{
            
            print("Error in playing video")
        }
    }
    
    @IBAction func recordClicked(_ sender: Any) {
        
        
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let pickerVC = UIImagePickerController()
            pickerVC.sourceType = .camera
            pickerVC.cameraDevice = .rear
            pickerVC.mediaTypes = [kUTTypeMovie as String]  // ["publiv/movies"]
            pickerVC.cameraCaptureMode = .video
            
            pickerVC.delegate = self
            
            present(pickerVC, animated: false)
            
        }else {
            
            showAlert(title: "NO CAMERA", msg: "This device has no camera.")
        }
    }
    
    
    @IBAction func playClicked(_ sender: Any) {
        
        if let vurl = videoURL {
            
            let player = AVPlayer(url: vurl)
            print("URL found")
            let playerVC = AVPlayerViewController()
            playerVC.player = player
            
            //present(playerVC, animated: false)
            
            //present automaticaly
            present(playerVC, animated: false) {
                player.play()
            }
        }else{
            
            // showAlert(title: "Video not found", msg: "Please record to start playing")
            
            if  let mUrl = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
                
                let player = AVPlayer(url: mUrl)
                print("URL found")
                let playerVC = AVPlayerViewController()
                playerVC.player = player
                
                //present(playerVC, animated: false)
                
                //present automaticaly
                present(playerVC, animated: false) {
                    player.play()
                }
            }
            
        }
    }

    @IBAction func shareClicked(_ sender: Any) {
        
        guard let vurl = videoURL else {
            showAlert(title: "", msg: "Please select a video to share.")
            return
        }
        shareController = shareFile(fileUrl: vurl)
        shareController?.presentOptionsMenu(from: view.frame, in: view, animated: false)
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

extension VideoVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        videoURL = info [UIImagePickerController.InfoKey.mediaURL] as? URL
        print("URL of video: \(videoURL?.absoluteString ?? "")")
        picker.dismiss(animated: false)
        UISaveVideoAtPathToSavedPhotosAlbum((videoURL?.path)!, nil, nil, nil) //saving to photosAlbum app
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: false)
        showAlert(title: "Cancelled", msg: "No video Recorded")
    }
}

