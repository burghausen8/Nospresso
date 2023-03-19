import UIKit
import SnapKit

internal class BagViewController: UIViewController {
    
    // MARK: Module
    internal var presenter: BagPresenter? = nil
    
    private lazy var contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Fora do ar"
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: Override Methods
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

// MARK: BagViewProtocol
extension BagViewController: BagViewProtocol {
    
}

extension BagViewController: CodableView {
    
    internal func buildViews() {
        contentView.addSubview(label)
        view.addSubview(contentView)
    }
    
    internal func configViews() {
        view.backgroundColor = .white
    }
    
    internal func configConstraints() {
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
