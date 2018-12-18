//
//  ViewController.swift
//  ViewSetupPostLayout
//
//  Created by Jonathan Oh on 12/17/18.
//  Copyright © 2018 Jonathan Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let testView = UIView()
    
    let testViewTwo = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(testViewTwo)
        testViewTwo.backgroundColor = .blue
        testViewTwo.translatesAutoresizingMaskIntoConstraints = false
        testViewTwo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        testViewTwo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        testViewTwo.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        testViewTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view.addSubview(testView)
        testView.backgroundColor = .red
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        testView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        testView.topAnchor.constraint(equalTo: testViewTwo.bottomAnchor, constant: 50).isActive = true
        testView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.testView.removeAllConstraints()
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print(self.testView.superview?.constraints.filter { $0.firstItem === self.testView && $0.firstAttribute == .width }.count)
            print(self.testView.constraints.filter { $0.firstAttribute == .width }.count)
            self.testView.centerXAnchorConstraint?.constant = 50
        }


        
    }
}




