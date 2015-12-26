//
//  GHLabelScrollView.swift
//  03-闭包的返回值
//
//  Created by GeekerHua on 15/12/25.
//  Copyright © 2015年 GeekerHua. All rights reserved.
//

import UIKit


class GHLabelScrollView: UIScrollView {
    
    // 支持重载,函数名一样,参数数量和类型不一样
    // 纯代码开发调用
    init(frame: CGRect, numberOfLabel: () -> Int, labelOfIndex: (index: Int) -> UILabel) {
        super.init(frame: frame)
        // 1.实例化scrollView

        backgroundColor = UIColor.lightGrayColor()
        
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
            addSubview(label)
            x += label.bounds.width
        }
        
        // 4. 返回ScrollView
        contentSize = CGSize(width: x + margin, height: frame.height)
    }

    // Storyboard & Xib开发调用
    // 自定义视图中,必须要实现的
    required init?(coder aDecoder: NSCoder) {
        //fatalError 会让用Storyboard 开发直接崩掉
        fatalError("init(coder:) has not been implemented")
    }
}
