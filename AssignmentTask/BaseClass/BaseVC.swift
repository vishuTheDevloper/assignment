
import Foundation
import UIKit


class BaseViewController: UIViewController {

    //MARK: Lifecycles
    override func viewDidLoad() {
       
    }
    
}
extension BaseViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func presentPickerSelector(view:UIButton){
        
        let picker = UIImagePickerController()
        picker.delegate = self
//        picker.allowsEditing = true
        
        let alert = UIAlertController(title: "Select image from", message: nil, preferredStyle:    UIAlertController.Style.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (handler) in
            picker.allowsEditing = false
            picker.sourceType = .camera
            picker.sourceType = UIImagePickerController.SourceType.camera
            
            picker.showsCameraControls = true
           
            picker.cameraCaptureMode = .photo

            self.present(picker, animated: true, completion: nil)
            
        }
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { (handler) in
            picker.allowsEditing = true
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (handler) in
            
        }
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        if let presenter = alert.popoverPresentationController {
            presenter.sourceView = view
            presenter.sourceRect = view.bounds
        }
        present(alert, animated: true)
    }
}
