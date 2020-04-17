//
//  DrawAnnotationView.swift
//  ActivityApp
//
//  Created by Tanya Burke on 4/17/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import Foundation
import UIKit

class DrawLine {
    var startPoint:CGPoint
    var endPoint:CGPoint

    init (start:CGPoint , end:CGPoint) {
        startPoint = start
        endPoint = end
    }
}

class DrawAnnotationView: UIView {
    static internal let nibName = "AnnotationView"
    @IBOutlet weak var imageView: UIImageView!

    var lines :[DrawLine] = []
    var lastPoint:CGPoint!
    let drawingLayer = CAShapeLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.addSublayer(drawingLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = touches.first?.location(in: self)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch  = touches.first
        {
            let newPoint = touch.location(in:self)
            lines.append(DrawLine(start: lastPoint, end: newPoint))
            lastPoint = newPoint
            updateDrawingOverlay()
        }
    }

    func updateDrawingOverlay() {
        let path = CGMutablePath()

        for line in lines {
            path.move(to: line.startPoint)
            path.addLine(to: line.endPoint)
        }

        drawingLayer.frame = imageView.frame
        drawingLayer.path = path
        drawingLayer.lineWidth = 5
        drawingLayer.strokeColor = UIColor.black.cgColor

        setNeedsDisplay()
    }
}
