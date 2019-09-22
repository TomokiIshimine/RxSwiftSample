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

class ViewModel: NSObject {
	let inputText = BehaviorRelay<String>(value: "")
	let textColor = BehaviorRelay<UIColor>(value: .black)
}
