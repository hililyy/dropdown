//
//  DropDownTableView.swift
//  DropDown
//
//  Created by 강조은 on 2023/10/26.
//

import UIKit

class DropDownTableView: UIView {
    let datalist = ["1번","2번","3번","4번","5번","1번","2번","3번","4번","5번"]
    
    var contentsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ContentsTableViewCell.self, forCellReuseIdentifier: "ContentsTableViewCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initTable() {
        contentsTableView.dataSource = self
        contentsTableView.delegate = self
        
        addSubview(contentsTableView)
        
        contentsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentsTableView.topAnchor.constraint(equalTo: topAnchor),
            contentsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension DropDownTableView: UITableViewDelegate, UITableViewDataSource {
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
