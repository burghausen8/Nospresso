import UIKit

protocol LoadingViewType: AnyObject {
    
    var loadingScreen: LoadingViewController? { get set }
    
    func showLoading()
    func hideLoading()
    
}

extension LoadingViewType where Self: UIViewController {
    
    func showLoading() {
        showLoading(conclusion: nil)
    }
    
    func hideLoading() {
        hideLoading(conclusion: nil)
    }
    
    func showLoading(conclusion: Conclusion? = nil) {
        DispatchQueue.main.async {
            self.loadingScreen = LoadingViewController.doNib()
            self.present(self.loadingScreen!, animated: true, completion: conclusion)
        }
    }
    
    func hideLoading(conclusion: Conclusion? = nil) {
        DispatchQueue.main.async {
            self.loadingScreen?.dismiss(animated: true, completion: conclusion)
            self.loadingScreen = nil
        }
    }
    
}


typealias Conclusion = () -> Void
