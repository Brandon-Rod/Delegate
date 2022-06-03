//
//  ViewController.swift
//  Delegate
//
//  Created by Brandon Rodriguez on 5/30/22.
//

import UIKit

class CodeWarsVC: UIViewController {
    
    let programmaticallyLabel = DelegateLabel()
    let storyboardLabel = DelegateLabel()
    let chooseSideButton = DelegateButton()
    let selectedImageView = DelegateImageView(frame: .zero)
    
    var itemViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureChooseSideButton()
        layoutUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        programmaticallyLabel.text = "Programmatically"
        storyboardLabel.text = "Storyboard"
        
    }
    
    private func configureChooseSideButton() {
        
        chooseSideButton.setTitle("Choose a side", for: .normal)
        chooseSideButton.addTarget(self, action: #selector(chooseSideButtonTapped), for: .touchUpInside)
        
        switch selectedImageView.image {
            
        case UIImage(named: "Default"):
            chooseSideButton.setTitle("Choose a side", for: .normal)
            
        default:
            chooseSideButton.setTitle("Change Side", for: .normal)
            
        }
        
        
    }
    
    @objc func chooseSideButtonTapped() {
        
        let destVC = ChooseYourSideVC()
        destVC.sideDelegate = self
        
        navigationController?.pushViewController(destVC, animated: true)
        
    }
    
    private func layoutUI() {
        
        itemViews = [programmaticallyLabel, storyboardLabel, chooseSideButton, selectedImageView]
        
        let padding: CGFloat = 20
        let labelWidth: CGFloat = 184
        
        for itemView in itemViews { view.addSubview(itemView) }
        
        NSLayoutConstraint.activate([
        
            programmaticallyLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            programmaticallyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            programmaticallyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            programmaticallyLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            
            storyboardLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            storyboardLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            storyboardLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            storyboardLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            
            chooseSideButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            chooseSideButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            chooseSideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            chooseSideButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            chooseSideButton.heightAnchor.constraint(equalToConstant: 60),
            
            selectedImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            selectedImageView.bottomAnchor.constraint(equalTo: chooseSideButton.topAnchor, constant: padding),
            selectedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            selectedImageView.heightAnchor.constraint(equalToConstant: 200)
        
        ])
        
    }

}

extension CodeWarsVC: ChooseYourSideDelegate {
    
    func didTapChoice(image: UIImage, name: String) {
        
        selectedImageView.image = image
        title = name
        
        programmaticallyLabel.removeFromSuperview()
        storyboardLabel.removeFromSuperview()
        
    }
    
    
}
