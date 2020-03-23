//
//  HomeTabbarViewController.swift
//  Fitness-App
//
//  Created by Netventure on 27/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import Foundation
import UIKit
import AMTabView

class HomeTabbarViewController: AMTabsViewController {

  // MARK: - ViewController lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTabsControllers()
  }

  private func setTabsControllers() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let home = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
    let diet = storyboard.instantiateViewController(withIdentifier: "DietViewController")
     let profile = storyboard.instantiateViewController(withIdentifier: "Profile_ViewController")
    viewControllers = [
      diet,
      home,
      profile]
  }
}

