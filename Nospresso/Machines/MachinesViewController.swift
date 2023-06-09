import UIKit
import SnapKit
import Rswift

internal class MachinesViewController: UIViewController, LoadingViewType {
    
    var loadingScreen: LoadingViewController?
    
    // MARK: Module
    internal var presenter: MachinesPresenter? = nil
    
    private lazy var errorView: ErrorView = {
        let errorView = ErrorView()
        errorView.delegate = self
        errorView.isHidden = true
        
        return errorView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    internal let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = Colors.maybeWhite()
        
        return collection
    }()
    
    
    //MARK: Override Methods
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

//MARK: MachinesViewControllerProtocol
extension MachinesViewController: MachinesViewControllerProtocol {
    
    internal func reloadData() {
        collectionView.reloadData()
    }
    
    internal func showLoad() {
        showLoading()
    }
    
    internal func hideLoad() {
        hideLoading()
    }
    
    internal func hideError() {
        errorView.isHidden = true
    }
    
    internal func showError() {
        errorView.isHidden = false
    }
}

//MARK: ErrorViewDelegateProtocol
extension MachinesViewController: ErrorViewDelegateProtocol {
    
    func tryAgainButtonTapped() {
        presenter?.tryAgainButtonTapped()
    }
    
}

extension MachinesViewController: CodableView {
    
    internal func buildViews() {
        view.addSubview(separatorView)
        view.addSubview(collectionView)
        view.addSubview(errorView)
    }
    
    internal func configViews() {
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = Strings.machines()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.view.backgroundColor = Colors.mainMenuMachinesButton()
        
        //MARK: TableView Register
        collectionView.dataSource = presenter
        collectionView.delegate = presenter
        collectionView.register(MachineCollectionViewCell.self, forCellWithReuseIdentifier: "MachineCell")
    }
    
    internal func configConstraints() {
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(collectionView.snp.top)
            make.height.equalTo(1)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        errorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
