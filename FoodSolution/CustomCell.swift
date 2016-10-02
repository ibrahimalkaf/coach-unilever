//
//  CustomCell.swift
//  FoodSolution
//
//  Created by baim alkaf on 9/1/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import UIKit
import Eureka

public final class ImageCheckRow<T: Equatable>: Row<T, ImageCheckCell<T>>, SelectableRowType, RowType {
    public var selectableValue: T?
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}

public class ImageCheckCell<T: Equatable> : Cell<T>, CellType {
    
    required public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    lazy public var trueImage: UIImage = {
        return UIImage(named: "selectedRectangle")!
    }()
    
    lazy public var falseImage: UIImage = {
        return UIImage(named: "unselectedRectangle")!
    }()
    
    public override func update() {
        super.update()
        accessoryType = .None
        imageView?.image = row.value != nil ? trueImage : falseImage
    }
    
    public override func setup() {
        super.setup()
    }
    
    public override func didSelect() {
        row.reload()
        row.select()
        row.deselect()
    }
    
}
