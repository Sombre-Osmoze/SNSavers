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

	override init?(frame: NSRect, isPreview: Bool) {
		super.init(frame: frame, isPreview: isPreview)

		let scene = SCNScene.init(named: "SaverMainScene.scn")

		 
	}
	
	required init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
