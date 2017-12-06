//
//  ViewController.swift
//  World Tracking
//
//  Created by Muhammad Hijazi on 06/12/2017.
//  Copyright © 2017 Muhammad Hijazi. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

  @IBOutlet weak var sceneView: ARSCNView!
  
  override func prefersHomeIndicatorAutoHidden() -> Bool {
    return true
  }
  
  let configuration = ARWorldTrackingConfiguration()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
    
    sceneView.session.run(configuration)
    sceneView.autoenablesDefaultLighting = true
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func add(_ sender: Any) {

//    addGeometryAtRandomPlace()
      addShapeGeometry()
    
  }
  
  
  func addShapeGeometry(){
    
    let node = SCNNode()
    
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: 0, y: 0.2))
    path.addLine(to: CGPoint(x: 0.2, y: 0.3))
    path.addLine(to: CGPoint(x: 0.4, y: 0.2))
    
    node.geometry = SCNShape(path: path, extrusionDepth: 0.2)

    node.geometry?.firstMaterial?.specular.contents = UIColor.white
    node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue

    // x, y, z
    node.position = SCNVector3(0,0, -0.3)
    
    sceneView.scene.rootNode.addChildNode(node)
    
  }
  
  func addGeometryAtRandomPlace(){
    
    // no shade, size, color
    let node = SCNNode()
    
    //    node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
    //    node.geometry = SCNCapsule(capRadius: 0.1, height: 0.2)
    //    node.geometry = SCNCylinder(radius: 0.01, height: 0.1)
    //    node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.05, height: 0.1)
    //    node.geometry = SCNSphere(radius: 0.05)
    //    node.geometry = SCNTube(innerRadius: 0.1, outerRadius: 0.15, height: 0.3)
    //    node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.01)
    //    node.geometry = SCNPlane(width: 0.1, height: 0.1)
    node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
    
    node.geometry?.firstMaterial?.specular.contents = UIColor.white
    node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
    
    let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
    let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
    let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
    
    // x, y, z
    node.position = SCNVector3(x,y,z)
    
    sceneView.scene.rootNode.addChildNode(node)
    
  }
  
  @IBAction func reset(_ sender: Any) {
  
    restartSession()
    
  }
  
  func restartSession(){
    sceneView.session.pause()
    
    self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
      
      node.removeFromParentNode()
      
    }
    
    sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    
  }
  
  func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
    
    
    return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    
    
  }
  
  
}

