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
        contentView.backgroundColor = .clear
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func initSubviews() {
        contentView.addSubview(title)
    }
    
    func initConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            if selected{
                UIView.animate(withDuration: 0.2, animations: {
                    self.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
                }, completion: { finished in
                    UIView.animate(withDuration: 0.2) {
                        self.transform = .identity
                    }
                })
            }
        }
}
