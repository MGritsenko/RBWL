//
//  PanelCell.swift
//  RBWLFinal
//
//  Created by Enset Enset on 06/04/2017.
//  Copyright © 2017 Enset Enset. All rights reserved.
//

import UIKit

class PanelCell: UICollectionViewCell {
    
    let speedometerView: SpeedometerView = {
        let spd = SpeedometerView()
        spd.backgroundColor = UIColor(hex: 0x212121)
        
        return spd
    }()
    
    let currentRunView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8.0;
        view.layer.masksToBounds = true;
        view.backgroundColor = UIColor(hex: 0x1A1A1A)
        
        return view
    }()
    
    let totalRunView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6.0;
        view.layer.masksToBounds = true;
        view.backgroundColor = UIColor(hex: 0x1A1A1A)
        
        return view
    }()
    
    let rookieButton: UIButton = {
        let button = UIButton()
        button.setTitle("BEGINNER", for: [])
        button.setTitleColor(UIColor.smallNotchesColor, for: .normal)
        button.setTitleColor(UIColor.white, for: .selected)
        button.layer.cornerRadius = 8.0
        button.backgroundColor = UIColor.currentSpeedColor
        
        return button
    }()
    
    let standardButton: UIButton = {
        let button = UIButton()
        button.setTitle("Beginner", for: .normal)
        button.setTitleShadowColor(.yellow, for: .selected)
        
        return button
    }()
    
    let sportButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(speedometerView)
        addSubview(currentRunView)
        addSubview(totalRunView)
        addSubview(rookieButton)
        
        _ = speedometerView.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 66 + 40 + 28, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width * 0.9, heightConstant: frame.width * 0.9)
        speedometerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = currentRunView.anchor(speedometerView.bottomAnchor, left: leftAnchor, bottom: nil, right: centerXAnchor, topConstant: -frame.width * 0.1, leftConstant: 25, bottomConstant: 0, rightConstant: 5, widthConstant: frame.width * 0.4, heightConstant: frame.width * 0.25)
        
        _ = totalRunView.anchor(speedometerView.bottomAnchor, left: centerXAnchor, bottom: nil, right: rightAnchor, topConstant: -frame.width * 0.1, leftConstant: 5, bottomConstant: 0, rightConstant: 25, widthConstant: frame.width * 0.4, heightConstant: frame.width * 0.25)
        
        _ = rookieButton.anchor(totalRunView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: frame.width * 0.06, leftConstant: 25, bottomConstant: 0, rightConstant: 25, widthConstant: frame.width * 0.4, heightConstant: frame.width * 0.12)
        
        backgroundColor = UIColor(hex: 0x212121)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
 
