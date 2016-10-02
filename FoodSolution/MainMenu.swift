//
//  mainMenu.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/26/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Eureka


class MainMenu : FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.italicSystemFontOfSize(10)
            cell.textField.font = UIFont.italicSystemFontOfSize(10)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
        }
        
        form
            +++ Section()
            <<< TextRow(){
                $0.title = "Distributor:"
            }

    }
    
}