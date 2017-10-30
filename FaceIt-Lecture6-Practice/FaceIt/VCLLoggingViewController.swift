//
//  VCLLoggingViewController.swift
//  FaceIt
//
//  Created by Sanzhar on 10/30/17.
//  Copyright © 2017 Sanzhar Dauylov. All rights reserved.
//

import UIKit

class VCLLoggingViewController: UIViewController {
  
  private struct LogGlobals {
    var prefix = ""
    var instanceCounts = [String:Int]()
    var lastLogTime = Date()
    var indentationInterval: TimeInterval = 1
    var indentationString = "__"
  }
  
  private static var logGlobals = LogGlobals()
  
  private static func logPrefix(for className: String) -> String {
    if logGlobals.lastLogTime.timeIntervalSinceNow < -logGlobals.indentationInterval {
      logGlobals.prefix += logGlobals.indentationString
      print("")
    }
    logGlobals.lastLogTime = Date()
    return logGlobals.prefix + className
  }
  
  private static func bumInstanceCount(for className: String) -> Int {
    logGlobals.instanceCounts[className] = (logGlobals.instanceCounts[className] ?? 0) + 1
    return logGlobals.instanceCounts[className]!
  }
  
  private var instanceCount: Int!
  
  private func logVCL(_ msg: String) {
    let className = String(describing: type(of: self))
    if instanceCount == nil {
      instanceCount = VCLLoggingViewController.bumInstanceCount(for: className)
    }
    print("\(VCLLoggingViewController.logPrefix(for: className))\(instanceCount!) \(msg)")
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    logVCL("init(coder:) - created via InterfaceBuilder")
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    logVCL("init(nibName:bundle:) - create in code")
  }
  
  deinit {
    logVCL("left the heap")
  }
  
  override func awakeFromNib() {
    logVCL("awakeFromNib()")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    logVCL("viewDidLoad()")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    logVCL("viewWillAppear = \(animated)")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    logVCL("viewDidAppear = \(animated)")
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    logVCL("viewWillDisappear = \(animated)")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    logVCL("viewDidDisappear = \(animated)")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    logVCL("didReceiveMemoryWarning()")
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    logVCL("viewWillLayoutSubviews() bounds.size = (\(self.view.bounds.size))")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    logVCL("viewDidLayoutSubviews() bounds.size = (\(self.view.bounds.size))")
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    logVCL("viewWillTransition")
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
