//
//  ChooseYourSideVC.swift
//  Delegate
//
//  Created by Brandon Rodriguez on 5/31/22.
//

import UIKit

protocol ChooseYourSideDelegate {
    
    func didTapChoice(image: UIImage, name: String)
    
}

class ChooseYourSideVC: UIViewController {
    
    let programmaticImageButton = DelegateImageButton(image: "Programmatically")
    let storyboardImageButton = DelegateImageButton(image: "Storyboard")
    
    var sideDelegate: ChooseYourSideDelegate!
    var itemViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureImageViews()
        layoutUI()
        
    }
    
    private func configureViewController() {
        
        title = "Choose Your Side"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    private func configureImageViews() {
        
        programmaticImageButton.addTarget(self, action: #selector(programmaticTapped), for: .touchUpInside)
        storyboardImageButton.addTarget(self, action: #selector(storyboardTapped), for: .touchUpInside)
        
    }
    
    @objc func programmaticTapped() {
        
        sideDelegate.didTapChoice(image: UIImage(named: "Programmatically")!, name: "Programmatically")
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @objc func storyboardTapped() {
        
        sideDelegate.didTapChoice(image: UIImage(named: "Storyboard")!, name: "Storyboard")
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    private func layoutUI() {
        
        itemViews = [programmaticImageButton, storyboardImageButton]
        
        let padding: CGFloat = 20        
        for itemView in itemViews {
            
            view.addSubview(itemView)
            
        }
        
        NSLayoutConstraint.activate([
        
            programmaticImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            programmaticImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            storyboardImageButton.topAnchor.constraint(equalTo: programmaticImageButton.bottomAnchor, constant: padding),
            storyboardImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        
        ])
        
    }

}
