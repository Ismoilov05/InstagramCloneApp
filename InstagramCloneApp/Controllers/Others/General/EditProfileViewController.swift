//
//  EditViewController.swift
//  InstagramCloneApp
//
//  Created by MuhammadQodir on 23.11.2022.
//

import UIKit

struct EditProfileFormModel {
    let label: String
    let placeholder: String
    var value: String?
}

final class EditProfileViewController: UIViewController, UITableViewDataSource {
    
   // public var model: EditProfileFormModel?
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(FormTableViewCell.self,
                           forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableview
    }()
    
    private var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.tableHeaderView =  createTableHeaderView()
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapCancel))
        
        configureModels()
    }
    
    
    private func configureModels() {
        // name, username, website, bio
        let section1Labels = ["name","Username", "Bio"]
        var section1 = [EditProfileFormModel]()
        for label in section1Labels {
            let model = EditProfileFormModel(label: label,
                                             placeholder:  "Enter \(label)...",
                                             value: nil)
            section1.append(model)
        }
        models.append(section1)
        
        // email, phone, gender
        let section2Labels = ["Email","Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        for label in section2Labels {
            let model = EditProfileFormModel(label: label,
                                             placeholder:  "Enter \(label)...",
                                             value: nil)
            section2.append(model)
        }
        models.append(section2)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: view.width,
                                          height: view.height/4).integral)
        let size  = header.height/1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.width - size)/2,
                                                        y: (header.height - size)/2,
                                                        width: size,
                                                        height: size))
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2.0
        profilePhotoButton.addTarget(self,
                                     action: #selector(didTapProfileButton),
                                     for: .touchUpInside)
        profilePhotoButton.tintColor = .label
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"),
                                    for: .normal)
        profilePhotoButton.layer.borderWidth =  1
        profilePhotoButton.layer.borderColor =  UIColor.secondarySystemBackground.cgColor
        
        return header
    }
    
    @objc private func didTapProfileButton() {
        
    }
    
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[section].count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let models = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier,
            for: indexPath) as! FormTableViewCell
        cell.configure(with: models)
       // cell.textLabel?.text = model.label
        cell.delegate = self
        return cell
    }
   
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private information"
    }
    // MARK: - Action
    @objc private func  didTapSave() {
        // save info to database
        dismiss(animated: true,
                completion: nil) 
    }
     
    @objc private func  didTapCancel() {
        dismiss(animated: true,
                completion: nil)
    }
    
    @objc private func  didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "Change Profile Picture",
                                            preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "take photo", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Chooser from library", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "take photo", style: .cancel, handler: nil))

        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        
        present(actionSheet, animated: true)
        
        
    }
}
extension EditProfileViewController: FormTableViewCellDelegate {
    func formTableViewCell(_: FormTableViewCell, didUpdateField UpdatedModel: EditProfileFormModel?) {
        print(UpdatedModel?.value ?? "nil")
    }
    
    
}
