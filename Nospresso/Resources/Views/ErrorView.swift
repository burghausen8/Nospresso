import UIKit
import SnapKit
import Rswift

protocol ErrorViewDelegateProtocol: AnyObject {
    
    func tryAgainButtonTapped()
    
}

internal class ErrorView: UIView {
    
    internal var delegate: ErrorViewDelegateProtocol?
    
    internal lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.greenShrek()
        button.setTitle(Strings.addToBag(), for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(tryAgainButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func tryAgainButtonTapped() {
        delegate?.tryAgainButtonTapped()
    }
    
}

extension ErrorView: CodableView {
    
    internal func buildViews() {

        contentView.addSubview(button)
        
        addSubview(contentView)
    }
    
    internal func configViews() {
        backgroundColor = .white
        
    }
    
    internal func configConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        button.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(47)
            make.bottom.equalTo(contentView.snp.bottom).inset(20)
        }
    }
    
}
