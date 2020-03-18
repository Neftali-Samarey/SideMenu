//
//  ContainerController.swift
//  SideMenu
//
//  Created by Neftali Samarey on 3/17/20.
//  Copyright © 2020 Neftali Samarey. All rights reserved.
//
// Rootview controller

import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    var menuController : UIViewController!
    var centerController : UIViewController!
    var isExpanded : Bool = false           // Keeps track if the sidemenu is open or closed
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Handlers
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self // delegate
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configreMenuController() {
        if menuController == nil {
            // If true, add meny controller here.
            menuController = MenuController()
            // Container's view will insert the menu controller
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did Add menu controller")
        }
    }
    
    // Function to show the menu controller (Good part)
    func showMenuController(shouldExpand: Bool) {
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                // We need access to the home controller
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                
            }, completion: nil)
        } else {
            // hide menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                // We need access to the home controller
                self.centerController.view.frame.origin.x = 0
                
            }, completion: nil)
        }
    }
    
    
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle() {
        //configreMenuController()
        
        if !isExpanded {
            configreMenuController()
        }
        
        isExpanded = !isExpanded // changes it to the opposite of what it was: true = false, false = true etc
        showMenuController(shouldExpand: isExpanded)
    }
    
    
}
