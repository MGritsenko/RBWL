//
//  ViewController.swift
//  RBWLFinal
//
//  Created by Enset Enset on 05/04/2017.
//  Copyright © 2017 Enset Enset. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {

    let cellId = "cellId"
    let panelCellId = "panelCellId"
    let batteryCellId = "batteryCellId"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        cv.backgroundColor = UIColor(hex: 0x212121)
        cv.dataSource = self
        cv.delegate =  self
        cv.isPagingEnabled = true
        cv.bounces = false
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    let navigationBar: UINavigationBar = {
        let nb = UINavigationBar()
        nb.isTranslucent = false
        nb.barTintColor = UIColor(hex: 0x151515)
        let navItem = UINavigationItem(title: "RBWL")
        
        nb.setItems([navItem], animated: false)
        nb.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        return nb
    }()
    
    let statusBarView: UIView = {
        let sbv = UIView()
        sbv.backgroundColor = UIColor(hex: 0x151515)
        
        return sbv
    }()
    
    let segmentedControll: UISegmentedControl = {
        let sgmctrl = UISegmentedControl()
        sgmctrl.insertSegment(withTitle: "Panel", at: 0, animated: true)
        sgmctrl.setTitle("Panel", forSegmentAt: 0)
        sgmctrl.insertSegment(withTitle: "Battery", at: 1, animated: true)
        sgmctrl.setTitle("Battery", forSegmentAt: 1)
        sgmctrl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: UIControlState.selected)
        sgmctrl.tintColor = UIColor.currentSpeedColor
        
        return sgmctrl
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(collectionView)
        view.addSubview(statusBarView)
        view.addSubview(navigationBar)
        view.addSubview(segmentedControll)
        
        _ = statusBarView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 22)
        
        _ = navigationBar.anchor(statusBarView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 48)
        
        _ = segmentedControll.anchor(navigationBar.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: view.frame.width * 0.1)
        
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        segmentedControll.selectedSegmentIndex = 0
       
        registerCells()
        
    }
    
    fileprivate func registerCells(){
        //collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(PanelCell.self, forCellWithReuseIdentifier: panelCellId)
        collectionView.register(BatteryCell.self, forCellWithReuseIdentifier: batteryCellId)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        
         segmentedControll.selectedSegmentIndex  = pageNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let panelCell = collectionView.dequeueReusableCell(withReuseIdentifier: panelCellId, for: indexPath)
            
            return panelCell
        }
        
        if indexPath.item == 1 {
            let batteryCell = collectionView.dequeueReusableCell(withReuseIdentifier: batteryCellId, for: indexPath)
            
            return batteryCell
        }
        
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
