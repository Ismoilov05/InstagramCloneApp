//
//  ProfileInforHeaderCollectionReusableView.swift
//  InstagramCloneApp
//
//  Created by MuhammadQodir on 30.11.2022.
//

import UIKit
protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func ProfileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground

        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Your Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground

        return button
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "ismoilov.0505"
//button.setTitle("Posts", for: .normal)
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "This is first account"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    // Mark: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         addSubview()
        addButtonActions()
        backgroundColor = .systemBlue
        clipsToBounds = true
  }
    
    private func addSubview() {
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
    }
    
    private func addButtonActions() {
        followersButton.addTarget(self, action: #selector(didTapFollowersButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        postsButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: profilePhotoSize,
            height: profilePhotoSize).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width-10-profilePhotoSize)/3
        
        postsButton.frame =  CGRect(
            x: profilePhotoImageView.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        followersButton.frame =  CGRect(
            x: postsButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        followingButton.frame =  CGRect(
            x: followersButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        editProfileButton.frame =  CGRect(
            x: profilePhotoImageView.right,
            y: 5 + buttonHeight ,
            width: countButtonWidth*3 ,
            height: buttonHeight
        ).integral
        
        nameLabel.frame =  CGRect(
            x: 5,
            y: 5 + profilePhotoImageView.bottom,
            width: width - 10 ,
            height: 50
        ).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame =  CGRect(
            x: 5,
            y: 5 + nameLabel.bottom,
            width: width-10 ,
            height: bioLabelSize.height
        ).integral
    }
    
    // Mark: Action
    
    @objc private func  didTapFollowersButton() {
        delegate?.ProfileHeaderDidTapFollowersButton(self)
    }
    @objc private func  didTapFollowingButton() {
        delegate?.ProfileHeaderDidTapFollowingButton(self)
    }
    @objc private func  didTapPostsButton() {
        delegate?.ProfileHeaderDidTapPostButton(self)
    }
    @objc private func  didTapEditProfileButton() {
        delegate?.ProfileHeaderDidTapEditProfileButton(self)
    }
}
