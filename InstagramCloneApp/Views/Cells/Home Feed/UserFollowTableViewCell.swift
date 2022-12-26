//
//  userFollowTableViewCell.swift
//  InstagramCloneApp
//
//  Created by MuhammadQodir on 6.12.2022.
//

import UIKit
protocol UserFollowTableViewCellDelegate: AnyObject {
    func didTapFollowUnfollowButton(model: String)
}
class UserFollowTableViewCell: UITableViewCell {

    static let identifier = "UserFollowTableViewCell"
    public weak var delegate: UserFollowTableViewCellDelegate?
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "MuhammadQodir"
        return label
    }()
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "@Ismoilov.0505"
        return label
    }()
    private let followButton: UIButton = {
        let followButton = UIButton()
        followButton.backgroundColor = .link
        return followButton
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(profileImageView)
        contentView.addSubview(followButton)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        usernameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.layer.borderWidth = 0
        followButton.backgroundColor =  nil
    }
    
    public func configure(with model: String) {
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.frame = CGRect(x: 3,
                                        y: 3,
                                        width: contentView.height-6,
                                        height: contentView.height-6)
        profileImageView.layer.cornerRadius = profileImageView.height/2.0
 
        
        let  buttonWith = contentView.width > 500 ? 220.0 : contentView.width/3
        followButton.frame =  CGRect(x: contentView.width-5-buttonWith,
                                     y: 5,
                                     width: buttonWith,
                                     height: contentView.height-10)
        
        let labelHeight =  contentView.height/2
        nameLabel.frame = CGRect(x: profileImageView.right+5,
                                 y: 0,
                                 width: contentView.width-3-profileImageView.width-buttonWith,
                                 height: labelHeight)
        usernameLabel.frame = CGRect(x: profileImageView.right+5,
                                     y: nameLabel.bottom,
                                     width: contentView.width-3-profileImageView.width-buttonWith,
                                     height: labelHeight)
        
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
