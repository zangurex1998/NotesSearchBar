//
//  TabBarController.swift
//  NotesSearchBar
//
//  Created by technomix on 16.01.23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    


}

extension TabBarController: UITabBarControllerDelegate{
    
}
