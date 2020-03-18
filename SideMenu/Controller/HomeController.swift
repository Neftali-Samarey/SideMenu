//
//  HomeController.swift
//  SideMenu
//
//  Created by Neftali Samarey on 3/17/20.
//  Copyright © 2020 Neftali Samarey. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    var delegate : HomeControllerDelegate? = nil
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    // MARK: - Handlers
    
    @objc func toggleSideMenu() {
        delegate?.handleMenuToggle()
        print("Toggling ...")
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "SideMnu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(toggleSideMenu))
    }
}
