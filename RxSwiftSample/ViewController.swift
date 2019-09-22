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
	
	let viewModel = ViewModel()
	
	let disposeBag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		bindViewModel()
	}
	
	private func bindViewModel(){
		inputTextField.rx.text.orEmpty.bind(to: viewModel.inputText).disposed(by: disposeBag)
		viewModel.inputText.bind(to: outputLabel.rx.text).disposed(by: disposeBag)
		viewModel.textColor.bind(to: outputLabel.rx.backgroundColor).disposed(by: disposeBag)
	}


}

