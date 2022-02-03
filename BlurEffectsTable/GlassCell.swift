//
//  GlassCell.swift
//  BlurEffectsTable
//
//  Created by Artem Vaniukov on 03.02.2022.
//

import UIKit


class GlassCell: UITableViewCell {
    
    private lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var labelView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .darkGray
        $0.alpha = 0.6
        return $0
    }(UIView())
    
    private var style: UIBlurEffect.Style!
    
    
    convenience init(with style: UIBlurEffect.Style) {
        self.init()
        
        self.style = style
        
        setupViews()
        setupFonts()
        setupLayout()
        
        contentView.layoutIfNeeded()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setLabel(_ text: String) {
        label.text = text
    }
    
    private func setupViews() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 5
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = contentView.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        contentView.insertSubview(blurView, at: 0)
    }
    
    private func setupFonts() {
        let description = String(describing: style)
        
        label.text = description
        label.textColor = .white
    }
    
    private func setupLayout() {
        labelView.addSubview(label)
        contentView.addSubview(labelView)
        
        NSLayoutConstraint.activate([
            // Label
            label.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            label.topAnchor.constraint(equalTo: labelView.topAnchor),
            label.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: labelView.bottomAnchor),
            
            // LabelView
            labelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelView.heightAnchor.constraint(equalToConstant: 60),
            labelView.widthAnchor.constraint(equalToConstant: 250)
        ])
        
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 400, height: 300)
    }
    
    override func prepareForReuse() {
        style = nil
    }
    
}
