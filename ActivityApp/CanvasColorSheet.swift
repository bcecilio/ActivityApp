//
//  CanvasColorSheet.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/16/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class CanvasColorSheet: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(10)
        context.setAlpha(0.4)
        context.setLineCap(.butt)
        
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        context.strokePath()
    }
    
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {
            return
        }
        
        guard var lastLine = lines.popLast() else {
            return
        }
        lastLine.append(point)
        
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
    
    public func undoLine() {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    public func clearLine() {
        lines.removeAll()
        setNeedsDisplay()
    }
}
