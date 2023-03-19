// View -> Presenter
internal protocol MachinesPresenterProtocol {
    
    func viewDidLoad()
    
}

// Presenter -> Coordinator
internal protocol MachinesCoordinatorProtocol {
    
    func openMachineDetail(with machine: Machine)
    
}

// Presenter -> Repository
internal protocol MachinesRepositoryInputProtocol {
    
    func getMachines()
    
}

// Presenter -> View
internal protocol MachinesViewControllerProtocol {
    
    func reloadData()
    func showLoad()
    func hideLoad()
    
}

// Repository -> Presenter
internal protocol MachinesRepositoryOutputProtocol: AnyObject {
    
    func getMachinesSucceeded(_ data: MachinesResponse)
    func getMachinesFailed(_ errorMessage: String)
    
}
