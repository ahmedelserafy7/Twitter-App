//
//  NavBarController.swift
//  twitter app
//
//  Created by Ahmed.S.Elserafy on 9/26/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    
     func setupNavBarItem() {
        setupLeftNavItem()
        setupRightNavItems()
        setupRemaingNavItem()
    }
    
    private func setupRemaingNavItem() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        //  to adjust the size
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        // on stackoverflow
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarSeparatorLine = UIView()
        navBarSeparatorLine.backgroundColor = UIColor(r: 230, g: 230, b: 230)
            view.addSubview(navBarSeparatorLine)
        // we can't express for the navBarSeparatorLine by the navBar, so you could use the top of view to put the separatorLine.
        navBarSeparatorLine.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    private func setupRightNavItems() {
        let rightSearchButton = UIButton(type: .system)
        rightSearchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        rightSearchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let rightComposeButton = UIButton(type: .system)
        rightComposeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        rightComposeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: rightComposeButton),UIBarButtonItem(customView: rightSearchButton)]
    }
    
    private func setupLeftNavItem() {
        // system used with toolbars, and navigation bars
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        
    }
    
}
