//
//  AudioVC.swift
//  MediaApp
//
//  Created by admin on 27/09/22.
//

import UIKit
import AVFoundation

class AudioVC: UIViewController {

    @IBOutlet weak var infoL: UILabel!
    
    @IBOutlet weak var recordB: UIButton!
    
    @IBOutlet weak var stopB: UIButton!
    
    @IBOutlet weak var playB: UIButton!
    
    @IBOutlet weak var shareB: UIButton!
    
    
  lazy var audioFileUrl : URL = {
        let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return docUrl.appendingPathComponent("myrecording.m4a")
    }()
    
    lazy var recorder : AVAudioRecorder? = {
        
        let recordSettings = [
            
            AVFormatIDKey : kAudioFormatMPEG4AAC,
            AVSampleRateKey : 12000,
            AVNumberOfChannelsKey : 1,
            AVEncoderAudioQualityKey: kAudioCodecQuality_High
        ] as [String : Any]
        do{
            return try AVAudioRecorder(url: audioFileUrl, settings: recordSettings)
        }catch{
            print("Recorder could not be selected : \(error.localizedDescription)")
            return nil
        }
        
    }()
    
    lazy var player : AVAudioPlayer? = {
        
        do{
            let pl = try AVAudioPlayer(contentsOf: audioFileUrl)
            pl.delegate = self
            pl.setVolume(100, fadeDuration: 15)
            return pl
        }catch{
            showAlert(title: "ERROR", msg: "Unable to play audio file")
            return nil
        }
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        setUpAVSession()
    }
    
    func setUpAVSession(){
        
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setCategory(.playAndRecord)
            try session.setActive(true)
            //session.setInputDataSource()
            session.requestRecordPermission { allowed in
                print("Permission granted")
                DispatchQueue.main.async {
                    self.recordB.isEnabled = allowed
                    self.recorder?.delegate = self
                }
                
            }
        }catch{
            print("ERROR : Creating session : \(error.localizedDescription)")
        }
        
    }

    @IBAction func recordClicked(_ sender: Any) {
        
        
        //1. prepare for recording
        
        guard let recorder = recorder else {
            
            showAlert(title: "ERROR", msg: "Recorder not available, try again after some time.")
            return
        }
        
        if recorder.prepareToRecord() {
            
            recorder.record()
            showAlert(title: "SUCCESS", msg: "Recording Started")
            
            recordB.isEnabled = false
            stopB.isEnabled = true
            
            infoL.text = "Recording Started"
            
        }else{
            
            showAlert(title: "ERROR", msg: "Recording could not be started")
        }
    }
    
    
    @IBAction func stopClicked(_ sender: Any) {
        
        
       
        if recorder?.isRecording == true{
            
            recorder?.stop()
            showAlert(title: "RECORDING STOPPED", msg: "")
            
            recordB.isEnabled = true
            stopB.isEnabled = false
            playB.isEnabled = true
            
            infoL.text = "Recording Stopped"
            shareB.isEnabled = true
        }
        
        if player?.isPlaying == true{
            
            player?.stop()
            
            showAlert(title: "STOPPED PLAYING", msg: "")
            playB.isEnabled = true
            stopB.isEnabled = false
            recordB.isEnabled = true
            shareB.isEnabled = true
            
        }
       
        
    }
    
    
    
    @IBAction func playClicked(_ sender: Any) {
        
        
        guard let player = player else{
            showAlert(title: "ERROR", msg: "Cannot Play the file")
            return
        }
        
       // player.delegate = self
        
        if player.prepareToPlay(){
            //showAlert(title: "PLAYING SUCCESSFULLY", msg: "")
            player.play()
            
            playB.isEnabled = false
            recordB.isEnabled = false
            stopB.isEnabled = true
            
            infoL.text = "Playback in progress..."
            
        }else{
            showAlert(title: "ERROR", msg: "Cannot play the audio file")
        }
        
        
    }
    
    
    var vc : UIDocumentInteractionController?
    
    @IBAction func shareClicked(_ sender: Any) {
        
       
        vc = shareFile(fileUrl: audioFileUrl)
        vc?.delegate = self
        vc?.presentOptionsMenu(from: view.frame, in: view, animated: false)
        
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


extension AudioVC : AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            print("Recording finished successfully")
            playB.isEnabled = true
        }else{
            print("Recording finished with error")
        }
    }
}

extension AudioVC : AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag{
            showAlert(title: "STOPPED PLAYING", msg: "")
            playB.isEnabled = true
            stopB.isEnabled = false
            recordB.isEnabled = true
            infoL.text = "Playback finished"
        }
        
        print("Playing completed \(flag)")
    }
}

extension AudioVC : UIDocumentInteractionControllerDelegate {
    
    func documentInteractionController(_ controller: UIDocumentInteractionController, didEndSendingToApplication application: String?) {
        print("Audio file shared with \(application!)")
    }
    
    func documentInteractionController(_ controller: UIDocumentInteractionController, willBeginSendingToApplication application: String?) {
        print("About to send file to \(application!)")
    }
}
