//
//  CustomNavigationController.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 28.01.2022.
//

import Foundation
import UIKit

final class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        view.backgroundColor = .white
    }
    
    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            switch operation {
            case .push:
                return PushAnimation()
            case .pop:
                return PopAnimation()
            default:
                return nil
            }
        }
    
    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning)
    -> UIViewControllerInteractiveTransitioning? {
        nil
    }
    
    
}
