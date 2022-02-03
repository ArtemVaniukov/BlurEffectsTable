//
//  ColorBall.swift
//  BlurEffectsTable
//
//  Created by Artem Vaniukov on 03.02.2022.
//

import UIKit


class ColorBall: UIView {
    
    var width: CGFloat {
        return self.frame.width
    }
    
    private(set) var size: BallMachine.BallSize!
    
    private var color: UIColor = .systemYellow

    private lazy var view: UIView = {
        $0.backgroundColor = color
        $0.alpha = 0.5
        
        $0.layer.cornerRadius = $0.frame.width / 2
        return $0
    }(UIView())
    
    
    convenience init(size: BallMachine.BallSize) {
        let width = size.rawValue
        
        self.init(frame: CGRect(x: 0, y: 0, width: width, height: width))
        self.size = size
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = color
        layer.cornerRadius = frame.width / 2
        self.frame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setColor(to newColor: UIColor) {
        backgroundColor = newColor
    }
    
}
