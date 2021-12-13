//
//  ThemeKit.swift
//  ThemeKit
//
//  Created by Samuel Ailemen on 12/10/21.
//

import Foundation
import UIKit
import AVFoundation


public class ThemeKit {
    public init () { }
    public class func vibrate(closure: @escaping () -> Void) {
        closure()
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    public class func feedback(type: feedbackType = .success, closure: @escaping () -> Void) {
        if #available(iOS 10.0, *) {
        let generator = UINotificationFeedbackGenerator()
        switch type {
        case .success:
            generator.notificationOccurred(.success)
        case .warning:
            generator.notificationOccurred(.warning)
        case .error:
            generator.notificationOccurred(.error)
        }
        }
        closure()
    }
    
   public enum feedbackType {
        case success
        case warning
        case error
    }
    
}

public extension UIView {
    
    func color(hex: String)  {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        backgroundColor = UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
 
    func gradient(startColor: String = "#eb4d4b", endColor: String =  "#4834d4") {
        var cString:String = startColor.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        var dString:String = endColor.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (dString.hasPrefix("#")) {
            dString.remove(at: dString.startIndex)
        }
        var rgbValue2:UInt64 = 0
        Scanner(string: dString).scanHexInt64(&rgbValue2)
        
        lazy var gradient: CAGradientLayer = {
            let gradient = CAGradientLayer()
            gradient.colors = [
                UIColor(
                    red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                    blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                    alpha: CGFloat(1.0)
                ).cgColor,
                UIColor(
                    red: CGFloat((rgbValue2 & 0xFF0000) >> 16) / 255.0,
                    green: CGFloat((rgbValue2 & 0x00FF00) >> 8) / 255.0,
                    blue: CGFloat(rgbValue2 & 0x0000FF) / 255.0,
                    alpha: CGFloat(1.0)
                ).cgColor
            ]
            gradient.locations = [0, 1]
            return gradient
        }()
        
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
    
    enum direction {
       case radial
       case conic
       case axial
   }
    
    
    func round(corners: UIRectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: CGFloat = 0.0) {
        
        if radius == 0.0 {
            layer.cornerRadius = layer.frame.height/2
        } else if radius > 0.0 {
            layer.cornerRadius = radius
        }
      var cornerMask = CACornerMask()
        switch corners {
        case .topLeft:
            cornerMask = [.layerMinXMinYCorner]
        case .topRight:
            cornerMask = [.layerMaxXMinYCorner]
        case .bottomLeft:
            cornerMask = [.layerMinXMaxYCorner]
        case .bottomRight:
            cornerMask = [.layerMaxXMaxYCorner]
        default:
            cornerMask = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
        if #available(iOS 11.0, *) {
            layer.maskedCorners = cornerMask
        } else {
            // Fallback on earlier versions
        }
        
    }
   
    
    
    //Add a beautiful shadow
    func addShadow(
      color: String = "#34495e",
      alpha: Float = 1,
      x: CGFloat = 0.5,
      y: CGFloat = 10.0,
      blur: CGFloat = 0,
      radius: CGFloat = 1)
    {
        let spread = 0.0
        var cString:String = color.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        layer.masksToBounds = false
        layer.shadowColor = UIColor(
          red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
          green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
          blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
          alpha: CGFloat(1.0)
      ).cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = radius
      if spread == 0 {
          layer.shadowPath = nil
      } else {
        let dx = -spread
        let rect = bounds.insetBy(dx: dx, dy: dx)
          layer.shadowPath = UIBezierPath(rect: rect).cgPath
      }
    }
    
    func addBorder(color: String = "#636e72",
                   width: CGFloat = 0.5) {
        var cString:String = color.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        layer.masksToBounds = false
        layer.borderColor = UIColor(
          red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
          green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
          blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
          alpha: CGFloat(1.0)
        ).cgColor
        layer.borderWidth = width
      
    }
    
    func shake(closure: @escaping () -> Void){
        let location = center.x
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: { [weak self] in
            self?.center.x -= 20
            
        }) { (success) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: { [weak self] in
                closure()
                self?.center.x = location
            }, completion: nil)
        }
        
    }
    
    func bounce(closure: @escaping () -> Void){
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        }) { (success) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: { [weak self] in
                closure()
                self?.transform = .identity
            }, completion: nil)
        }
        
    }
    
    
    func blink(closure: @escaping () -> Void){
        let currentAlpha = alpha
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: { [weak self] in
            self?.alpha = 0
            
        }) { (success) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: { [weak self] in
                closure()
                self?.alpha = currentAlpha
            }, completion: nil)
        }
    }
    
}

