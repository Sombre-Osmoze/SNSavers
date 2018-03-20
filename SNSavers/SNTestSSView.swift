//
//  SNTestSSView.swift
//  SNSavers
//
//  Created by Marcus Florentin on 20/03/2018.
//  Copyright © 2018 Marcus Florentin. All rights reserved.
//

import Cocoa
import ScreenSaver
import SceneKit

class SNTestSSView: ScreenSaverView {

	var scnView: SCNView!

	override init?(frame: NSRect, isPreview: Bool) {
		super.init(frame: frame, isPreview: isPreview)

		self.

		let myNSText = NSString(string: "Sombre Osmo'z")

		myNSText.draw(at: frame.origin, withAttributes: nil)

//		//probably not needed, but cant hurt to check in case we re-use this code later
//		for subview in self.subviews {
//			subview.removeFromSuperview()
//		}
//
//		//initialize the sceneKit view
//		self.scnView = SCNView.init(frame: self.bounds)
//
//		//prepare it with a scene
//		//prepareSceneKitView()
//
//		//set scnView background color
//		scnView.backgroundColor = NSColor.yellow
//
//		//add it in as a subview
//		self.addSubview(self.scnView)
	}

	
	required init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func prepareSceneKitView() {

		// create a new scene
		let scene = SCNScene(named: "art.scnassets/SaverMainScene.scn")!

		// create and add a camera to the scene
		let cameraNode = SCNNode()
		cameraNode.camera = SCNCamera()
		scene.rootNode.addChildNode(cameraNode)

		// place the camera
		cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)

		// create and add a light to the scene
		let lightNode = SCNNode()
		lightNode.light = SCNLight()
		lightNode.light!.type = SCNLight.LightType.omni
		lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
		scene.rootNode.addChildNode(lightNode)

		// create and add an ambient light to the scene
		let ambientLightNode = SCNNode()
		ambientLightNode.light = SCNLight()
		ambientLightNode.light!.type = SCNLight.LightType.ambient
		ambientLightNode.light!.color = NSColor.darkGray
		scene.rootNode.addChildNode(ambientLightNode)

		// retrieve the ship node
		let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!

		// animate the 3d object
		ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))

		// retrieve the SCNView
		let scnView = self.scnView!

		// set the scene to the view
		scnView.scene = scene

		// allows the user to manipulate the camera
		scnView.allowsCameraControl = true

		// show statistics such as fps and timing information
		scnView.showsStatistics = true
	}
	
}
