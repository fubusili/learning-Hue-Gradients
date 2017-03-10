//
//  GradientsListCell.swift
//  Gradients
//
//  Created by hc_cyril on 2017/3/10.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit
import Spots
import Hue
import Brick

class GradientsListCell: ListSpotCell {

    lazy var selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.cellSelectedColor
        return view
    }()
    
    override func configure(_ item: inout Item) {
        textLabel?.textColor = UIColor(hex: "#fff").alpha(0.8)
        textLabel?.text = item.title
        textLabel?.font = Font.cell
        selectedBackgroundView = selectedView
        backgroundColor = UIColor.clear
        
        item.size = CGSize(width: 64, height: 64)
    }

}
