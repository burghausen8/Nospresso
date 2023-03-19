import UIKit
import SwiftUI

internal class MachinesPresenter: NSObject {
    
    // MARK: Module
    internal var view: MachinesViewControllerProtocol?
    internal var coordinator: MachinesCoordinatorProtocol?
    internal var repository: MachinesRepositoryInputProtocol?
    internal var machines: [Machine]?
    
    internal override init() {
        super.init()
    }
    
}

// MARK: MachinesPresenterProtocol
extension MachinesPresenter: MachinesPresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoad()
        repository?.getMachines()
    }
    
}

//MARK: UICollectionViewDelegate
extension MachinesPresenter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (collectionView.frame.width - 16) / 2 - 16,
              height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 20,
              left: 16,
              bottom: 20,
              right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let machines = machines {
            coordinator?.openMachineDetail(with: machines[indexPath.item])
        }
    }
}

//MARK: UICollectionViewDataSource
extension MachinesPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        machines?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MachineCell", for: indexPath) as! MachineCollectionViewCell
        
        if let machines = machines {
            cell.setup(for: machines[indexPath.item])
        }
        
        return cell
    }
}

//MARK: MachinesRepositoryOutputProtocol
extension MachinesPresenter : MachinesRepositoryOutputProtocol {
    
    func getMachinesSucceeded(_ data: MachinesResponse) {
        self.machines = data.machines
        view?.hideLoad()
        view?.reloadData()
    }
    
    func getMachinesFailed(_ errorMessage: String) {
        view?.hideLoad()
        print(errorMessage)
    }
    
}

