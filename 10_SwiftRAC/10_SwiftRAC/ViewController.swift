//
//  ViewController.swift
//  10_SwiftRAC
//
//  Created by GeekerHua on 15/12/30.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkTools.shareTools.request(RequestMethod.GET, URLString: "http://www.weather.com.cn/data/sk/101010100.html", parameters: nil).subscribeNext({ (JSON) -> Void in
            print(JSON)
            }, error: { (error) -> Void in
                print(error)
            }, completed: {})
        
    }

}

