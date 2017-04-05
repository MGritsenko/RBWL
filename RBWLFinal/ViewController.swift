//
//  ViewController.swift
//  RBWLFinal
//
//  Created by Enset Enset on 05/04/2017.
//  Copyright © 2017 Enset Enset. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        cv.backgroundColor = .green
        cv.dataSource = self
        cv.delegate =  self
        cv.isPagingEnabled = true
        cv.bounces = false
        return cv
    }()
    
    
    let navigationBar: UINavigationBar = {
        let nb = UINavigationBar()
        nb.isTranslucent = false
        nb.barTintColor = .black
        let navItem = UINavigationItem(title: "RBWL")
        
        nb.setItems([navItem], animated: false)
        nb.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        return nb
    }()
    
    let statusBarView: UIView = {
        let sbv = UIView()
        sbv.backgroundColor = .black
        return sbv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(collectionView)
        view.addSubview(statusBarView)
        view.addSubview(navigationBar)
        
        statusBarView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 22)
        
        navigationBar.anchor(statusBarView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 48)
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    let cellId = "cellId"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
   
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:view.frame.width, height: view.frame.height)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool{
        return false
    }
}
