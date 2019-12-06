//
//  BaseViewController.swift
//  movies-app
//
//  Created by David Petrosyan on 12/6/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController, BaseHandlerController, ModuleInputProvider {
    
    var moduleInput: ModuleInput!
    
    func openModule(with name: String) {
        navigationController?.topViewController?.navigationItem.title = nil
        self.performSegue(withIdentifier: name, sender: nil)
    }
    
    func openModule(with name: String, configurationClosure: @escaping ConfigurationClosure) {
        self.performSegue(withIdentifier: name, sender: configurationClosure)
    }
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationController?.topViewController?.navigationItem.title = nil
        
        guard let viewController = segue.destination as? ModuleInputProvider else {
            fatalError("Failed to cast viewController to ModuleInputProvider")
        }
        
        guard let castSender = sender as? ConfigurationClosure else {
            fatalError("Failed to cast sender to ConfigurationClosure")
        }
        
        castSender(viewController.moduleInput)
    }
    
    func closeModule() {
        self.dismiss(animated: true)
    }
}
