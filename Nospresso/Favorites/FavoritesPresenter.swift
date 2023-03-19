import UIKit

internal class FavoritesPresenter: NSObject {
    
    // MARK: Module
    internal var view: FavoritesViewControllerProtocol?
    internal var favorites: [Favorite]?
    
    internal override init() {
        super.init()
    }
    
    internal func validateFavorites() {
        self.favorites = Favorites.instance.itens
        if favorites?.count == 0 {
            view?.hiddenTableView()
        } else {
            view?.reloadData()
            view?.showTableView()
        }
    }
    
}

// MARK: FavoritesPresenterProtocol
extension FavoritesPresenter: FavoritesPresenterProtocol {
    
    internal func moduleLoaded() {
        validateFavorites()
    }
    
    internal func viewDidAppear() {
        validateFavorites()
    }
    
}

// MARK: TableViewDelegate
extension FavoritesPresenter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let acao = UIContextualAction(style: .destructive, title: "Remover") { (actiom, view, handler) in
            let favorite = Favorites.instance.itens[indexPath.row]
            Favorites.instance.remove(favorite: favorite)
            self.favorites?.remove(at: indexPath.row)
            self.view?.removeRow(at: [indexPath], with: .left)

            handler(true)
            self.validateFavorites()
        }

        let config = UISwipeActionsConfiguration(actions: [acao])
        return config
    }
    
}

// MARK: TableViewDataSource
extension FavoritesPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = R.color.headerTableView()
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .black
        header.textLabel?.font = UIFont(name: "OpenSans-Italic", size: 21)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteTableViewCell
        if let favorites = favorites {
            cell.setup(for: favorites[indexPath.row])
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

