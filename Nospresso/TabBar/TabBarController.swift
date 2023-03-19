import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    internal func setupBarController() {
        
        let mainMenu = UINavigationController(rootViewController: MainMenuCoordinator.createModule(navigationController: self.navigationController))
        let favorites = UINavigationController(rootViewController: FavoritesCoordinator.createModule(navigationController: self.navigationController))
        let bag = UINavigationController(rootViewController: BagCoordinator.createModule(navigationController: self.navigationController))
        
        self.setViewControllers([mainMenu, favorites, bag], animated: true)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = true
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Produtos"
        items[0].image = UIImage(systemName: "cart")
                                 
        items[1].title = "Favoritos"
        items[1].image = UIImage(systemName: "heart")
                                                          
        items[2].title = "Sacola"
        items[2].image = UIImage(systemName: "bag")
        
    }
}
