import UIKit

internal class BagsPresenter: NSObject {
    
    // MARK: Module
    internal var view: BagsViewControllerProtocol?
    internal var repository: BagsRepositoryInputProtocol?
    internal var bags: [Bag]?
    
    internal override init() {
        super.init()
    }
    
    internal func validateBags() {
        if bags?.count == 0 {
            view?.hiddenTableView()
        } else {
            view?.reloadData()
            view?.showTableView()
        }
    }
    
}

// MARK: BagsPresenterProtocol
extension BagsPresenter: BagsPresenterProtocol {
    
    internal func moduleLoaded() {
        repository?.getBags()
    }
    
    internal func viewDidAppear() {
        repository?.getBags()
    }
    
}

// MARK: BagRepositoryOutputProtocol
extension BagsPresenter: BagsRepositoryOutputProtocol {
    
    func getBagsSucceeded(_ data: [Bag]) {
        self.bags = data
        DispatchQueue.main.async {
            self.validateBags()
        }
    }
    
    func getBagsFailed() {
        DispatchQueue.main.async {
            self.validateBags()
        }
    }
    
}

// MARK: TableViewDelegate
extension BagsPresenter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let acao = UIContextualAction(style: .destructive, title: "Remover") { (actiom, view, handler) in
            if let bags = self.bags {
                let bag = bags[indexPath.row]
                self.repository?.removeBag(id: bag.id)
                self.bags?.remove(at: indexPath.row)
                self.view?.removeRow(at: [indexPath], with: .left)
            }
            

            handler(true)
            self.validateBags()
        }

        let config = UISwipeActionsConfiguration(actions: [acao])
        return config
    }
    
}

// MARK: TableViewDataSource
extension BagsPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bags?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = Colors.headerTableView()
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .black
        header.textLabel?.font = Fonts.get(type: .Italic, size: 21)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BagCell", for: indexPath) as! BagTableViewCell
        if let bags = bags {
            cell.setup(for: bags[indexPath.row])
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

