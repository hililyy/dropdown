//
//  DropDownProtocol.swift
//  DropDown
//
//  Created by 강조은 on 2023/10/27.
//

import Foundation

protocol DropViewProtocol {
    func rotateImage()
    func changeBasicLabel(text: String?)
}

protocol DropDownDelegate {
    func select(index: Int)
}
