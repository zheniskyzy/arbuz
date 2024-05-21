//
//  TabBarController.swift
//  arbuzOnSwiftUI
//
//  Created by Madina Olzhabek on 16.05.2024.
//

import UIKit
import SwiftUI

class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainPage = UIHostingController(rootView: MainPage(productH: ProductForHeader()))
        mainPage.tabBarItem.image = UIImage(systemName: "menucard")
        mainPage.tabBarItem.title = "Главная"
        
        let basketPage = UIHostingController(rootView: BasketPage())
        basketPage.tabBarItem.image = UIImage(systemName: "cart")
        basketPage.tabBarItem.title = "Корзина"
        

        let viewControllers = [mainPage, basketPage]
        setViewControllers(viewControllers, animated: true)
    }
    

}
