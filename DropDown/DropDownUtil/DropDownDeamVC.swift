//
//  DropDownDeamVC.swift
//  DropDown
//
//  Created by 강조은 on 2023/10/26.
//

import UIKit

class DropDownDeamVC: UIViewController {
    var parentFrame = CGRect()
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
        self.view.backgroundColor = .clear
        let tgr = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.view.addGestureRecognizer(tgr)
        let child = DropDownTableVC()
        self.addChild(child)
        self.view.addSubview(child.view)
        
        child.didMove(toParent: self)
        child.view.frame = parentFrame
        child.view.frame.size.width = parentFrame.width
        child.view.frame.size.height = 120
        child.view.frame.origin.x = parentFrame.origin.x
        child.view.frame.origin.y = parentFrame.origin.y + parentFrame.height
        child.view.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin]
    }
    
    @objc func tap() {
        print("farewell")
        self.dismiss(animated: true)
    }
}
