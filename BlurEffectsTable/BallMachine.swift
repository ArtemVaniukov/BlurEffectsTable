//
//  BallMachine.swift
//  BlurEffectsTable
//
//  Created by Artem Vaniukov on 03.02.2022.
//

import UIKit


class BallMachine {
    enum BallSize: CGFloat, CaseIterable {
        case small = 15
        case medium = 25
        case large = 40
    }
    
    private var balls = [ColorBall]() {
        didSet {
            controlBallsPopulation()
        }
    }
    
    private weak var view: UIView?
    
    
    init(for view: UIView?) {
        self.view = view
    }
    
    func startShow() {
        controlBallsPopulation()
    }
    
    private func controlBallsPopulation() {
        let maxBalls = 90
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if self.balls.count < maxBalls {
                // Ball init
                let randomBallSize = [BallSize.small, .medium, .large].randomElement()
                let ball = self.createBall(with: randomBallSize!)
                
                let colors = [UIColor.white, .yellow, .red]
                if ball.size == .small {
                    ball.setColor(to: colors[0])
                } else if ball.size == .medium {
                    ball.setColor(to: colors[1])
                } else {
                    ball.setColor(to: colors[2])
                }
                
                self.placeBall(ball)
                self.animateBall(ball)
            }
        }
    }
    
    private func createBall(with size: BallSize) -> ColorBall {
        let ball = ColorBall(size: size)
        ball.layer.cornerRadius = size.rawValue / 2
        return ball
    }
    
    private func placeBall(_ ball: ColorBall) {
        guard let width = view?.frame.width, let height = view?.frame.height else { return }
        
        let offset: CGFloat = 5
        let radius = ball.frame.width / 2
        
        let x = CGFloat.random(in: (0 + radius + offset)..<(width - radius - offset))
        let y = height + radius + offset
        
        let center = CGPoint(x: x, y: y)
        
        ball.center = center
        balls.append(ball)
        
        view?.insertSubview(ball, at: 0)
    }
    
    private func animateBall(_ ball: ColorBall) {
        let size = ball.size
        var duration: Double = 0
        let extraRandomDuration = Double.random(in: 5...10)
        
        if size == .small {
            duration = 15
        } else if size == .medium {
            duration = 35
        } else {
            duration = 45
        }
        
        duration -= extraRandomDuration
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut) {
            ball.center = CGPoint(x: ball.center.x, y: -ball.width)
        } completion: { _ in
            ball.removeFromSuperview()
            self.balls.removeAll(where: { $0 == ball })
        }
    }
    
}
