//
//  DetailFriendCell.swift
//  VK Client
//
//  Created by Rayen D on 06.09.2020.
//  Copyright © 2020 Rayen D. All rights reserved.
//

import UIKit

class DetailFriendCell: UICollectionViewCell {
    
    @IBOutlet weak var detailFriendImage: UIImageView!
    @IBOutlet weak var imageSliderButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        detailFriendImage.contentMode = .scaleAspectFill
        imageSliderButton.layer.cornerRadius = detailFriendImage.frame.size.height / 2
    }
    
    @IBAction func openedImageSlider(_ sender: UIButton) {
    }
    
    func configure(for model: User) {
        
        detailFriendImage.image = UIImage(named: model.imageFriend.first!)
        
        func configure(for model: Sizes) {
            guard let url = model.src,
                  
                  let imageURL = URL(string: url),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.detailFriendImage.image = UIImage(data: imageData)
            }
        }
    }
}
