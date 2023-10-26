//
//  DropDownTableVC.swift
//  DropDown
//
//  Created by 강조은 on 2023/10/26.
//

import UIKit

class DropDownTableVC: UIViewController {
    let datalist = ["1번","2번","3번","4번","5번","1번","2번","3번","4번","5번"]
    
    var contentsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ContentsTableViewCell.self, forCellReuseIdentifier: "ContentsTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentsTableView.dataSource = self
        contentsTableView.delegate = self
        
        view.addSubview(contentsTableView)
        
        contentsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            contentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension DropDownTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contentsTableView.dequeueReusableCell(withIdentifier: "ContentsTableViewCell", for: indexPath) as? ContentsTableViewCell else { return UITableViewCell() }
        cell.title.text = datalist[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
