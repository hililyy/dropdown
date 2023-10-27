//
//  DropDown.swift
//  DropDown
//
//  Created by 강조은 on 2023/10/26.
//

import UIKit

class DropDown: UIView {
    
    let basicView = UIView()
    let basicLabel = UILabel()
    let arrowImageView = UIImageView(image: UIImage(named: "icArrow"))
    
    let contentBackGroundTableView = UIView()
    var delegate: DropDownDelegate?
    var parentVC: UIViewController?
    
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
        basicView.backgroundColor = UIColor(named: "gray1")
        basicView.layer.cornerRadius = 5
        basicLabel.text = "선택해주셩"
    }
    
    @objc func openDropDeamView() {
        rotetdArrowImage()
        
        guard let frame = superview?.frame else { return }
        
        let deamVC = DropDownDeamVC(frame: frame)
        deamVC.delegate = delegate
        deamVC.dropViewDelegate = self
        
        parentVC?.present(deamVC, animated: false)
    }
    
    func rotetdArrowImage() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.35,
                           delay: 0,
                           options: .curveEaseOut) {
                self.arrowImageView.transform = self.arrowImageView.transform.rotated(by: .pi)
                self.layoutIfNeeded()
            }
        }
    }
    
    func setTabGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openDropDeamView))
        basicView.addGestureRecognizer(tapGesture)
    }
    
    func initSubviews() {
        addSubview(basicView)
        basicView.addSubview(basicLabel)
        basicView.addSubview(arrowImageView)
        addSubview(contentBackGroundTableView)
    }
    
    func initConstraints() {
        basicView.translatesAutoresizingMaskIntoConstraints = false
        basicLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        contentBackGroundTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            basicView.topAnchor.constraint(equalTo: topAnchor),
            basicView.leftAnchor.constraint(equalTo: leftAnchor),
            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
            basicView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            basicLabel.topAnchor.constraint(equalTo: basicView.topAnchor),
            basicLabel.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            basicLabel.trailingAnchor.constraint(equalTo: arrowImageView.trailingAnchor),
            basicLabel.bottomAnchor.constraint(equalTo: basicView.bottomAnchor),
            
            arrowImageView.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 13),
            arrowImageView.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: -13),
            arrowImageView.heightAnchor.constraint(equalTo: arrowImageView.widthAnchor, multiplier: 1.0),
            arrowImageView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -15),
            
            contentBackGroundTableView.topAnchor.constraint(equalTo: basicView.bottomAnchor),
            contentBackGroundTableView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor),
            contentBackGroundTableView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor),
            contentBackGroundTableView.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: 100)
        ])
    }
}

extension DropDown: DropViewProtocol{
    func rotateImage() {
        rotetdArrowImage()
    }
    
    func changeBasicLabel(text: String?) {
        if let text {
            basicLabel.text = text
        }
    }
}
