//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by 伊志嶺朝輝 on 2019/09/21.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
	
	@IBOutlet private weak var outputLabel: UILabel!
	
	@IBOutlet private weak var inputTextField: UITextField!
	
	@IBOutlet private weak var inputButton: UIButton!
	
	private let disposeBag = DisposeBag()
	
	private var viewModel:ViewModel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = ViewModel(inputText: inputTextField.rx.text.orEmpty.asObservable(), didTapButton: inputButton.rx.tap)
		
		viewModel?.driverInputText.drive(outputLabel.rx.text).disposed(by: disposeBag)
		viewModel?.driverTextColor.drive(outputLabel.rx.backgroundColor).disposed(by: disposeBag)
	}

}

