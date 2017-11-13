//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Admin on 11/13/17.
//  Copyright © 2017 Sanzhar Dauylov. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        if let url = DemoURL.NASA[segue.identifier ?? ""] {
            print("url = \(url)")
            if let imageVC = (segue.destination.contents as? ImageViewController) {
                print("imageVC = \(imageVC)")
                imageVC.imageURL = url
                imageVC.title = (sender as? UIButton)?.currentTitle
            }
        }
    }
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contents == self {
            if let ivc = secondaryViewController as? ImageViewController, ivc.imageURL == nil {
                return true
            }
        }
        return false
    }
    
}

extension UIViewController {
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
