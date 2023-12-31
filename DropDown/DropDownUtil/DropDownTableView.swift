//
//  DropDownTableView.swift
//  DropDown
//
//  Created by 강조은 on 2023/10/26.
//

import UIKit

class DropDownTableView: UIView {
    let datalist = ["1번","2번","3번","4번","5번","6번","7번","8번","9번","10번"]
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ContentsTableViewCell.self, forCellReuseIdentifier: "ContentsTableViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 5
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tableViewTap: (Int, String) -> Void = { _, _ in }
    
    func initTable() {
        tableView.dataSource = self
        tableView.delegate = self
        
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension DropDownTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentsTableViewCell", for: indexPath) as? ContentsTableViewCell else { return UITableViewCell() }
        cell.title.text = datalist[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewTap(indexPath.row, datalist[indexPath.row])
        print(indexPath.row)
    }
}
