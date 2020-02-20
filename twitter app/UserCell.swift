//
//  UserCell.swift
//  twitter app
//
//  Created by Ahmed.S.Elserafy on 9/23/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import LBTAComponents

class userCell: DatasourceCell {
    // use this func to get access each one of these array items(what cells contain)
    override var datasourceItem: Any? {
        didSet {
            // downcast the "datasourceItem as user", and if you dont really do so, just totally return and exit out of this, and if it is successful downcast the user, and execute the following steps(the rest of label setup code)
            guard let user = datasourceItem as? User else { return }
            nameLabel.text = user.name
            usernameLabel.text = user.username
            bioTextView.text = user.bio
            profileImageView.loadImage(urlString: user.profileImageUrl)
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ahmed Samir"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@ahmedElserafy"
        label.textColor = UIColor(r: 124, g: 131, b: 139)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        // it is clipped to match the bounds
        // Whether layer.maskToBounds, or clipsToBounds
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        textView.text = "iOS developer"
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = .clear
        return textView
    }()
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = titleColor.cgColor
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(titleColor, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        // to keep the image as it... Just maintains one to one aspect ratio of your image... the exact representation of aspect ratio
        // to scale the content to fill the size of the view, complete reading the documentation.
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        return button
    }()
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(profileImageView)
        addSubview(bioTextView)
        addSubview(followButton)
        
        // to stretch out the entire label to fill the entire yellow cell
        //        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        // self is written before top anchor to express for the view that inside it
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: self.followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        usernameLabel.anchor(self.nameLabel.bottomAnchor, left: self.profileImageView.rightAnchor, bottom: nil, right: self.followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        bioTextView.anchor(self.usernameLabel.bottomAnchor, left: self.usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        // dont need to clamp with the left
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 100, heightConstant: 34)
    }
}

