//
//  ReusableTableViewHeaderFooter.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit
import Presentation
import SnapKit

public class ReusableTableViewHeaderFooter: UITableViewHeaderFooterView {
    //MARK: - Properties
    //MARK: UI
    private lazy var titleLabel: BaseLabel = {
        let view = BaseLabel(style: .title)
        
        return view
    }()
    
    
    //MARK: - Constuctor
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private methods
private extension ReusableTableViewHeaderFooter {
    func setupUI() {
        contentView.backgroundColor = UIColor.navigationBackground
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (maker) in
            maker.left.bottom.equalToSuperview().inset(Padding.small)
        }
    }
}


//MARK: - HeaderPresentableItem implementation
extension ReusableTableViewHeaderFooter: HeaderPresentableItem {
    public func set(title: String?) {
        titleLabel.text = title
    }
}
