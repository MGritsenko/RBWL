//
//  SpeedometerView.swift
//  RBWLFinal
//
//  Created by Enset Enset on 06/04/2017.
//  Copyright © 2017 Enset Enset. All rights reserved.
//

import UIKit

let NoOfTicks = 6
let pi: CGFloat = CGFloat(Double.pi)

@IBDesignable class SpeedometerView: UIView {
    
    @IBInspectable var needlePathColor: UIColor = UIColor.white
    @IBInspectable var bigNotchesColor: UIColor = UIColor.bigNotchesColor
    @IBInspectable var smallNotchesColor: UIColor = UIColor.smallNotchesColor
    @IBInspectable var speedBackgroundColor: UIColor = UIColor.speedBackgroundColor
    @IBInspectable var speedModeColor: UIColor = UIColor.speedModeColor
    @IBInspectable var currentSpeedColor: UIColor = UIColor.currentSpeedColor
    @IBInspectable var speedModeLimit: Int = 0
    @IBInspectable var maxSpeed: Int = 30
    @IBInspectable var currentSpeed: Float = 0 {
        didSet{
            if currentSpeed <= Float(maxSpeed) {
                setNeedsDisplay()
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let radiusScale: CGFloat = 0.80
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radiusSpeedo: CGFloat = max(bounds.width * radiusScale * 0.82, bounds.height * radiusScale * 0.82)
        let arcWidth: CGFloat = radiusSpeedo * 0.07
        let startAngle: CGFloat = 3 * pi / 4
        let endAngle: CGFloat = pi / 4
        
        let angleDifference: CGFloat = 2 * pi - startAngle + endAngle
        let arcLengthBackground = angleDifference / CGFloat(maxSpeed)
        let currentSpeedAngle = arcLengthBackground * CGFloat(currentSpeed) + startAngle
        let speedModeAngle = arcLengthBackground * CGFloat(speedModeLimit) + startAngle
        
        let context = UIGraphicsGetCurrentContext()
        
        let bigNotchesWidth: CGFloat = radiusSpeedo * 0.0065
        let bigNotchesSize: CGFloat = radiusSpeedo * 0.06
        let smallNotchesWidth: CGFloat = radiusSpeedo * 0.0045
        let smallNotchesSize: CGFloat = radiusSpeedo * 0.05
        
        let needleWidth: CGFloat = radiusSpeedo * 0.009
        let needleSize: CGFloat = radiusSpeedo * 0.305
        
        //Background
        let speedBackgroundPath = UIBezierPath(arcCenter: center,
                                               radius: radiusSpeedo / 2 - arcWidth / 2,
                                               startAngle: startAngle,
                                               endAngle: endAngle,
                                               clockwise: true)
        
        speedBackgroundPath.lineWidth = arcWidth
        speedBackgroundColor.setStroke()
        speedBackgroundPath.stroke()
        
        //Speed mode path
        let speedModePath = UIBezierPath(arcCenter: center,
                                         radius: radiusSpeedo / 2 - arcWidth / 2,
                                         startAngle: startAngle,
                                         endAngle: speedModeAngle,
                                         clockwise: true)
        
        speedModeColor.setStroke()
        speedModePath.lineWidth = arcWidth
        speedModePath.stroke()
        
        //Current speed path
        let currentSpeedPath = UIBezierPath(arcCenter: center,
                                            radius: radiusSpeedo / 2 - arcWidth / 2,
                                            startAngle: startAngle,
                                            endAngle: currentSpeedAngle,
                                            clockwise: true)
        
        currentSpeedColor.setStroke()
        currentSpeedPath.lineWidth = arcWidth
        currentSpeedPath.stroke()
        
        //Needle on current speed path
        context!.saveGState()
        needlePathColor.setFill()
        
        let needlePath = UIBezierPath(rect: CGRect(x: -needleWidth / 2, y: 0, width: needleWidth, height: needleSize))
        
        context!.translateBy(x: rect.width / 2, y: rect.height / 2)
        context!.saveGState()
        
        let angle = arcLengthBackground * CGFloat(currentSpeed) + startAngle - pi / 2
        
        context!.rotate(by: angle)
        context!.translateBy(x: 0, y: radiusSpeedo / 5.15)
        
        needlePath.fill()
        context!.restoreGState()
        
        //Draw small notches
        context!.saveGState()
        smallNotchesColor.setFill()
        
        let smallNotchesPath = UIBezierPath(rect: CGRect(x: -smallNotchesWidth / 2, y: 0, width: smallNotchesWidth, height: smallNotchesSize))
        
        context!.translateBy(x: 0, y: 0)
        
        for i in stride(from: 0, to: maxSpeed + 1, by: 1) {
            context!.saveGState()
            
            let angle = arcLengthBackground * CGFloat(i) + startAngle - pi / 2
            
            context!.rotate(by: angle)
            context!.translateBy(x: 0, y: rect.height / 2 * radiusScale - smallNotchesSize)
            
            smallNotchesPath.fill()
            
            context!.restoreGState()
        }
        
        //Draw big notches
        context!.saveGState()
        bigNotchesColor.setFill()
        
        let bigNotchesPath = UIBezierPath(rect: CGRect(x: -bigNotchesWidth / 2, y: 0, width: bigNotchesWidth, height: bigNotchesSize))
        
        context!.translateBy(x: 0, y: 0)
        
        for i in stride(from: 0.0, to: Double(maxSpeed + 1), by: Double(maxSpeed) / Double(NoOfTicks)) {
            context!.saveGState()
            
            let angle = arcLengthBackground * CGFloat(i) + startAngle - pi / 2
            
            context!.rotate(by: angle)
            context!.translateBy(x: 0, y: rect.height / 2 * radiusScale - bigNotchesSize)
            
            bigNotchesPath.fill()
            
            context!.restoreGState()
        }
        
        //Draw text
        let attributes = [NSForegroundColorAttributeName: needlePathColor,
                          NSFontAttributeName: UIFont.systemFont(ofSize: CGFloat(radiusSpeedo * 0.07))] as [String : Any]
        var currentNotch = 0
        let value = Float(maxSpeed) / Float(NoOfTicks)
        
        for i in stride(from: 0, to: 35, by: 5) {
            
            let str = String(Int(ceil(value * Float(currentNotch)))) as NSString
            let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
            let boundingBox = str.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            let theta: CGFloat = 7 * pi / 4 - CGFloat(i) * (2.0 * pi / 40)
            let x: CGFloat = radiusSpeedo * 0.69 * sin(theta) - boundingBox.width / 2
            let y: CGFloat = radiusSpeedo * 0.69  * cos(theta) - boundingBox.height / 2
            
            str.draw(at: CGPoint(x: x, y: y), withAttributes: attributes)
            
            currentNotch += 1
            
        }
        
        //Draw current speed
        let myString = String(Float(round(currentSpeed * 10) / 10))
        let attrString = NSMutableAttributedString(string: myString as String)
        attrString.addAttribute(NSFontAttributeName, value: UIFont.monospacedDigitSystemFont(
            ofSize: UIFont.systemFontSize * 4.5,
            weight: UIFontWeightRegular), range: NSMakeRange(0, attrString.length - 1))
        
        attrString.addAttribute(NSFontAttributeName, value: UIFont.monospacedDigitSystemFont(
            ofSize: UIFont.systemFontSize * 2.25,
            weight: UIFontWeightRegular), range: NSMakeRange(attrString.length - 1, 1))
        
        
        let constraintRect2 = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox2 = attrString.boundingRect(with: constraintRect2, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
        
        attrString.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(0, attrString.length))
        attrString.draw(at: CGPoint(x: -boundingBox2.width / 2, y: -boundingBox2.height / 2))
        
        //Draw km/h
        let kmHString = "km/h"
        let boundingBox3 = kmHString.boundingRect(with: constraintRect2, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
        let attributesKmH = [NSForegroundColorAttributeName: bigNotchesColor,
                             NSFontAttributeName: UIFont.systemFont(ofSize: CGFloat(radiusSpeedo * 0.06))] as [String : Any]
        kmHString.draw(at: CGPoint(x: -boundingBox3.width / 2, y: boundingBox2.height / 2), withAttributes: attributesKmH)
        
        //Draw battery
        
    }
    
    func setSmoothSpeed(SpdAv: Float) -> Float {
        var divider: Float = (abs(SpdAv - Float(currentSpeed)));
        divider /= 100 * (currentSpeed + 1);
        var smoothSpeed: Float = Float(currentSpeed);
        
        //        if (getIsReverse() && SpdAv > 0 || !getIsReverse() && SpdAv < 0) {
        //            smoothSpeed = 0;
        //        }
        
        if (SpdAv < smoothSpeed) {
            smoothSpeed -= divider;
        } else if (SpdAv > smoothSpeed) {
            smoothSpeed += divider;
        } else {
            smoothSpeed = 0;
        }
        
        return smoothSpeed >= 0 ? smoothSpeed > Float(maxSpeed) ? Float(maxSpeed) : smoothSpeed : 0;
    }
}

