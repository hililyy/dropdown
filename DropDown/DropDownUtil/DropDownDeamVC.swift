//
//  DropDownDeamVC.swift
//  DropDown
//
//  Created by 강조은 on 2023/10/26.
//

import UIKit

class DropDownDeamVC: UIViewController {
    
    var parentFrame = CGRect()
    let tableView = DropDownTableView()
    let backgroundButton = UIButton(type: .custom)
    var delegate: DropDeamVCProtocol? = nil
    var selectedIndex: Int? = nil
    var selectedTitle: String? = nil
    var isEnableRotate = true
    var dropViewDelegate: DropViewProtocol? = nil
    
    init(frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        
        parentFrame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showList()
        initalize()
        tableView.contentsTableView.reloadData()
    }
    
    func showList() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.55,
                           initialSpringVelocity: 0.6,
                           options: .curveEaseOut) {
                self.tableView.frame.size.height = 120
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func hideList() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: .curveEaseOut) {
                self.tableView.frame.size.height = 0
                self.view.layoutIfNeeded()
            } completion: { _ in
                self.dismiss(animated: false)
            }
        }
    }
    
    func initalize() {
        view.backgroundColor = .clear
        
        view.addSubview(backgroundButton)
        view.addSubview(tableView)
        backgroundButton.frame = view.frame
        
        tableView.frame.size.width = parentFrame.width
        tableView.frame.size.height = 0
        tableView.frame.origin.x = parentFrame.origin.x
        tableView.frame.origin.y = parentFrame.origin.y + parentFrame.height
        tableView.tableViewTap = { index, text in
            self.selectedIndex = index
            self.selectedTitle = text
            self.back()
        }
        tableView.layer.shadowColor = UIColor.gray.cgColor
        tableView.layer.shadowOpacity = 0.8
        tableView.layer.shadowRadius = 5.0
        tableView.layer.shadowOffset = CGSize(width: 3, height: 3)
        tableView.layer.shadowPath = nil
        
        backgroundButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
    }
    
    @objc func back() {
        if isEnableRotate {
            isEnableRotate = false
            if let selectedIndex {
                delegate?.select(index: selectedIndex)
            }
            if let selectedTitle {
                dropViewDelegate?.tmp(text: selectedTitle)
            }
        }
        hideList()
    }
}

protocol DropDeamVCProtocol {
    func select(index: Int)
}
