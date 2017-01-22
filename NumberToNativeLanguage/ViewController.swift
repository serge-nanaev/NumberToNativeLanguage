//
//  ViewController.swift
//  NumberToNativeLanguage
//
//  Created by Serge Nanaev on 21.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

import UIKit

fileprivate enum Mode {
    case numbers
    case nativeLanguageNumbers
}

class ViewController: UITableViewController {
    
    //MARK:- Properties
    
    fileprivate var numbers: [Int] = []
    fileprivate var mode: Mode = .numbers {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK:- Initializaion and Setup
    
    fileprivate func setupNavigation() {
        self.navigationItem.title = "Surf: Test"
        let convertButton = UIBarButtonItem(title: "Convert", style: .plain, target: self, action: #selector(changeMode))
        self.navigationItem.rightBarButtonItem = convertButton
    }

    //MARK:- ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDataFromInput()
        self.setupNavigation()
    }
    
    //MARK:- Data
    
    fileprivate func loadDataFromInput() {
        let plistFileName = "input"
        guard let plistPath = Bundle.main.path(forResource: plistFileName, ofType: "plist") else { return  }
        if FileManager.default.fileExists(atPath: plistPath) {
            if let numbersDict = NSMutableDictionary(contentsOfFile: plistPath) {
                for (_, element) in numbersDict.enumerated() {
                    if let number = Int(element.key as! String) {
                        numbers.append(number)
                    }
                }
            }
        }
    }
    
    @objc fileprivate func changeMode() {
        switch mode {
        case .numbers:
            mode = .nativeLanguageNumbers
        case .nativeLanguageNumbers:
            mode = .numbers
        }
    }
    
    //MARK:- TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleCell", for: indexPath)
        cell.textLabel?.numberOfLines = 2
        let number = numbers[indexPath.row]
        
        switch mode {
        case .numbers:
            cell.textLabel?.text = String(number)
        case .nativeLanguageNumbers:
            cell.textLabel?.text = NumberConverter.convert(number: number)
        }
        
        return cell
    }
}

