//
//  ExtensionViewController.swift
//  AssignmentTask
//
//  Created by John on 09/08/22.
//

import Foundation
import UIKit
import YKPhotoCircleCrop
extension ViewController:YKCircleCropViewControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImage: UIImage?
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selectedImage = editedImage
        }
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectedImage = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
        let circleCropController = YKCircleCropViewController()
        circleCropController.image = selectedImage
        circleCropController.delegate = self
        present(circleCropController, animated: true, completion: nil)
    }
    
    
    func circleCropDidCropImage(_ image: UIImage) {
        imgCamera.image = image
        let data = image.pngData()
        if let image = data{
            DataBaseHelper.shareInstance.saveImage(data: image)
        }
    }
}
