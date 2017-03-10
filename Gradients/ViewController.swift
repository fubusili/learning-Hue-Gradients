//
//  ViewController.swift
//  Gradients
//
//  Created by hc_cyril on 2017/3/10.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit
import Hue
import Fakery
import Sugar
import Brick
import Spots

class ViewController: Controller {
    
    static let faker = Faker()
    lazy var gradient: CAGradientLayer = [UIColor(hex: "#fd4340"), UIColor(hex: "#ce2bae")].gradient { gradient in
        gradient.speed = 0
        gradient.timeOffset = 0
        return gradient
    }
    lazy var animation: CABasicAnimation = { [unowned self] in
        let animation = CABasicAnimation(keyPath: "colors")
        animation.duration = 1.0
        animation.isRemovedOnCompletion = false
        return animation
    }()
    
    //MARK: - Init
    convenience init(title: String) {
        self.init(spot: ListSpot())
        self.title = title
        
        animation.fromValue = gradient.colors
        animation.toValue = [UIColor(hex: "#8d24ff").cgColor, UIColor(hex: "#23a8f9").cgColor]
    }

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        scrollView.backgroundColor = UIColor.clear
        scrollView.contentInset.bottom = 64
        dispatch(queue: .interactive) { [weak self] in
            self?.update {
                $0.component.items = ViewController.generateItems(0, to: 50)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let navController = navigationController else {
            return
        }
        navController.view.layer.insertSublayer(gradient, at: 0)
        gradient.timeOffset = 0
        gradient.bounds = navController.view.bounds
        gradient.frame = navController.view.bounds
        gradient.add(animation, forKey: "Change Colors")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Public method
    static func generateItem(_ index: Int) -> Item {
        return Item(title: faker.lorem.sentence())
    }
    static func generateItems(_ from: Int, to: Int) -> [Item] {
        var items = [Item]()
        for i in from...from+to {
            autoreleasepool(invoking: {
                items.append(generateItem(i))
            })
        }
        return items
        
    }
    
    //MARK: - UIScrollViewDelegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateGradient()
    }
    
    //MARK: - Private method
    fileprivate func updateGradient() {
        let offset = scrollView.contentOffset.y / scrollView.contentSize.height
        if offset >= 0 && offset <= CGFloat(animation.duration) {
            gradient.timeOffset = CFTimeInterval(offset)
        } else if offset >= CGFloat(animation.duration) {
            gradient.timeOffset = CFTimeInterval(animation.duration)
        }
        
        updateNavigatonBarColor()
        
    }
    
    fileprivate func updateNavigatonBarColor() {
        guard let navBar = navigationController?.navigationBar else {
            return
        }
        if let gradientLayer = gradient.presentation(), let colors = gradientLayer.value(forKey: "colors") as? [CGColor], let firstColor = colors.first {
            navBar.barTintColor = UIColor(cgColor: firstColor)
        } else if let colors = gradient.colors as? [CGColor], let firstColor = colors.first {
            navBar.barTintColor = UIColor(cgColor: firstColor)
        }
    }

}

