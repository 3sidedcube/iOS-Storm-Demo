//
//  DemoListPage.swift
//  Storm Demo Project
//
//  Created by Matthew Cheetham on 15/02/2018.
//  Copyright © 2018 threesidedcube. All rights reserved.
//

import ThunderCloud

class DemoListPage: ListPage {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.1))
    }
}
