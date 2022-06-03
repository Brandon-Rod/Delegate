//
//  DelegateImageView.swift
//  Delegate
//
//  Created by Brandon Rodriguez on 5/30/22.
//

import UIKit

class DelegateImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        image = UIImage(named: "Default")
        contentMode = .scaleAspectFit

        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            self.widthAnchor.constraint(equalToConstant: 300),
            self.heightAnchor.constraint(equalToConstant: 300)
        
        ])
        
    }
    
    func setImage(name: String) {
        
        image = UIImage(named: name)
        
    }

}
