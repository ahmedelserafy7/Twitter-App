//
//  HomeDataSourceController.swift
//  twitter app
//
//  Created by Ahmed.S.Elserafy on 9/20/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {
    
    
    let errorMessage : UILabel = {
        let label = UILabel()
        label.text = "Apologies something went wrong. Please try again later..."
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
          super.viewDidLoad()
        view.addSubview(errorMessage)
        self.errorMessage.fillSuperview()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavBarItem()
        Service.sharedInstance.fetchHomeFeed { (homeDatasource, err) in
            if let _ = err {
                if let apiError = err as? APIError {
                    // 200 OK is standard response for successful HTTP response.
                    if apiError.response?.statusCode != 200 {
                        self.errorMessage.text = "Status code was not 200."
                    }
                }
                
                self.errorMessage.isHidden = false
            }
            
            DispatchQueue.main.async {
                self.datasource = homeDatasource
                self.collectionView.reloadData()
            }
            
        }
        
    }
    
     override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        collectionViewLayout.invalidateLayout()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            guard let user = self.datasource?.item(indexPath) as? User else {
                return CGSize .zero
            }
            
            let estimatedFrame = estimatedHeightOfFrame(text: user.bio)
            return CGSize(width: view.frame.width, height: estimatedFrame + 66)
        } else if indexPath.section == 1 {
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else {
                // .zero to indicate what happen when else, so that it doesn't return error or safe from crashes
                return .zero
            }
            
            let estimatedFrame = estimatedHeightOfFrame(text: tweet.message)
            return CGSize(width: view.frame.width, height: estimatedFrame + 74)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    // Put _ to remove constructor "text"
    private func estimatedHeightOfFrame(text: String)-> CGFloat {
        
        let widthOfMessage = view.frame.width - 50 - 12 - 12 - 4
        let size = CGSize(width: widthOfMessage, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            // zero is property of CGSize that return zero width and height
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    
}
