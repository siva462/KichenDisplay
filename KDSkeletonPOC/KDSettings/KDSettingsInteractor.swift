//
//  KDSettingsInteractor.swift
//  KDSkeletonPOC
//
//  Created by Wipro on 24/12/19.
//  Copyright (c) 2019 wipro. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol KDSettingsBusinessLogic
{
  func fetchSettingsdata(request: KDSettings.Something.Request)
}

protocol KDSettingsDataStore
{
    var settingsObj: [Settings]? { get }
}

class KDSettingsInteractor: KDSettingsBusinessLogic, KDSettingsDataStore
{
    var settingsObj: [Settings]?
    
  var presenter: KDSettingsPresentationLogic?
  var worker: KDSettingsWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func fetchSettingsdata(request: KDSettings.Something.Request)
  {
    worker = KDSettingsWorker()
     self.settingsObj =  worker?.doSomeWork()
    
    let response = KDSettings.Something.Response(settings: settingsObj!)
    presenter?.presentSomething(response: response)
  }
}
