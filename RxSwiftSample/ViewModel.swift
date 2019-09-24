//
//  ViewModel.swift
//  RxSwiftSample
//
//  Created by 伊志嶺朝輝 on 2019/09/22.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class ViewModel: NSObject {
	private let inputText = BehaviorRelay<String>(value: "")
	var driverInputText:Driver<String>{
		return inputText.asDriver()
	}
	private let textColor = BehaviorRelay<UIColor>(value: .white)
	var driverTextColor:  Driver<UIColor>{
		return textColor.asDriver()
	}
	
	private let disposeBag = DisposeBag()
	
	private static let ColorSet:[UIColor] = [.white, .black, .red, .blue, .yellow, .green]
	
	private var colorIdx = 0
	
	init(inputText:Observable<String>, didTapButton:ControlEvent<Void>){
		super.init()
		inputText.bind(to: self.inputText).disposed(by: disposeBag)
		didTapButton.subscribe { [weak self] _ in
			guard let self = self else {
				return
			}
			
			self.colorIdx = (self.colorIdx + 1) >= ViewModel.ColorSet.count ? 0 : (self.colorIdx + 1)
			self.textColor.accept(ViewModel.ColorSet[self.colorIdx])
		}.disposed(by: disposeBag)
	}
}
