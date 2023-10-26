//
//  MyVC.swift
//  DropDown
//
//  Created by 강조은 on 2023/10/26.
//

import UIKit

class MyVC: UIViewController {
    
    var dropView = DropDown()
    var dropDownFrameView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSubView()
        initConstraints()
    }
    
    func addSubView() {
        view.addSubview(dropDownFrameView)
        dropDownFrameView.addSubview(dropView)
    }
    
    func initConstraints() {
        dropDownFrameView.translatesAutoresizingMaskIntoConstraints = false
        dropView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dropDownFrameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropDownFrameView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dropDownFrameView.heightAnchor.constraint(equalToConstant: 40),
            dropDownFrameView.widthAnchor.constraint(equalToConstant: 150),
            
            dropView.topAnchor.constraint(equalTo: dropDownFrameView.topAnchor),
            dropView.leftAnchor.constraint(equalTo: dropDownFrameView.leftAnchor),
            dropView.trailingAnchor.constraint(equalTo: dropDownFrameView.trailingAnchor),
            dropView.bottomAnchor.constraint(equalTo: dropDownFrameView.bottomAnchor)
        ])
        
        dropView.handler = {
            print("frame: \(self.dropDownFrameView.frame)")
            self.present(DropDownDeamVC(frame: self.dropDownFrameView.frame), animated: true)
        }
    }
}
