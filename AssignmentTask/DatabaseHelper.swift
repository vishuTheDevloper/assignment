

import Foundation
import UIKit
import CoreData
class DataBaseHelper {
    static let shareInstance = DataBaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    func saveImage(data: Data) {
        let imageInstance = ImageEdited(context: context)
        imageInstance.imageCropped = data
        do {
            try context.save()
            print("Image is saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func fetchImage()-> [ImageEdited] {
                do {
                var fetchingImage = [ImageEdited]()
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageEdited")
                    fetchingImage = try self.context.fetch(fetchRequest) as! [ImageEdited]
                    return fetchingImage
                } catch {
                    print("Error while fetching the image")
                    return []
                }
    }

}
