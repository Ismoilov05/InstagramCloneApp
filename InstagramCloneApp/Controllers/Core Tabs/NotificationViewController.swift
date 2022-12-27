//
//  NotificationViewController.swift
//  InstagramCloneApp
//
//  Created by MuhammadQodir on 23.11.2022.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    private let  tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NotificationLikeEventTableViewCell.self,
                           forCellReuseIdentifier: NotificationLikeEventTableViewCell.identifier)
        tableView.register(NotificationFollowEventTableViewCell.self,
                           forCellReuseIdentifier: NotificationFollowEventTableViewCell.identifier)
        tableView.isHidden = false
        return tableView
    }()
    private let spinnerView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped =  true
        spinner.tintColor = .label
        return spinner
        
    }()
    private lazy var noNotifications = NoNotificationView()
    // Mark: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(noNotifications)
        title = "Notifications"
        view.addSubview(tableView)
        view.addSubview(spinnerView)
        //spinnerView.startAnimating()
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        addNoNotificationView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        spinnerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinnerView.center = view.center
    }
    
    private func addNoNotificationView() {
        tableView.isHidden = true
        view.addSubview(tableView)
        noNotifications.frame = CGRect(x: 0,
                                       y: 0,
                                       width: view.width/2,
                                       height: view.width/4)
        noNotifications.center = view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    

}
