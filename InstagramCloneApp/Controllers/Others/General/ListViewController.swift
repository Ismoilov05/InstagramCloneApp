//
//  ListViewController.swift
//  InstagramCloneApp
//
//  Created by MuhammadQodir on 23.11.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    
 private   let data: [String]
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserFollowTableViewCell.self,
                           forCellReuseIdentifier: UserFollowTableViewCell.identifier)
        return tableView
    }()
    init(data: [String]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: UserFollowTableViewCell.identifier,
                                                  for: indexPath) as! UserFollowTableViewCell
        cell.configure(with: "")
      //  cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
        let model = data[indexPath.row]
         
    }
}