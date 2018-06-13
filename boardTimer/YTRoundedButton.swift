//
//  YTRoundedButton.swift
//  boardTimer
//
//  Created by buri on 2018. 6. 13..
//  Copyright © 2018년 tina. All rights reserved.
//

import UIKit

class YTRoundedButton: UIButton {

    required init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }

}
