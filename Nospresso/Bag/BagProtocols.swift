import UIKit

// View -> Presenter
internal protocol BagsPresenterProtocol {

    func moduleLoaded()
    func viewDidAppear()
    
}

// Presenter -> View
internal protocol BagsViewControllerProtocol {
    
    func hiddenTableView()
    func showTableView()
    func hideLoad()
    func showLoad()
    func reloadData()
    func removeRow(at indexPath: [IndexPath], with local: UITableView.RowAnimation)
    
}

// Presenter -> Repository
internal protocol BagsRepositoryInputProtocol {
    
    func getBags()
    func removeBag(id: Int)
    
}

// Repository -> Presenter
internal protocol BagsRepositoryOutputProtocol: AnyObject {
    
    func getBagsSucceeded(_ data: [Bag])
    func getBagsFailed()
    
}
