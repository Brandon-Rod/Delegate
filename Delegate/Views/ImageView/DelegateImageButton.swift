//
//  DelegateImageButton.swift
//  Delegate
//
//  Created by Brandon Rodriguez on 5/31/22.
//

import UIKit

class DelegateImageButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    convenience init(image: String) {
        
        self.init(frame: .zero)
        
        setImage(UIImage(named: image), for: .normal)
        
    }
    
    private func configure() {
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}
