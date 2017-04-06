//
//  PageCell.swift
//  RBWLFinal
//
//  Created by Enset Enset on 05/04/2017.
//  Copyright © 2017 Enset Enset. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame )
        
        setUpViews()
    }
    
    func setUpViews(){
        backgroundColor = UIColor(hex: 0x212121)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
