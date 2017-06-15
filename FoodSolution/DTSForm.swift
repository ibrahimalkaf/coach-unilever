//
//  DTSForm.swift
//  FoodSolution
//
//  Created by baim alkaf on 8/15/16.
//  Copyright © 2016 baim. All rights reserved.
//

import Foundation
import Eureka
import Firebase
import FirebaseDatabase
import CoreData


class DTSForm : FormViewController {
    
    var rootRef: FIRDatabaseReference!
    var coachingsession: String = ""
    
    var distributor: String = ""
    var area: String = ""
    
    var dts_sebelum_1a: Bool = false
    var dts_sebelum_1b: Bool = false
    var dts_sebelum_1c: Bool = false
    var dts_sebelum_1d: Bool = false
    var dts_sebelum_1e: Bool = false
    
    var dts_sebelum_2a: Bool = false
    var dts_sebelum_2b: Bool = false
    var dts_sebelum_2c: Bool = false
    
    var dts_sebelum_2_1a: Bool = false
    var dts_sebelum_2_2a: Bool = false
    var dts_sebelum_2_2b: Bool = false
    var dts_sebelum_2_2c: Bool = false
    var dts_sebelum_2_2d: Bool = false
    var dts_sebelum_2_2e: Bool = false
    
    var dts_sebelum_3_1: Bool = false
    var dts_sebelum_3_2: Bool = false
    
    var dts_report_1a: Bool = false
    var dts_report_1b: Bool = false
    var dts_report_2a: Bool = false
    var dts_report_2b: Bool = false
    var dts_report_3a: Bool = false
    var dts_report_3b: Bool = false
    var dts_report_3c: Bool = false
    
    var dts_infra_1a: Bool = false
    var dts_infra_1b: Bool = false
    var dts_infra_1c: Bool = false
    var dts_infra_1d: Bool = false
    var dts_infra_1e: Bool = false
    var dts_infra_1f: Bool = false
    var dts_infra_1g: Bool = false
    
    var dts_infra_2a: Bool = false
    var dts_infra_2b: Bool = false
    var dts_infra_2c: Bool = false
    var dts_infra_2d: Bool = false
    var dts_infra_2e: Bool = false
    
    var dts_infra_3: Bool = false
    
    var dts_dsr_1a: Bool = false
    var dts_dsr_1b: Bool = false
    var dts_dsr_1c: Bool = false
    
    var dts_sebelum_1ar: String = ""
    var dts_sebelum_1br: String = ""
    var dts_sebelum_1cr: String = ""
    var dts_sebelum_1dr: String = ""
    var dts_sebelum_1er: String = ""
    
    var dts_sebelum_2ar: String = ""
    var dts_sebelum_2br: String = ""
    var dts_sebelum_2cr: String = ""
    
    var dts_sebelum_2_1ar: String = ""
    var dts_sebelum_2_2ar: String = ""
    var dts_sebelum_2_2br: String = ""
    var dts_sebelum_2_2cr: String = ""
    var dts_sebelum_2_2dr: String = ""
    var dts_sebelum_2_2er: String = ""
    
    var dts_sebelum_3_1r: String = ""
    var dts_sebelum_3_2r: String = ""
    
    var dts_report_1ar: String = ""
    var dts_report_1br: String = ""
    var dts_report_2ar: String = ""
    var dts_report_2br: String = ""
    var dts_report_3ar: String = ""
    var dts_report_3br: String = ""
    var dts_report_3cr: String = ""
    
    var dts_infra_1ar: String = ""
    var dts_infra_1br: String = ""
    var dts_infra_1cr: String = ""
    var dts_infra_1dr: String = ""
    var dts_infra_1er: String = ""
    var dts_infra_1fr: String = ""
    var dts_infra_1gr: String = ""
    
    var dts_infra_2ar: String = ""
    var dts_infra_2br: String = ""
    var dts_infra_2cr: String = ""
    var dts_infra_2dr: String = ""
    var dts_infra_2er: String = ""
    
    var dts_infra_3r: String = ""
    
    var dts_dsr_1ar: String = ""
    var dts_dsr_1br: String = ""
    var dts_dsr_1cr: String = ""
    
    var language : String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let coachname = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachname) as String!
        let coacheename = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coacheemail) as String!
        //self.coachingsession = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachingSession)!
        
        if let bahasa = NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.language) {
            language = bahasa as String!
        }
        
        TextRow.defaultCellUpdate = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
            cell.textField.font = UIFont.systemFontOfSize(11)
        }
        LabelRow.defaultCellSetup = { cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
        }
        CheckRow.defaultCellUpdate = {
            cell, row in
            cell.textLabel?.font = UIFont.systemFontOfSize(11)
        }
        ButtonRow.defaultCellSetup = { cell, row in
            let orangeView = UIView()
            orangeView.backgroundColor = .orangeColor()
            cell.selectedBackgroundView = orangeView
            cell.backgroundColor = .orangeColor()
            cell.textLabel?.textColor = .whiteColor()
        }
        
        
        if language == "Optional(\"Bahasa\")" {
            
        form =  Section(){
            section in
            var footer = HeaderFooterView<UITableViewHeaderFooterView>(.Class)
            footer.onSetupView = {view in
                view.view.textLabel!.text = "**The following questions is a guidelines for you to coach\n the team to develop better in Selling Skills (Basic Call Procedure)"
                view.view.textLabel!.textColor = UIColor.orangeColor()
                view.view.textLabel?.numberOfLines = 2
                view.view.textLabel?.textAlignment = NSTextAlignment.Center
                view.view.textLabel!.font = UIFont.italicSystemFontOfSize(9)
            }
            footer.height = {30}
            section.footer = footer
            }
            
            
            
            <<< SegmentedRow<String>("segments"){
                $0.options = ["GENERAL", "REPORTING", "INFRA","TEAM"]
                $0.value = "GENERAL"
                }.cellUpdate({ (cell, row) in
                    cell.tintColor = .orangeColor()
                    cell.textLabel!.numberOfLines = 2
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                })
            
            +++ Section()
            
            <<< TextRow(){
                $0.title = "Coach\t: \(coachname)"
                $0.disabled = true
            }
            <<< TextRow(){
                $0.title = "Coachee\t: \(coacheename)"
                $0.disabled = true
            }
            <<< TextRow(){
                $0.tag = "distributor"
                $0.title = "Distributor\t:"
            }
            <<< TextRow(){
                $0.tag = "area"
                $0.title = "Area\t\t:"
            }
            
            
            +++ Section("GENERAL"){
                $0.header?.title = "SEBELUM TIBA DI DISTRIBUTOR"
                $0.hidden = "$segments != 'GENERAL'"
            }
            <<< LabelRow(){
                $0.title = "TERRITORY PROFILE"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                })
            <<< LabelRow(){
                $0.title = "1. Coverage"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_1a"
                $0.title = "\ta. Berapa banyak wholesaler yang dicover oleh distributor"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_1ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_1b"
                $0.title = "\tb. Berapa banyak wholesaler bakery yang dicover?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_1br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_1c"
                $0.title = "\tc. Berapa banyak wholesaler Horeca yang dicover?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_1cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_1d"
                $0.title = "\td. Berapa banyak pasar yang terdapat di territory Anda? Berapa banyak yang sudah dicover?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_1dr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_1e"
                $0.title = "\te. Berapa banyak Local Cash&Carry (LCC) yang terdapat di territory Anda? Berapa banyak yang sudah dicover?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_1er"
                $0.placeholder = "\tRemarks:"
            }
            
            
            <<< LabelRow(){
                $0.title = "2. Target"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_2a"
                $0.title = "\ta. Berapa target full year Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_2ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_2b"
                $0.title = "\tb. Berapa RPP (rata-rata penjualan per pekan) distributor Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_2br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_2c"
                $0.title = "\tc. Berapa persen pencapaiannya di minggu lalu?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_2cr"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "PENGUASAAN BRAND UFS"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                })
            <<< CheckRow(){
                $0.tag = "dts_sebelum_2_1a"
                $0.title = "1. Apakah Anda tahu Top 10 UFS? Apa saja?"
                }
            <<< TextRow(){
                $0.tag = "dts_sebelum_2_1ar"
                $0.placeholder = "Remarks:"
            }
            
            <<< LabelRow(){
                $0.title = "2. Apakah Anda tahu target & achievement penetrasi dari produk TLC berikut :"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< CheckRow(){
                $0.tag = "dts_sebelum_2_2a"
                $0.title = "\ta. Royco Bumbu Dasar Ayam Kuning"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_2_2ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_2_2b"
                $0.title = "\tb. Royco Bumbu Dasar Rendang"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_2_2br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_2_2c"
                $0.title = "\tc. SariWangi Celup Jumbo"
            }
            <<< TextRow(){
                $0.tag = "dts_sebelum_2_2cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_2_2d"
                $0.title = "\td. Knorr Oyster"
                }
            <<< TextRow(){
                $0.tag = "dts_sebelum_2_2dr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_2_2e"
                $0.title = "\te. KMP 500Gr"
                }
            <<< TextRow(){
                $0.tag = "dts_sebelum_2_2er"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "KEMAMPUAN CHEFMANSHIP"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                })
            <<< CheckRow(){
                $0.tag = "dts_sebelum_3_1"
                $0.title = "1. Seberapa sering anda mengikuti training Simple Wet Sampling Dilution in Class Training yang dilakukan oleh ASMPull?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_3_1r"
                $0.placeholder = "Remarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_sebelum_3_2"
                $0.title = "2. Berapa SKU yang anda hafal Selling Story / Kelebihannya? Sebutkan"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_sebelum_3_2r"
                $0.placeholder = "Remarks:"
            }

            
            +++ Section("REPORTING"){
                $0.header?.title = "DI DISTRIBUTOR (REPORT)"
                $0.hidden = "$segments != 'REPORTING'"
            }

            <<< LabelRow(){
                $0.title = "1. Dalam monitoring tim :"
            }
            <<< CheckRow(){
                $0.tag = "dts_report_1a"
                $0.title = "\ta. Seberapa sering Anda melakukan morning dan afternoon briefing?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_report_1ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_report_1b"
                $0.title = "\tb. Apakah Anda dapat menjelaskan point apa saja yang terdapat dalam wall report? \n\t*Minta DTS untuk menunjukan dan menjelaskan Wall Report yang ada di distributor"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_report_1br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "2. Memonitor kedisiplinan tim :"
            }
            <<< CheckRow(){
                $0.tag = "dts_report_2a"
                $0.title = "\ta. Berapa persen pencapaian kunjungan DSR yang sesuai dengan PJP?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_report_2ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_report_2b"
                $0.title = "\tb. Berapa persen rata-rata effective call (EC) masing-masing DSR Anda? \n\t*Minta DTS untuk menunjukan dan menjelaskan konten yang ada pada TRC atau Leveredge Mobility"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_report_2br"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "3. Pengembangan kapabilitas tim :"
            }
            <<< CheckRow(){
                $0.tag = "dts_report_3a"
                $0.title = "\ta. Seberapa sering Anda melakukan coaching untuk DSR?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_report_3ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_report_3b"
                $0.title = "\tb. Seberapa sering Anda melakukan coaching untuk DSS?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_report_3br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_report_3c"
                $0.title = "\tc. Apakah Anda menggunakan aplikasi ini untuk mendokumentasikan hasil coaching tersebut? \n\t*DTS sebaiknya melakukan coaching kepada DSR 2x/minggu dan kepada DSS/OM 1x/minggu"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_report_3cr"
                $0.placeholder = "\tRemarks:"
            }
            
            +++ Section("INFRA"){
                $0.header?.title = "DI DISTRIBUTOR (INFRASTRUKTUR)"
                $0.hidden = "$segments != 'INFRA'"
            }
            <<< LabelRow(){
                $0.title = "MANAJEMEN GUDANG & KONDISI VAN DELIVERY"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                })
            
            <<< LabelRow(){
                $0.title = "1. Seberapa baik Anda mengetahui kondisi dan rencana perbaikan (bila ada) dari :"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_1a"
                $0.title = "\ta. Kondisi gudang (Racking, dinding, lantai, ceiling/plafon, dan ventilasi)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_1ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_1b"
                $0.title = "\tb. Perlakukan untuk produk rusak (adanya label dan pemisahan di tempat khusus)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_1br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_1c"
                $0.title = "\tc. Penerapan FEFO di gudang"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_1cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_1d"
                $0.title = "\td. Monitoring expiry date"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_1dr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_1e"
                $0.title = "\te. Penataan produk dalam gudang (foods dan non-foods tidak tercampur)"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_1er"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_1f"
                $0.title = "\tf. Stacking produk sesuai dengan yang direkomendasikan di karton"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_1fr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_1g"
                $0.title = "\tg. Jadwal pembersihan dan perawatan gudang"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_1gr"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< LabelRow(){
                $0.title = "2. Kondisi dan kebersihan Van :"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_2a"
                $0.title = "\ta. Apakah kondisi kendaraan bebas dari rembesan oli, ban botak?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_2ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_2b"
                $0.title = "\tb. Apakah body, Atap, pintu & Lantai kendaaran bebas dari kerusakan & berfungsi baik?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_2br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_2c"
                $0.title = "\tc. Apakah bagian dalam kendaraan bebas dari basah dan lembab?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_2cr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_2d"
                $0.title = "\td. Apakah lantai Kendaraan bebas dari serpihan kasar, kaca, paku, staples?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_2dr"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_infra_2e"
                $0.title = "\te. Apakah lendaraan dalam kondisi  bebas bekas terserang hama (misal: rayap, sarang serangga /laba laba)?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_2er"
                $0.placeholder = "\tRemarks:"
            }
            
            <<< CheckRow(){
                $0.tag = "dts_infra_3"
                $0.title = "3. Apakah Anda sebagai bisnis partner pernah mendiskusikan perbaikan ini dengan owner distributor?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_infra_3r"
                $0.placeholder = "Remarks:"
            }
            
            +++ Section("TEAM"){
                $0.header?.title = "DI PASAR (dengan DSR)"
                $0.hidden = "$segments != 'TEAM'"
            }
            
            <<< CheckRow(){
                $0.tag = "dts_dsr_1a"
                $0.title = "\ta. Apakah DSR melakukan kunjungan sesuai PJP dan mengisi TRC/LeverEdge Mobility?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_dsr_1ar"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_dsr_1b"
                $0.title = "\tb. Saat DSR menwarkan produk, apakah Product Knowledge sesuai Selling Story?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_dsr_1br"
                $0.placeholder = "\tRemarks:"
            }
            <<< CheckRow(){
                $0.tag = "dts_dsr_1c"
                $0.title = "\tc. Seberapa dekat relasi Anda dengan Top 10 wholesaler Anda?"
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                })
            <<< TextRow(){
                $0.tag = "dts_dsr_1cr"
                $0.placeholder = "\tRemarks:"
            }

            <<< ButtonRow("save") {row in
                row.title = "Save"
                row.onCellSelection(self.saveDTSCoreData)
                }.cellUpdate({ (cell, row) in
                    cell.textLabel?.textColor = UIColor.whiteColor()
                })
            
        }
        
        if language == "Optional(\"English\")" {
            
            form =  Section(){
                section in
                var footer = HeaderFooterView<UITableViewHeaderFooterView>(.Class)
                footer.onSetupView = {view in
                    view.view.textLabel!.text = "**The following questions is a guidelines for you to coach\n the team to develop better in Selling Skills (Basic Call Procedure)"
                    view.view.textLabel!.textColor = UIColor.orangeColor()
                    view.view.textLabel?.numberOfLines = 2
                    view.view.textLabel?.textAlignment = NSTextAlignment.Center
                    view.view.textLabel!.font = UIFont.italicSystemFontOfSize(9)
                }
                footer.height = {30}
                section.footer = footer
                }
                
                
                
                <<< SegmentedRow<String>("segments"){
                    $0.options = ["GENERAL", "REPORTING", "INFRA","TEAM"]
                    $0.value = "GENERAL"
                    }.cellUpdate({ (cell, row) in
                        cell.tintColor = .orangeColor()
                        cell.textLabel!.numberOfLines = 2
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                    })
                
                +++ Section()
                
                <<< TextRow(){
                    $0.title = "Coach\t: \(coachname)"
                    $0.disabled = true
                }
                <<< TextRow(){
                    $0.title = "Coachee\t: \(coacheename)"
                    $0.disabled = true
                }
                <<< TextRow(){
                    $0.tag = "distributor"
                    $0.title = "Distributor\t:"
                }
                <<< TextRow(){
                    $0.tag = "area"
                    $0.title = "Area\t\t:"
                }
                
                
                +++ Section("GENERAL"){
                    $0.header?.title = "BEFORE ARRIVING IN DISTRIBUTOR"
                    $0.hidden = "$segments != 'GENERAL'"
                }
                <<< LabelRow(){
                    $0.title = "TERRITORY PROFILE MASTERY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                    })
                <<< LabelRow(){
                    $0.title = "1. Coverage"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_1a"
                    $0.title = "\ta. How many wholesaler is covered by distributor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_1ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_1b"
                    $0.title = "\tb. How many bakery wholesaler is covered?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_1br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_1c"
                    $0.title = "\tc. How many Horeca wholesaLer is covered?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_1cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_1d"
                    $0.title = "\td. How many market available on your territory ? How many has been covered?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_1dr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_1e"
                    $0.title = "\te. How many Local Cash&Carry (LCC) available in your territory? How many has been covered?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_1er"
                    $0.placeholder = "\tRemarks:"
                }
                
                
                <<< LabelRow(){
                    $0.title = "2. Target"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_2a"
                    $0.title = "\ta. What is your full-year target?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_2ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_2b"
                    $0.title = "\tb. What is your distributor AWS (Average Weekly Sales)?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_2br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_2c"
                    $0.title = "\tc. What is the achievement percentage last week?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_2cr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "UFS BRAND MASTERY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                    })
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_2_1a"
                    $0.title = "1. Do you know Top 10 UFS? What are they?"
                }
                <<< TextRow(){
                    $0.tag = "dts_sebelum_2_1ar"
                    $0.placeholder = "Remarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "2. Do you know the penetration target & achievement of these TLC products :"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_2_2a"
                    $0.title = "\ta. Royco Bumbu Dasar Ayam Kuning"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_2_2ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_2_2b"
                    $0.title = "\tb. Royco Bumbu Dasar Rendang"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_2_2br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_2_2c"
                    $0.title = "\tc. SariWangi Celup Jumbo"
                }
                <<< TextRow(){
                    $0.tag = "dts_sebelum_2_2cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_2_2d"
                    $0.title = "\td. Knorr Oyster"
                }
                <<< TextRow(){
                    $0.tag = "dts_sebelum_2_2dr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_2_2e"
                    $0.title = "\te. KMP 500Gr"
                }
                <<< TextRow(){
                    $0.tag = "dts_sebelum_2_2er"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "CHEFMANSHIP SKILL"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                    })
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_3_1"
                    $0.title = "1. How often do you join training Simple Wet Sampling Dilution in Class Training by ASMPull?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_3_1r"
                    $0.placeholder = "Remarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_sebelum_3_2"
                    $0.title = "2. How much SKU point that you memorize? Please mention the strength/Selling story"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_sebelum_3_2r"
                    $0.placeholder = "Remarks:"
                }
                
                +++ Section("REPORTING"){
                    $0.header?.title = "AT DISTRIBUTOR (REPORT)"
                    $0.hidden = "$segments != 'REPORTING'"
                }
                
                <<< LabelRow(){
                    $0.title = "1. Regarding Team Monitoring:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_report_1a"
                    $0.title = "\ta. How often your team do morning and afternoon briefing at the distributor?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_report_1ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_report_1b"
                    $0.title = "\tb. Does your DTS team well-informed about the points on the wall report? \n\t*Ask the ASM/DTS to show and explain the Wall Report at the distributor"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_report_1br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "2. Monitoring Team Discipline :"
                }
                <<< CheckRow(){
                    $0.tag = "dts_report_2a"
                    $0.title = "\ta. What is the percentage of average achievement of DSR visitation according to PJP in your territory?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_report_2ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_report_2b"
                    $0.title = "\tb. What is the percentage of average effective call (EC) on each DSR in your territory? \n\t*Ask DTS to show and explain the contents of TRC or Leveredge Mobility"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_report_2br"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "3. Team Capability Development:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_report_3a"
                    $0.title = "\ta. How often do you conduct coaching for DSR?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_report_3ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_report_3b"
                    $0.title = "\tb. How often do you conduct coaching for DSS?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_report_3br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_report_3c"
                    $0.title = "\tc. Should you use this application to document the coaching result? \n\t*DTS should conduct coaching to DSR 2x/week and to DSS/OM 1x/week"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_report_3cr"
                    $0.placeholder = "\tRemarks:"
                }
                
                +++ Section("INFRA"){
                    $0.header?.title = "AT DISTRIBUTOR (INFRASTRUKTUR)"
                    $0.hidden = "$segments != 'INFRA'"
                }
                <<< LabelRow(){
                    $0.title = "MANAJEMEN GUDANG & KONDISI VAN DELIVERY"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.font = UIFont.boldSystemFontOfSize(10)
                    })
                
                <<< LabelRow(){
                    $0.title = "1. How well do you know the condition and repair plans (if any) of :"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_1a"
                    $0.title = "\ta. Warehouse condition (Racking, wall, floor, ceiling, and ventilation)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_1ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_1b"
                    $0.title = "\tb. Treatment to broken products (labeling and separation to another place)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_1br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_1c"
                    $0.title = "\tc. FEFO implementation in warehouse"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_1cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_1d"
                    $0.title = "\td. Monitoring expiry date"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_1dr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_1e"
                    $0.title = "\te. Warehouse product placement (separate foods and non-foods)"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_1er"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_1f"
                    $0.title = "\tf. Product stacking according to recommended stacking instruction in package"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_1fr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_1g"
                    $0.title = "\tg. Warehouse Cleaning and Maintenance Schedule"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_1gr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< LabelRow(){
                    $0.title = "2. Van condition and cleanliness :"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_2a"
                    $0.title = "\ta. Is the vehicle free from spilled oil and bald tires?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_2ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_2b"
                    $0.title = "\tb. Is the vehicle body, ceiling, door & floor free from damage and works well?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_2br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_2c"
                    $0.title = "\tc. Is the vehicle interior wet & humid free?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_2cr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_2d"
                    $0.title = "\td. Is the vehicle floor free from splinters, flakes, glasses, nails, or stables?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_2dr"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_infra_2e"
                    $0.title = "\te. Is the vehicle free from any pests (e.g.: termite, bug, spider - and its webs)?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_2er"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< CheckRow(){
                    $0.tag = "dts_infra_3"
                    $0.title = "3. Does you, as the business partner, ever discussed this repair with the distributor owner?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_infra_3r"
                    $0.placeholder = "Remarks:"
                }
                
                +++ Section("TEAM"){
                    $0.header?.title = "AT THE PASAR (with DSR)"
                    $0.hidden = "$segments != 'TEAM'"
                }
                
                <<< CheckRow(){
                    $0.tag = "dts_dsr_1a"
                    $0.title = "\ta. Does the DSR conduct visits according to PJP and fills the TRC/LeverEdge Mobility?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_dsr_1ar"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_dsr_1b"
                    $0.title = "\tb. When DSR offers product, is the Product Knowledge corresponds the Selling Story?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_dsr_1br"
                    $0.placeholder = "\tRemarks:"
                }
                <<< CheckRow(){
                    $0.tag = "dts_dsr_1c"
                    $0.title = "\tc. How close is your relation to your Top 10 wholesaler?"
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        cell.textLabel!.numberOfLines = NSLineBreakMode.ByWordWrapping.rawValue
                    })
                <<< TextRow(){
                    $0.tag = "dts_dsr_1cr"
                    $0.placeholder = "\tRemarks:"
                }
                
                <<< ButtonRow("save") {row in
                    row.title = "Save"
                    row.onCellSelection(self.saveDTSCoreData)
                    }.cellUpdate({ (cell, row) in
                        cell.textLabel?.textColor = UIColor.whiteColor()
                    })
            
        }
        
        print(AppDelegate.getAppDelegate().getDocDir())
    }
    
    
    func saveDTSCoreData(cell: ButtonCellOf<String>, row: ButtonRow) {
        
        if let distributor = self.form.rowByTag("distributor")?.baseValue as? String
        {
            self.distributor = distributor
        }
        if let area = self.form.rowByTag("area")?.baseValue as? String
        {
            self.area = area
        }
        
        if let dts_sebelum_1a = self.form.rowByTag("dts_sebelum_1a")?.baseValue as? Bool
        {
            self.dts_sebelum_1a = dts_sebelum_1a
        }
        if let dts_sebelum_1ar = self.form.rowByTag("dts_sebelum_1ar")?.baseValue as? String
        {
            self.dts_sebelum_1ar = dts_sebelum_1ar
        }
        if let dts_sebelum_1b = self.form.rowByTag("dts_sebelum_1b")?.baseValue as? Bool
        {
            self.dts_sebelum_1b = dts_sebelum_1b
        }
        if let dts_sebelum_1br = self.form.rowByTag("dts_sebelum_1br")?.baseValue as? String
        {
            self.dts_sebelum_1br = dts_sebelum_1br
        }
        if let dts_sebelum_1c = self.form.rowByTag("dts_sebelum_1c")?.baseValue as? Bool
        {
            self.dts_sebelum_1c = dts_sebelum_1c
        }
        if let dts_sebelum_1cr = self.form.rowByTag("dts_sebelum_1cr")?.baseValue as? String
        {
            self.dts_sebelum_1cr = dts_sebelum_1cr
        }
        if let dts_sebelum_1d = self.form.rowByTag("dts_sebelum_1d")?.baseValue as? Bool
        {
            self.dts_sebelum_1d = dts_sebelum_1d
        }
        if let dts_sebelum_1dr = self.form.rowByTag("dts_sebelum_1dr")?.baseValue as? String
        {
            self.dts_sebelum_1dr = dts_sebelum_1dr
        }
        if let dts_sebelum_1e = self.form.rowByTag("dts_sebelum_1e")?.baseValue as? Bool
        {
            self.dts_sebelum_1e = dts_sebelum_1e
        }
        if let dts_sebelum_1er = self.form.rowByTag("dts_sebelum_1er")?.baseValue as? String
        {
            self.dts_sebelum_1er = dts_sebelum_1er
        }
        
        if let dts_sebelum_2a = self.form.rowByTag("dts_sebelum_2a")?.baseValue as? Bool
        {
            self.dts_sebelum_2a = dts_sebelum_2a
        }
        if let dts_sebelum_2ar = self.form.rowByTag("dts_sebelum_2ar")?.baseValue as? String
        {
            self.dts_sebelum_2ar = dts_sebelum_2ar
        }
        if let dts_sebelum_2b = self.form.rowByTag("dts_sebelum_2b")?.baseValue as? Bool
        {
            self.dts_sebelum_2b = dts_sebelum_2b
        }
        if let dts_sebelum_2br = self.form.rowByTag("dts_sebelum_2br")?.baseValue as? String
        {
            self.dts_sebelum_2br = dts_sebelum_2br
        }
        if let dts_sebelum_2c = self.form.rowByTag("dts_sebelum_2c")?.baseValue as? Bool
        {
            self.dts_sebelum_2c = dts_sebelum_2c
        }
        if let dts_sebelum_2cr = self.form.rowByTag("dts_sebelum_2cr")?.baseValue as? String
        {
            self.dts_sebelum_2cr = dts_sebelum_2cr
        }
        
        if let dts_sebelum_2_1a = self.form.rowByTag("dts_sebelum_2_1a")?.baseValue as? Bool
        {
            self.dts_sebelum_2_1a = dts_sebelum_2_1a
        }
        if let dts_sebelum_2_1ar = self.form.rowByTag("dts_sebelum_2_1ar")?.baseValue as? String
        {
            self.dts_sebelum_2_1ar = dts_sebelum_2_1ar
        }
        if let dts_sebelum_2_2a = self.form.rowByTag("dts_sebelum_2_2a")?.baseValue as? Bool
        {
            self.dts_sebelum_2_2a = dts_sebelum_2_2a
        }
        if let dts_sebelum_2_2ar = self.form.rowByTag("dts_sebelum_2_2ar")?.baseValue as? String
        {
            self.dts_sebelum_2_2ar = dts_sebelum_2_2ar
        }
        if let dts_sebelum_2_2b = self.form.rowByTag("dts_sebelum_2_2b")?.baseValue as? Bool
        {
            self.dts_sebelum_2_2b = dts_sebelum_2_2b
        }
        if let dts_sebelum_2_2br = self.form.rowByTag("dts_sebelum_2_2br")?.baseValue as? String
        {
            self.dts_sebelum_2_2br = dts_sebelum_2_2br
        }
        if let dts_sebelum_2_2c = self.form.rowByTag("dts_sebelum_2_2c")?.baseValue as? Bool
        {
            self.dts_sebelum_2_2c = dts_sebelum_2_2c
        }
        if let dts_sebelum_2_2cr = self.form.rowByTag("dts_sebelum_2_2cr")?.baseValue as? String
        {
            self.dts_sebelum_2_2cr = dts_sebelum_2_2cr
        }
        if let dts_sebelum_2_2d = self.form.rowByTag("dts_sebelum_2_2d")?.baseValue as? Bool
        {
            self.dts_sebelum_2_2d = dts_sebelum_2_2d
        }
        if let dts_sebelum_2_2dr = self.form.rowByTag("dts_sebelum_2_2dr")?.baseValue as? String
        {
            self.dts_sebelum_2_2dr = dts_sebelum_2_2dr
        }
        if let dts_sebelum_2_2e = self.form.rowByTag("dts_sebelum_2_2e")?.baseValue as? Bool
        {
            self.dts_sebelum_2_2e = dts_sebelum_2_2e
        }
        if let dts_sebelum_2_2er = self.form.rowByTag("dts_sebelum_2_2er")?.baseValue as? String
        {
            self.dts_sebelum_2_2er = dts_sebelum_2_2er
        }
        
        if let dts_sebelum_3_1 = self.form.rowByTag("dts_sebelum_3_1")?.baseValue as? Bool
        {
            self.dts_sebelum_3_1 = dts_sebelum_3_1
        }
        if let dts_sebelum_3_1r = self.form.rowByTag("dts_sebelum_3_1r")?.baseValue as? String
        {
            self.dts_sebelum_3_1r = dts_sebelum_3_1r
        }
        if let dts_sebelum_3_2 = self.form.rowByTag("dts_sebelum_3_2")?.baseValue as? Bool
        {
            self.dts_sebelum_3_2 = dts_sebelum_3_2
        }
        if let dts_sebelum_3_2r = self.form.rowByTag("dts_sebelum_3_2r")?.baseValue as? String
        {
            self.dts_sebelum_3_2r = dts_sebelum_3_2r
        }
        
        if let dts_report_1a = self.form.rowByTag("dts_report_1a")?.baseValue as? Bool
        {
            self.dts_report_1a = dts_report_1a
        }
        if let dts_report_1ar = self.form.rowByTag("dts_report_1ar")?.baseValue as? String
        {
            self.dts_report_1ar = dts_report_1ar
        }
        if let dts_report_1b = self.form.rowByTag("dts_report_1b")?.baseValue as? Bool
        {
            self.dts_report_1b = dts_report_1b
        }
        if let dts_report_1br = self.form.rowByTag("dts_report_1br")?.baseValue as? String
        {
            self.dts_report_1br = dts_report_1br
        }
        
        if let dts_report_2a = self.form.rowByTag("dts_report_2a")?.baseValue as? Bool
        {
            self.dts_report_2a = dts_report_2a
        }
        if let dts_report_2ar = self.form.rowByTag("dts_report_2ar")?.baseValue as? String
        {
            self.dts_report_2ar = dts_report_2ar
        }
        if let dts_report_2b = self.form.rowByTag("dts_report_2b")?.baseValue as? Bool
        {
            self.dts_report_2b = dts_report_2b
        }
        if let dts_report_2br = self.form.rowByTag("dts_report_2br")?.baseValue as? String
        {
            self.dts_report_2br = dts_report_2br
        }
        
        if let dts_report_3a = self.form.rowByTag("dts_report_3a")?.baseValue as? Bool
        {
            self.dts_report_3a = dts_report_3a
        }
        if let dts_report_3ar = self.form.rowByTag("dts_report_3ar")?.baseValue as? String
        {
            self.dts_report_3ar = dts_report_3ar
        }
        if let dts_report_3b = self.form.rowByTag("dts_report_3b")?.baseValue as? Bool
        {
            self.dts_report_3b = dts_report_3b
        }
        if let dts_report_3br = self.form.rowByTag("dts_report_3br")?.baseValue as? String
        {
            self.dts_report_3br = dts_report_3br
        }
        if let dts_report_3c = self.form.rowByTag("dts_report_3c")?.baseValue as? Bool
        {
            self.dts_report_3c = dts_report_3c
        }
        if let dts_report_3cr = self.form.rowByTag("dts_report_3cr")?.baseValue as? String
        {
            self.dts_report_3cr = dts_report_3cr
        }
        
        if let dts_infra_1a = self.form.rowByTag("dts_infra_1a")?.baseValue as? Bool
        {
            self.dts_infra_1a = dts_infra_1a
        }
        if let dts_infra_1ar = self.form.rowByTag("dts_infra_1ar")?.baseValue as? String
        {
            self.dts_infra_1ar = dts_infra_1ar
        }
        if let dts_infra_1b = self.form.rowByTag("dts_infra_1b")?.baseValue as? Bool
        {
            self.dts_infra_1b = dts_infra_1b
        }
        if let dts_infra_1br = self.form.rowByTag("dts_infra_1br")?.baseValue as? String
        {
            self.dts_infra_1br = dts_infra_1br
        }
        if let dts_infra_1c = self.form.rowByTag("dts_infra_1c")?.baseValue as? Bool
        {
            self.dts_infra_1c = dts_infra_1c
        }
        if let dts_infra_1cr = self.form.rowByTag("dts_infra_1cr")?.baseValue as? String
        {
            self.dts_infra_1cr = dts_infra_1cr
        }
        if let dts_infra_1d = self.form.rowByTag("dts_infra_1d")?.baseValue as? Bool
        {
            self.dts_infra_1d = dts_infra_1d
        }
        if let dts_infra_1dr = self.form.rowByTag("dts_infra_1dr")?.baseValue as? String
        {
            self.dts_infra_1dr = dts_infra_1dr
        }
        if let dts_infra_1e = self.form.rowByTag("dts_infra_1e")?.baseValue as? Bool
        {
            self.dts_infra_1e = dts_infra_1e
        }
        if let dts_infra_1er = self.form.rowByTag("dts_infra_1er")?.baseValue as? String
        {
            self.dts_infra_1er = dts_infra_1er
        }
        if let dts_infra_1f = self.form.rowByTag("dts_infra_1f")?.baseValue as? Bool
        {
            self.dts_infra_1f = dts_infra_1f
        }
        if let dts_infra_1fr = self.form.rowByTag("dts_infra_1fr")?.baseValue as? String
        {
            self.dts_infra_1fr = dts_infra_1fr
        }
        if let dts_infra_1g = self.form.rowByTag("dts_infra_1g")?.baseValue as? Bool
        {
            self.dts_infra_1g = dts_infra_1g
        }
        if let dts_infra_1gr = self.form.rowByTag("dts_infra_1gr")?.baseValue as? String
        {
            self.dts_infra_1gr = dts_infra_1gr
        }
        
        if let dts_infra_2a = self.form.rowByTag("dts_infra_2a")?.baseValue as? Bool
        {
            self.dts_infra_2a = dts_infra_2a
        }
        if let dts_infra_2ar = self.form.rowByTag("dts_infra_2ar")?.baseValue as? String
        {
            self.dts_infra_2ar = dts_infra_2ar
        }
        if let dts_infra_2b = self.form.rowByTag("dts_infra_2b")?.baseValue as? Bool
        {
            self.dts_infra_2b = dts_infra_2b
        }
        if let dts_infra_2br = self.form.rowByTag("dts_infra_2br")?.baseValue as? String
        {
            self.dts_infra_2br = dts_infra_2br
        }
        if let dts_infra_2c = self.form.rowByTag("dts_infra_2c")?.baseValue as? Bool
        {
            self.dts_infra_2c = dts_infra_2c
        }
        if let dts_infra_2cr = self.form.rowByTag("dts_infra_2cr")?.baseValue as? String
        {
            self.dts_infra_2cr = dts_infra_2cr
        }
        if let dts_infra_2d = self.form.rowByTag("dts_infra_2d")?.baseValue as? Bool
        {
            self.dts_infra_2d = dts_infra_2d
        }
        if let dts_infra_2dr = self.form.rowByTag("dts_infra_2dr")?.baseValue as? String
        {
            self.dts_infra_2dr = dts_infra_2dr
        }
        if let dts_infra_2e = self.form.rowByTag("dts_infra_2e")?.baseValue as? Bool
        {
            self.dts_infra_2e = dts_infra_2e
        }
        if let dts_infra_2er = self.form.rowByTag("dts_infra_2er")?.baseValue as? String
        {
            self.dts_infra_2er = dts_infra_2er
        }
        if let dts_infra_3 = self.form.rowByTag("dts_infra_3")?.baseValue as? Bool
        {
            self.dts_infra_3 = dts_infra_3
        }
        if let dts_infra_3r = self.form.rowByTag("dts_infra_3r")?.baseValue as? String
        {
            self.dts_infra_3r = dts_infra_3r
        }

        if let dts_dsr_1a = self.form.rowByTag("dts_dsr_1a")?.baseValue as? Bool
        {
            self.dts_dsr_1a = dts_dsr_1a
        }
        if let dts_dsr_1ar = self.form.rowByTag("dts_dsr_1ar")?.baseValue as? String
        {
            self.dts_dsr_1ar = dts_dsr_1ar
        }
        if let dts_dsr_1b = self.form.rowByTag("dts_dsr_1b")?.baseValue as? Bool
        {
            self.dts_dsr_1b = dts_dsr_1b
        }
        if let dts_dsr_1br = self.form.rowByTag("dts_dsr_1br")?.baseValue as? String
        {
            self.dts_dsr_1br = dts_dsr_1br
        }
        if let dts_dsr_1c = self.form.rowByTag("dts_dsr_1c")?.baseValue as? Bool
        {
            self.dts_dsr_1c = dts_dsr_1c
        }
        if let dts_dsr_1cr = self.form.rowByTag("dts_dsr_1cr")?.baseValue as? String
        {
            self.dts_dsr_1cr = dts_dsr_1cr
        }

        
        
        let csession = NSUserDefaults.standardUserDefaults().objectForKey(KeyLocal.coachingSession) as! String
        
        
        self.saveQuestionData("", questionID: "dts_sebelum_1a",textAnswer: self.dts_sebelum_1ar,tickAnswer: self.dts_sebelum_1a, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_1b",textAnswer: self.dts_sebelum_1br,tickAnswer: self.dts_sebelum_1b, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_1c",textAnswer: self.dts_sebelum_1cr,tickAnswer: self.dts_sebelum_1c, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_1d",textAnswer: self.dts_sebelum_1dr,tickAnswer: self.dts_sebelum_1d, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_1e",textAnswer: self.dts_sebelum_1er,tickAnswer: self.dts_sebelum_1e, id: csession)
        
        self.saveQuestionData("", questionID: "dts_sebelum_2a",textAnswer: self.dts_sebelum_2ar,tickAnswer: self.dts_sebelum_2a, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_2b",textAnswer: self.dts_sebelum_2br,tickAnswer: self.dts_sebelum_2b, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_2c",textAnswer: self.dts_sebelum_2cr,tickAnswer: self.dts_sebelum_2c, id: csession)
        
        self.saveQuestionData("", questionID: "dts_sebelum_2_1a",textAnswer: self.dts_sebelum_2_1ar,tickAnswer: self.dts_sebelum_2_1a, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_2_2a",textAnswer: self.dts_sebelum_2_2ar,tickAnswer: self.dts_sebelum_2_2a, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_2_2b",textAnswer: self.dts_sebelum_2_2br,tickAnswer: self.dts_sebelum_2_2b, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_2_2c",textAnswer: self.dts_sebelum_2_2cr,tickAnswer: self.dts_sebelum_2_2c, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_2_2d",textAnswer: self.dts_sebelum_2_2dr,tickAnswer: self.dts_sebelum_2_2d, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_2_2e",textAnswer: self.dts_sebelum_2_2er,tickAnswer: self.dts_sebelum_2_2e, id: csession)
        
        self.saveQuestionData("", questionID: "dts_sebelum_3_1",textAnswer: self.dts_sebelum_3_1r,tickAnswer: self.dts_sebelum_3_1, id: csession)
        self.saveQuestionData("", questionID: "dts_sebelum_3_2",textAnswer: self.dts_sebelum_3_2r,tickAnswer: self.dts_sebelum_3_2, id: csession)
        
        self.saveQuestionData("", questionID: "dts_report_1a",textAnswer: self.dts_report_1ar,tickAnswer: self.dts_report_1a, id: csession)
        self.saveQuestionData("", questionID: "dts_report_1b",textAnswer: self.dts_report_1br,tickAnswer: self.dts_report_1b, id: csession)
        self.saveQuestionData("", questionID: "dts_report_2a",textAnswer: self.dts_report_2ar,tickAnswer: self.dts_report_2a, id: csession)
        self.saveQuestionData("", questionID: "dts_report_2b",textAnswer: self.dts_report_2br,tickAnswer: self.dts_report_2b, id: csession)
        self.saveQuestionData("", questionID: "dts_report_3a",textAnswer: self.dts_report_3ar,tickAnswer: self.dts_report_3a, id: csession)
        self.saveQuestionData("", questionID: "dts_report_3b",textAnswer: self.dts_report_3br,tickAnswer: self.dts_report_3b, id: csession)
        self.saveQuestionData("", questionID: "dts_report_3c",textAnswer: self.dts_report_3cr,tickAnswer: self.dts_report_3c, id: csession)
        
        self.saveQuestionData("", questionID: "dts_infra_1a",textAnswer: self.dts_infra_1ar,tickAnswer: self.dts_infra_1a, id: csession)
        self.saveQuestionData("", questionID: "dts_infra_1b",textAnswer: self.dts_infra_1br,tickAnswer: self.dts_infra_1b, id: csession)
        self.saveQuestionData("", questionID: "dts_infra_1c",textAnswer: self.dts_infra_1cr,tickAnswer: self.dts_infra_1c, id: csession)
        self.saveQuestionData("", questionID: "dts_infra_1d",textAnswer: self.dts_infra_1dr,tickAnswer: self.dts_infra_1d, id: csession)
        self.saveQuestionData("", questionID: "dts_infra_1e",textAnswer: self.dts_infra_1er,tickAnswer: self.dts_infra_1e, id: csession)
        self.saveQuestionData("", questionID: "dts_infra_1f",textAnswer: self.dts_infra_1fr,tickAnswer: self.dts_infra_1f, id: csession)
        self.saveQuestionData("", questionID: "dts_infra_1g",textAnswer: self.dts_infra_1gr,tickAnswer: self.dts_infra_1g, id: csession)
        
        self.saveQuestionData("", questionID: "dts_infra_2a",textAnswer: self.dts_infra_2ar,tickAnswer: self.dts_infra_2a, id: csession)
        self.saveQuestionData("", questionID: "dts_infra_2b",textAnswer: self.dts_infra_2br,tickAnswer: self.dts_infra_2b, id: csession)
        self.saveQuestionData("", questionID: "dts_infra_2c",textAnswer: self.dts_infra_2cr,tickAnswer: self.dts_infra_2c, id: csession)
        self.saveQuestionData("", questionID: "dts_infra_2d",textAnswer: self.dts_infra_2dr,tickAnswer: self.dts_infra_2d, id: csession)
        self.saveQuestionData("", questionID: "dts_infra_2e",textAnswer: self.dts_infra_2er,tickAnswer: self.dts_infra_2e, id: csession)
        
        self.saveQuestionData("", questionID: "dts_infra_3",textAnswer: self.dts_infra_3r,tickAnswer: self.dts_infra_3, id: csession)
        
        self.saveQuestionData("", questionID: "dts_dsr_1a",textAnswer: self.dts_dsr_1ar,tickAnswer: self.dts_dsr_1a, id: csession)
        self.saveQuestionData("", questionID: "dts_dsr_1b",textAnswer: self.dts_dsr_1br,tickAnswer: self.dts_dsr_1b, id: csession)
        self.saveQuestionData("", questionID: "dts_dsr_1c",textAnswer: self.dts_dsr_1cr,tickAnswer: self.dts_dsr_1c, id: csession)
        
        self.updateCoachingData(self.distributor, area: self.area, id: csession)
        
        self.performSegueWithIdentifier("dtsToSummary", sender: nil)
        
    }
    
    func saveQuestionData(columnID: String, questionID: String, textAnswer: String, tickAnswer:Bool, id: String) {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("CoachingQuestionAnswer", inManagedObjectContext: managedObjectContext)
        let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        
        managedObject.setValue(columnID, forKey: "columnID")
        managedObject.setValue(questionID, forKey: "questionID")
        managedObject.setValue(textAnswer, forKey: "textAnswer")
        managedObject.setValue(tickAnswer, forKey: "tickAnswer")
        managedObject.setValue(id, forKey: "id")
        
        do {
            try managedObjectContext.save()
        }
            
        catch let error as NSError {
            print(error)
        }
        
    }
    
    func updateCoachingData(distributor: String, area: String, id: String) {
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "CoachingSession")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        let coachingGuideline = Int(NSUserDefaults.standardUserDefaults().stringForKey(KeyLocal.coachingGuideline)!)
        
        do {
            if let fetchResults = try appDel.managedObjectContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            {
                if fetchResults.count != 0{
                    
                    let managedObject = fetchResults[0]
                    managedObject.setValue(distributor, forKey: "distributor")
                    managedObject.setValue(area, forKey: "area")
                    managedObject.setValue(coachingGuideline, forKey: "coachingGuideline")
                    NSUserDefaults.standardUserDefaults().setValue(distributor, forKey: KeyLocal.distributor)
                    NSUserDefaults.standardUserDefaults().setValue(area, forKey: KeyLocal.area)
                    
                    try context.save()
                }
            }
        }
        catch {
            print(error)
        }
    }
    
}
