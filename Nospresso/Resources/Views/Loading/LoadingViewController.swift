import UIKit

class LoadingViewController: UIViewController {
    
    class func doNib() -> LoadingViewController {
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = Images.loader()
            
            return imageView
        }()
        
        let loadingViewController = LoadingViewController()
        loadingViewController.modalPresentationStyle = .overFullScreen
        loadingViewController.modalTransitionStyle = .crossDissolve
        loadingViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        loadingViewController.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        
        let horizontalConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: NSLayoutConstraint.Attribute.centerX,
                                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                                      toItem: loadingViewController.view,
                                                      attribute: NSLayoutConstraint.Attribute.centerX,
                                                      multiplier: 1,
                                                      constant: 0
        )
        
        let verticalConstraint = NSLayoutConstraint(item: imageView,
                                                    attribute: NSLayoutConstraint.Attribute.centerY,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: loadingViewController.view,
                                                    attribute: NSLayoutConstraint.Attribute.centerY,
                                                    multiplier: 1,
                                                    constant: 0
        )
        
        let widthConstraint = NSLayoutConstraint(item: imageView,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 120
        )
        
        let heightConstraint = NSLayoutConstraint(item: imageView,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 100
        )
        
        loadingViewController.view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        
        return loadingViewController
    }
    
}
