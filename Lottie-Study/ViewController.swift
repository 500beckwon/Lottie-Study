//
//  ViewController.swift
//  Lottie-Study
//
//  Created by GNComms on 2021/06/20.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    private let animations = ["door",
                              "heart",
                              "homeIcon",
                              "dotColor",
                              "potPlant",
                              "cube",
                              "payLoading",
                              "text",
                              "ftx"]
    
    lazy private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWidth/3 - 2, height: screenWidth/3 - 1 + 20)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 1, bottom: 0, right: 1)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    lazy private var stopAnimationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(">Stop Animation<", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        insertUI()
        basicSetUI()
        anchorUI()
    }

    private func insertUI() {
        view.addSubview(stopAnimationButton)
        view.addSubview(collectionView)
    }
    
    private func basicSetUI() {
        collectionViewBasicSet()
        stopAnimationButtonBasicSet()
    }
    
    private func anchorUI() {
        stopAnimationButtonAnchor()
        collectionViewAnchor()
    }
    
    @objc func stopAnimationButtonTouchEvent() {
        collectionView.reloadData()
    }
    
    private func stopAnimationButtonBasicSet() {
        stopAnimationButton.translatesAutoresizingMaskIntoConstraints = false
        stopAnimationButton.addTarget(self, action: #selector(stopAnimationButtonTouchEvent), for: .touchUpInside)
    }
    
    func collectionViewBasicSet() {
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(AnimationCollectionViewCell.self, forCellWithReuseIdentifier: "AnimationCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func collectionViewAnchor() {
        collectionView.topAnchor.constraint(equalTo: stopAnimationButton.bottomAnchor,constant: 5).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    func stopAnimationButtonAnchor() {
        stopAnimationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        stopAnimationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stopAnimationButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stopAnimationButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimationCollectionViewCell", for: indexPath) as? AnimationCollectionViewCell else { return  UICollectionViewCell() }
        cell.animationName = animations[indexPath.row]
        return cell
    }
}
