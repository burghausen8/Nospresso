import UIKit

// View -> Presenter
internal protocol FavoritesPresenterProtocol {

    func moduleLoaded()
    func viewDidAppear()
    
}

// Presenter -> View
internal protocol FavoritesViewControllerProtocol {
    
    func hiddenTableView()
    func showTableView()
    func reloadData()
    func removeRow(at indexPath: [IndexPath], with local: UITableView.RowAnimation)
    
}
