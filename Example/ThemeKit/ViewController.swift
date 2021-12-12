//
//  ViewController.swift
//  ThemeKit
//
//  Created by Samuel Ailemen on 12/11/2021.
//  Copyright (c) 2021 Samuel Ailemen. All rights reserved.
//

import UIKit
import ThemeKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var actionBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.gradient(startColor: "#f5f6fa", endColor: "#ecf0f1")
        
        //Set the colors of the input fields
        view1.color(hex: "#FFFFFF")
        view2.color(hex: "#FFFFFF")
        actionBtn.color(hex: "#FFFFFF")
        
        //Add a shadow to  view
        view1.addShadow(color: "#95a5a6", radius: 30.0)
        view2.addShadow(color: "#95a5a6", radius: 20.0)
       // profileImage.addShadow(color: "#95a5a6", radius: 20.0)
        //Add a border with default values to view
        //Add a shadow to view
        view1.round()
        view2.round(corners: [.topRight], radius: 100.0)
        profileImage.round(corners: [.topRight], radius: 100.0)
        
        
       // actionBtn.addShadow(color: "#95a5a6", radius: 20.0)
        


        //AND NOW, SOME ANIMATIONS
        
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: { [weak self] in
//            //Make that thang bounce
//            self?.view1.shake {
//                print("shake")
//            }
//        })
//
//
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: { [weak self] in
//            //Make that thang bounce
//            self?.view1.bounce {
//                print("bounce")
//            }
//        })
//
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: { [weak self] in
//            //Make that thang blink
//            self?.view1.blink {
//                print("bounce")
//            }
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        //Make device vibrate
        ThemeKit.vibrate() { [weak self] in
            self?.animateView()
        }
    }
    
    
    func animateView() {
        view2.bounce {
            //self?.view2.addBorder()
        }
        
    }
}

