//
//  NotificationsController.swift
//  TwitterClone
//
//  Created by YASIN on 3.06.2023.
//

import UIKit

class NotificationsController: UIViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
}
