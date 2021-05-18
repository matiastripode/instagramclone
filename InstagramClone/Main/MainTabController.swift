//
//  MainTabController.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/14/21.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureViewControllers()
    }
    
    // MARK - Helpers
    
    func configureViewControllers() {
        
        let feed = templateNavigationController(unselectedImage:#imageLiteral(resourceName: "home_unselected") ,
                                                selectedImage: #imageLiteral(resourceName: "home_selected"),
                                                rootViewController: FeedController())
    
        let search = templateNavigationController(unselectedImage:#imageLiteral(resourceName: "search_unselected"),
                                                selectedImage: #imageLiteral(resourceName: "search_selected") ,
                                                rootViewController: SearchController())
  
        
        let imageSelector = templateNavigationController(unselectedImage:#imageLiteral(resourceName: "plus_unselected") ,
                                                selectedImage: #imageLiteral(resourceName: "plus_unselected"),
                                                rootViewController: ImageSelectorController())
        
        let notifications = templateNavigationController(unselectedImage:#imageLiteral(resourceName: "like_unselected") ,
                                                selectedImage: #imageLiteral(resourceName: "like_selected"),
                                                rootViewController: NotificationController())
        

        let profile = templateNavigationController(unselectedImage:#imageLiteral(resourceName: "profile_unselected") ,
                                                selectedImage: #imageLiteral(resourceName: "profile_unselected"),
                                                rootViewController: ProfileController())
        
        viewControllers = [feed, search, imageSelector, notifications, profile]
        tabBar.tintColor = .black
    }
    
    func templateNavigationController(unselectedImage: UIImage,
                                      selectedImage: UIImage,
                                      rootViewController: UIViewController) -> UINavigationController {
        
        
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}

