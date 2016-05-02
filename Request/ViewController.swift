//
//  ViewController.swift
//  Request
//
//  Created by luojie on 16/5/2.
//  Copyright © 2016年 LuoJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Server.GetVideoInfo(id: 40).request(success: parse)
    }

    func parse(dic: [String: AnyObject]) {
        print(#function)
    }

}

