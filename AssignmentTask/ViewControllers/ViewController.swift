//
//  ViewController.swift
//  AssignmentTask
//
//  Created by John on 09/08/22.
//

import UIKit
import YKPhotoCircleCrop
class ViewController: BaseViewController {
    
    @IBOutlet weak var imgCamera: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
    }
    @IBAction func actionOpenCamera(_ sender: UIButton) {
        presentPickerSelector(view: sender)
    }
    
    
    func getImage() {
        let image =  DataBaseHelper.shareInstance.fetchImage()
        if !image.isEmpty{
            if let croppedImage = image.last?.imageCropped{
                DispatchQueue.main.async {
                    self.imgCamera.image = UIImage(data: croppedImage)
                }
            }
            
        }
    }
}



