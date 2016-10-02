//
//  HeaderView.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/30/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import UIKit

class FoodLogoViewNib: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class FoodLogoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let imageView = UIImageView(image: UIImage(named: "logo-uni"))
        imageView.frame = CGRect(x: 0, y: 0, width: 337, height: 135)
        imageView.autoresizingMask = .FlexibleWidth
        self.frame = CGRect(x: 0, y: 0, width: 337, height: 135)
        imageView.contentMode = .ScaleAspectFit
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}