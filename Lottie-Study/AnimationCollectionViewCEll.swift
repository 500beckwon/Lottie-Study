//
//  AnimationCollectionViewCEll.swift
//  Lottie-Study
//
//  Created by GNComms on 2021/06/20.
//

import UIKit
import Lottie

public class AnimationCollectionViewCell: UICollectionViewCell {
    private var animationView: AnimationView?
    
    public var animationName: String? {
        didSet {
            guard let name = animationName else { return }
            animationView = AnimationView(name: name)
            guard let animationView = animationView else { return }
            contentView.addSubview(animationView)
            animationView.contentMode = .scaleAspectFill
            animationView.loopMode = .loop
            let screenWidth = UIScreen.main.bounds.width
            animationView.frame = CGRect(origin: .zero, size: CGSize(width: screenWidth/3 - 2, height: screenWidth/3 - 1))
            animationNameLabel.text = name
        }
    }
    
    public var animationNameLabel = UILabel()
  
    public override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        
        insertUI()
        basicSetUI()
        anchorUI()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        animationView?.animation = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func insertUI() {
        contentView.addSubview(animationNameLabel)
    }
    
    private func basicSetUI() {
        animationNameBasicSet()
    }
    
    private func anchorUI() {
        animationNameAnchor()
    }
    
    private func animationNameBasicSet() {
        animationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        animationNameLabel.backgroundColor = .clear
        animationNameLabel.textColor = .black
        animationNameLabel.textAlignment = .center
        animationNameLabel.font = .boldSystemFont(ofSize: 9)
    }
    
    private func animationNameAnchor() {
        animationNameLabel.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        animationNameLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        animationNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    public override var isSelected: Bool {
        didSet {
           animationView?.play()
        }
    }
}
