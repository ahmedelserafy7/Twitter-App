//
//  tweetCell.swift
//  twitter app
//
//  Created by Ahmed.S.Elserafy on 9/29/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import LBTAComponents

class tweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet{
            guard let tweet = datasourceItem as? Tweet else { return }
            messageTextView.text = tweet.message
//            profileImageView.image = tweet.user.profileImage
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let tweetUsername = " \(tweet.user.username)\n"
            attributedText.append(NSAttributedString(string: tweetUsername, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            let paragraghStyle = NSMutableParagraphStyle()
            paragraghStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraghStyle, range: range)
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributedText
            
        }
    }
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "BLAHAAAAAA, BLAHAAAA, BLAHAAAA"
        tv.backgroundColor = .clear
        tv.isUserInteractionEnabled = false
        tv.isEditable = false
        return tv
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
    
    let replyButton: UIButton = {
        // to tick a click
        let button = UIButton(type: .system)
         button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return  button
    }()
    
    let retweetButton: UIButton = {
        // to tick a click
        let  button = UIButton(type: .system)
         button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return  button
    }()
    
    let likeButton: UIButton = {
        // to tick a click
        let  button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return  button
    }()
    
    let sendMessageButton: UIButton = {
        // to tick a click
        let  button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return  button
    }()
    
    override func setupViews() {
        super.setupViews()
    
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 4, bottomConstant: 0, rightConstant: 4, widthConstant: 0, heightConstant: 0)
        
        setupBottomButtons()
    }
    
    fileprivate func setupBottomButtons() {
        
        let replyButtonContainerView = UIView()
//        replyButtonContainerView.backgroundColor = .red
        
        let retweetButtonContainerView = UIView()
//        retweetButtonContainerView.backgroundColor = .blue
        
        let likeButtonContainerView = UIView()
//        likeButtonContainerView.backgroundColor = .green
        
        let sendMessageButtonContainerView = UIView()
//        sendMessageButtonContainerView.backgroundColor = .purple
        
        let stackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, sendMessageButtonContainerView])
        // doesn't need to it, just clarify it to know the stack is normally horizontal axis
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        stackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.messageTextView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 6, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(sendMessageButton)
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        sendMessageButton.anchor(sendMessageButtonContainerView.topAnchor, left: sendMessageButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    }
    
}

