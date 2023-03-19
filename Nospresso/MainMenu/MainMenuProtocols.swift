// View -> Presenter
internal protocol MainMenuPresenterProtocol {
    
    func coffesButtonTapped()
    func machinesButtonTapped()
    func accessoriesButtonTapped()
    
}

// Presenter -> Coordinator
internal protocol MainMenuCoordinatorProtocol {
    
    func openCoffees()
    func openMachines()
    func openAccessories()
    
}


