//
//  ContentsTableViewCell.swift
//  DropDown
//
//  Created by 강조은 on 2023/10/26.
//

import UIKit

class ContentsTableViewCell: UITableViewCell {
    let title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
        initSubviews()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        title.textColor = .black
        backgroundColor = .clear
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func initSubviews() {
        contentView.addSubview(title)
    }
    
    func initConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
