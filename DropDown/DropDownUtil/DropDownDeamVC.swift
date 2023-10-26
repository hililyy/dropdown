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
    init(frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
        parentFrame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initalize()
    }
    
    func initalize() {
        self.view.backgroundColor = .clear
        let tgr = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.view.addGestureRecognizer(tgr)
        
        
        self.view.addSubview(tableView)
        tableView.frame.size.width = parentFrame.width
        tableView.frame.size.height = 0
        tableView.frame.origin.x = parentFrame.origin.x
        tableView.frame.origin.y = parentFrame.origin.y + parentFrame.height
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.7,
                           options: .curveEaseOut) {
                self.tableView.frame.size.height = 120
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func tap() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.7,
                           options: .curveEaseOut) {
                self.tableView.frame.size.height = 0
                self.view.layoutIfNeeded()
            } completion: { _ in
                self.dismiss(animated: true)
            }
        }
    }
}
