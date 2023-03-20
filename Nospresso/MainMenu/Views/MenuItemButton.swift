import UIKit

internal class MenuItemButton: UIView {
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    private lazy var textContentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = Fonts.get(type: .Bold, size: 26)
        title.textColor = .black
        
        return title
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.font = Fonts.get(type: .Light, size: 14)
        subtitle.textColor = .gray
        
        return subtitle
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    internal init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    //MARK: Setup
    internal func setup(title: String, subtitle: String, image: UIImage?, backgroundCollor: UIColor?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = image
        self.backgroundColor = backgroundCollor
    }
    
    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MenuItemButton: CodableView {
    
    internal func buildViews() {
        textContentView.addSubview(titleLabel)
        textContentView.addSubview(subtitleLabel)
        containerStackView.addArrangedSubview(textContentView)
        containerStackView.addArrangedSubview(imageView)
        self.addSubview(containerStackView)
    }
    
    internal func configConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(28)
            make.bottom.equalToSuperview().inset(20)
        }
        imageView.snp.makeConstraints { make in
            make.width.equalTo(130)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(subtitleLabel.snp.top).offset(-10)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.trailing.bottom.leading.equalToSuperview()
        }
    }
    
}
