//
//  IGFeedTableViewCell.swift
//  InstagramCloneApp
//
//  Created by MuhammadQodir on 25.11.2022.
//

import UIKit

class IGFeedPostTableViewCell: UITableViewCell {

    static let identifier = "IGFeedTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
