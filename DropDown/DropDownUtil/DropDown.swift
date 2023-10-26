//
//  DropDown.swift
//  DropDown
//
//  Created by 강조은 on 2023/10/26.
//

import UIKit

class DropDown: UIView {
    let dropView = UIView()
    let basicLabel = UILabel()
    let arrowImageView = UIImageView(image: UIImage(named: "icArrow"))
    let contentBackGroundTableView = UIView()
    var handler: () -> () = {}

    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        setTabGesture()
        initSubviews()
        initConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        backgroundColor = .white
        dropView.backgroundColor = UIColor(named: "gray1")
        dropView.layer.cornerRadius = 10
        basicLabel.text = "선택해주셩"
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        handler()
    }

    func setTabGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        dropView.addGestureRecognizer(tapGesture)
    }
    
    func initSubviews() {
        addSubview(dropView)
        dropView.addSubview(basicLabel)
        dropView.addSubview(arrowImageView)
        addSubview(contentBackGroundTableView)
    }

    func initConstraints() {
        dropView.translatesAutoresizingMaskIntoConstraints = false
        basicLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        contentBackGroundTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dropView.topAnchor.constraint(equalTo: topAnchor),
            dropView.leftAnchor.constraint(equalTo: leftAnchor),
            dropView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dropView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            basicLabel.topAnchor.constraint(equalTo: dropView.topAnchor),
            basicLabel.leadingAnchor.constraint(equalTo: dropView.leadingAnchor, constant: 10),
            basicLabel.trailingAnchor.constraint(equalTo: arrowImageView.trailingAnchor),
            basicLabel.bottomAnchor.constraint(equalTo: dropView.bottomAnchor),
            
            arrowImageView.topAnchor.constraint(equalTo: dropView.topAnchor, constant: 13),
            arrowImageView.bottomAnchor.constraint(equalTo: dropView.bottomAnchor, constant: -13),
            arrowImageView.heightAnchor.constraint(equalTo: arrowImageView.widthAnchor, multiplier: 1.0),
            arrowImageView.trailingAnchor.constraint(equalTo: dropView.trailingAnchor, constant: -15),
            
            contentBackGroundTableView.topAnchor.constraint(equalTo: dropView.bottomAnchor),
            contentBackGroundTableView.leadingAnchor.constraint(equalTo: dropView.leadingAnchor),
            contentBackGroundTableView.trailingAnchor.constraint(equalTo: dropView.trailingAnchor),
            contentBackGroundTableView.bottomAnchor.constraint(equalTo: dropView.bottomAnchor, constant: 100)
        ])
    }
}
