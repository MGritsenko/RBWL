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
        view.layer.cornerRadius = 5.0;
        view.layer.masksToBounds = true;
        view.backgroundColor = UIColor(hex: 0x1A1A1A)
        
        return view
    }()
    
    let totalRunView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5.0;
        view.layer.masksToBounds = true;
        view.backgroundColor = UIColor(hex: 0x1A1A1A)
        
        return view
    }()
    
    lazy var rookieButton: UIButton = {
        let button = UIButton()
        button.setTitle("BEGINNER", for: [])
        button.setTitleColor(UIColor.white, for: .selected)
        button.setTitleColor(UIColor.smallNotchesColor, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = UIColor(hex: 0x212121)
        button.addTarget(self, action:#selector(pressButton), for: .touchUpInside)
        
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        button.tag = 1
        
        return button
    }()
    
    lazy var standardButton: UIButton = {
        let button = UIButton()
        button.setTitle("STANDARD", for: [])
        button.setTitleColor(UIColor.white, for: .selected)
        button.setTitleColor(UIColor.smallNotchesColor, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = UIColor(hex: 0x212121)
        button.addTarget(self, action:#selector(pressButton), for: .touchUpInside)
        
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        button.tag = 2
        
        return button
    }()
    
    lazy var sportButton: UIButton = {
        let button = UIButton()
        button.setTitle("SPORT", for: [])
        button.setTitleColor(UIColor.white, for: .selected)
        button.setTitleColor(UIColor.smallNotchesColor, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = UIColor(hex: 0x212121)
        button.addTarget(self, action:#selector(pressButton), for: .touchUpInside)
    
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        button.tag = 3
        
        return button
    }()
    
    lazy var on: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "on_off"), for: .normal)
        button.addTarget(self, action:#selector(pressButton), for: .touchUpInside)
        button.tag = 4
        
        return button
    }()
    
    lazy var off: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "off_off"), for: .normal)
        button.addTarget(self, action:#selector(pressButton), for: .touchUpInside)
        button.tag = 5
        
        return button
    }()
    
    lazy var auto: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "auto_off"), for: .normal)
        button.addTarget(self, action:#selector(pressButton), for: .touchUpInside)
        button.tag = 6
        
        return button
    }()
    
    let totalRunText: UITextView = {
        let text = UITextView()
        text.text = "Total run"
        text.textColor = .currentSpeedColor
        
        return text
    }()
    
    let totalRunValue: UITextView = {
        let text = UITextView(frame: CGRect(x: 10, y: 10, width: 100, height: 10))
        text.text = "1220 km"
        text.textColor = .white
        
        return text
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        let modeStackView   = UIStackView()
        modeStackView.axis  = UILayoutConstraintAxis.horizontal
        modeStackView.distribution  = UIStackViewDistribution.fillEqually
        modeStackView.alignment = UIStackViewAlignment.fill
        modeStackView.spacing   = 8.0
        modeStackView.addArrangedSubview(rookieButton)
        modeStackView.addArrangedSubview(standardButton)
        modeStackView.addArrangedSubview(sportButton)
        modeStackView.translatesAutoresizingMaskIntoConstraints = false;
    
        let lightsStackView = UIStackView()
        lightsStackView.axis  = UILayoutConstraintAxis.horizontal
        lightsStackView.distribution  = UIStackViewDistribution.fillEqually
        lightsStackView.alignment = UIStackViewAlignment.fill
        lightsStackView.spacing   = 8.0
        lightsStackView.addArrangedSubview(on)
        lightsStackView.addArrangedSubview(off)
        lightsStackView.addArrangedSubview(auto)
        lightsStackView.translatesAutoresizingMaskIntoConstraints = false;
    
        totalRunView.addSubview(totalRunValue)
        totalRunView.addSubview(totalRunText)

        let dashboardStackView = UIStackView()
        dashboardStackView.axis  = UILayoutConstraintAxis.horizontal
        dashboardStackView.distribution  = UIStackViewDistribution.fillEqually
        dashboardStackView.alignment = UIStackViewAlignment.fill
        dashboardStackView.spacing   = 12.0
        dashboardStackView.addArrangedSubview(currentRunView)
        dashboardStackView.addArrangedSubview(totalRunView)
        dashboardStackView.translatesAutoresizingMaskIntoConstraints = false;
        
        addSubview(speedometerView)
        addSubview(dashboardStackView)
        addSubview(modeStackView)
        addSubview(lightsStackView)
        
        _ = speedometerView.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 66 + 40 + 28, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width * 0.9, heightConstant: frame.width * 0.9)
        speedometerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = dashboardStackView.anchor(speedometerView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: -frame.width * 0.1, leftConstant: 25, bottomConstant: 0, rightConstant: 25, widthConstant: 0, heightConstant: frame.width * 0.25)
        
        _ = modeStackView.anchor(dashboardStackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: frame.width * 0.06, leftConstant: 25, bottomConstant: 0, rightConstant: 25, widthConstant: 0, heightConstant: frame.width * 0.108)
        
        _ = lightsStackView.anchor(modeStackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: frame.width * 0.06, leftConstant: 25, bottomConstant: 0, rightConstant: 25, widthConstant: 0, heightConstant: frame.width * 0.108)
        
        backgroundColor = UIColor(hex: 0x212121)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pressButton(sender: AnyObject){
        
        switch sender.tag {
            
            //handling mode buttons
        case 1:
            rookieButton.setTitleColor(.white, for: .normal)
            standardButton.setTitleColor(.smallNotchesColor, for: .normal)
            sportButton.setTitleColor(.smallNotchesColor, for: .normal)
            
            rookieButton.backgroundColor = .currentSpeedColor
            standardButton.backgroundColor = UIColor(hex: 0x212121)
            sportButton.backgroundColor = UIColor(hex: 0x212121)
            break
        case 2:
            rookieButton.setTitleColor(.smallNotchesColor, for: .normal)
            standardButton.setTitleColor(.white, for: .normal)
            sportButton.setTitleColor(.smallNotchesColor, for: .normal)
            
            rookieButton.backgroundColor = UIColor(hex: 0x212121)
            standardButton.backgroundColor = .currentSpeedColor
            sportButton.backgroundColor = UIColor(hex: 0x212121)
            break
            
        case 3:
            rookieButton.setTitleColor(.smallNotchesColor, for: .normal)
            standardButton.setTitleColor(.smallNotchesColor, for: .normal)
            sportButton.setTitleColor(.white, for: .normal)
            
            rookieButton.backgroundColor = UIColor(hex: 0x212121)
            standardButton.backgroundColor = UIColor(hex: 0x212121)
            sportButton.backgroundColor = .currentSpeedColor
            break
            
            //handling light buttons
        case 4:
            on.setImage(#imageLiteral(resourceName: "on_on"), for: .normal)
            off.setImage(#imageLiteral(resourceName: "off_off"), for: .normal)
            auto.setImage(#imageLiteral(resourceName: "auto_off"), for: .normal)
            break
            
        case 5:
            on.setImage(#imageLiteral(resourceName: "on_off"), for: .normal)
            off.setImage(#imageLiteral(resourceName: "off_on"), for: .normal)
            auto.setImage(#imageLiteral(resourceName: "auto_off"), for: .normal)
            break
            
        case 6:
            on.setImage(#imageLiteral(resourceName: "on_off"), for: .normal)
            off.setImage(#imageLiteral(resourceName: "off_off"), for: .normal)
            auto.setImage(#imageLiteral(resourceName: "auto_on"), for: .normal)
            break
            
        default:
             print(sender.tag)
        }
    }
}

