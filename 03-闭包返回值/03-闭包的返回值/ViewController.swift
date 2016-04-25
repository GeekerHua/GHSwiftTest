//
//  ViewController.swift
//  03-闭包的返回值
//
//  Created by GeekerHua on 15/12/25.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rect = CGRect(x: 0, y: 20, width: view.bounds.width, height: 44)
        
        let sv = GHLabelScrollView(frame:rect, numberOfLabel: { () -> Int in
            return 16
            }) { (index) -> UILabel in
                let label = UILabel()
                label.text = "hello\(index)"
                label.font = UIFont.systemFontOfSize(18)
                label.sizeToFit()
                label.font = UIFont.systemFontOfSize(14)
                return label
        }
            
        // 建议不要写self
        view.addSubview(sv)
    }
    
    // 实例化ScrollView并返回
    // 使用闭包传递个数和内容
    func scrollView(frame: CGRect, numberOfLabel: () -> Int, labelOfIndex: (index: Int) -> UILabel) -> UIScrollView {
        // 1.实例化scrollView
        let sv = UIScrollView(frame: frame)
        sv.backgroundColor = UIColor.lightGrayColor()

        // 2. 知道标签的数量
        let count = numberOfLabel()
        print("标签数量\(count)")
        
        // 3. 知道标签内容,添加到scrollView上
        let margin: CGFloat = 8
        var x = margin
        for i in 0..<count {
            // 执行闭包,获得label,已经设置好大小的label
            let label = labelOfIndex(index: i)
            
            label.frame = CGRect(x: x, y: 0, width: label.bounds.width, height: frame.height)
            sv.addSubview(label)
            x += label.bounds.width
        }
        
        // 4. 返回ScrollView
        sv.contentSize = CGSize(width: x + margin, height: frame.height)
        
        return sv
    }
}

