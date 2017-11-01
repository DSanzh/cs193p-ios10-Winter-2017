//
//  FaceViewController.swift
//  FaceIt
//
//  Created by Sanzhar on 10/27/17.
//  Copyright © 2017 Sanzhar Dauylov. All rights reserved.
//

import UIKit

class FaceViewController: VCLLoggingViewController {
  
  @IBOutlet weak var faceView: FaceView! {
    didSet {
      let handler = #selector(FaceView.changeScale(byReactingTo:))
      let pinchRecognizer = UIPinchGestureRecognizer(target: faceView, action: handler)
      faceView.addGestureRecognizer(pinchRecognizer)
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toogleEyes(byReactingTo:)))
      faceView.addGestureRecognizer(tapGesture)
      let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(inscreaseHappines))
      swipeUpRecognizer.direction = .up
      faceView.addGestureRecognizer(swipeUpRecognizer)
      let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(decreaseHappiness))
      swipeDownRecognizer.direction = .down
      faceView.addGestureRecognizer(swipeDownRecognizer)
      updateUI()
    }
  }
  
  func inscreaseHappines() {
    expression = expression.happier
  }
  
  func decreaseHappiness() {
    expression = expression.sadder
  }
  
  func toogleEyes(byReactingTo tapRecognizer: UITapGestureRecognizer) {
    if tapRecognizer.state == .ended {
      let eyes: FacialExpression.Eyes = (expression.eyes == .closed) ? .open : .closed
      expression = FacialExpression(eyes: eyes, mouth: expression.mouth)
    }
  }
  
  var expression = FacialExpression(eyes: .closed, mouth: .frown) {
    didSet {
      updateUI()
    }
  }
  
  private func updateUI() {
    switch expression.eyes {
    case .open:
      faceView?.eyesOpen = true
    case .closed:
      faceView?.eyesOpen = false
    case .squinting:
      faceView?.eyesOpen = false
    }
    faceView?.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
  }
  
  private let mouthCurvatures = [FacialExpression.Mouth.grin:0.5,.frown:-1.0,.smile:1.0,.neutral:0.0,.smirk:-0.5]
  
  
}

