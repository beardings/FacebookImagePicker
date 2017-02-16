//
//  GBHPhotoCollectionViewCell.swift
//  GBHFacebookImagePicker
//
//  Created by Florian Gabach on 29/09/2016.
//  Copyright (c) 2016 Florian Gabach <contact@floriangabach.fr>

import UIKit

class GBHPhotoCollectionViewCell: UICollectionViewCell {
    
    fileprivate var albumImageView: GBHImageAsyncViewLoading?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = GBHFacebookImagePicker.pickerConfig.ui.backgroundColor
        
        // Picture contener
        self.albumImageView = GBHImageAsyncViewLoading(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        self.albumImageView?.contentMode = .scaleAspectFill
        self.albumImageView?.clipsToBounds = true
        self.albumImageView?.layer.cornerRadius = GBHAppearanceManager.pictureCornerRadius
        if let imgView = self.albumImageView {
            self.contentView.addSubview(imgView)
        }
    }
    
    /// Configure collection cell with image
    ///
    /// - Parameter picture: Facebook's image model
    func configure(picture: GBHFacebookImageModel) {
        
        // Set picture's url
        if let urlPath = picture.normalSizeUrl,
            let url = URL(string: urlPath) {
            self.albumImageView?.imageUrl = url
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
