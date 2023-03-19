import UIKit
import Nuke

public extension UIImageView {
    
    func loadImage(from url: String) {
        guard let url = URL(string: url) else { return }
        
        Nuke.loadImage(with: url,
                       options: ImageLoadingOptions(placeholder: UIImage(named:"loader")),
                       into: self)
    }
    
}
