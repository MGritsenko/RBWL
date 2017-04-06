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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(speedometerView)
        _ = speedometerView.anchor( centerYAnchor, left: nil, bottom: nil, right: nil, topConstant:  -300 + 66 + 16 + 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 370, heightConstant: 370)
        
        speedometerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        backgroundColor = UIColor(hex: 0x212121)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
 
