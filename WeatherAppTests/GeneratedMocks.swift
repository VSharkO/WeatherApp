// MARK: - Mocks generated from file: WeatherApp/Db/DbHelperProtocol.swift at 2019-01-03 07:30:38 +0000

//
//  DbHelperProtocol.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
import Cuckoo
@testable import WeatherApp

import Foundation
import RxSwift

class MockDbHelperProtocol: DbHelperProtocol, Cuckoo.ProtocolMock {
    typealias MocksType = DbHelperProtocol
    typealias Stubbing = __StubbingProxy_DbHelperProtocol
    typealias Verification = __VerificationProxy_DbHelperProtocol

    private var __defaultImplStub: DbHelperProtocol?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: DbHelperProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "saveGeonameToDb", "returnSignature": "", "fullyQualifiedName": "saveGeonameToDb(geoname: Geoname)", "parameterSignature": "geoname: Geoname", "parameterSignatureWithoutNames": "geoname: Geoname", "inputTypes": "Geoname", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "geoname", "call": "geoname: geoname", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("geoname"), name: "geoname", type: "Geoname", range: CountableRange(247..<263), nameRange: CountableRange(247..<254))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "geoname", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func saveGeonameToDb(geoname: Geoname)  {
        
            return cuckoo_manager.call("saveGeonameToDb(geoname: Geoname)",
                parameters: (geoname),
                escapingParameters: (geoname),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.saveGeonameToDb(geoname: geoname))
        
    }
    
    // ["name": "getGeonamesFromDb", "returnSignature": " -> Observable<[Geoname]>", "fullyQualifiedName": "getGeonamesFromDb() -> Observable<[Geoname]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[Geoname]>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getGeonamesFromDb()  -> Observable<[Geoname]> {
        
            return cuckoo_manager.call("getGeonamesFromDb() -> Observable<[Geoname]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getGeonamesFromDb())
        
    }
    
    // ["name": "deleteGeonameFromDb", "returnSignature": "", "fullyQualifiedName": "deleteGeonameFromDb(geoname: Geoname)", "parameterSignature": "geoname: Geoname", "parameterSignatureWithoutNames": "geoname: Geoname", "inputTypes": "Geoname", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "geoname", "call": "geoname: geoname", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("geoname"), name: "geoname", type: "Geoname", range: CountableRange(348..<364), nameRange: CountableRange(348..<355))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "geoname", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func deleteGeonameFromDb(geoname: Geoname)  {
        
            return cuckoo_manager.call("deleteGeonameFromDb(geoname: Geoname)",
                parameters: (geoname),
                escapingParameters: (geoname),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.deleteGeonameFromDb(geoname: geoname))
        
    }
    

	struct __StubbingProxy_DbHelperProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func saveGeonameToDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Geoname)> where M1.MatchedType == Geoname {
	        let matchers: [Cuckoo.ParameterMatcher<(Geoname)>] = [wrap(matchable: geoname) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockDbHelperProtocol.self, method: "saveGeonameToDb(geoname: Geoname)", parameterMatchers: matchers))
	    }
	    
	    func getGeonamesFromDb() -> Cuckoo.ProtocolStubFunction<(), Observable<[Geoname]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockDbHelperProtocol.self, method: "getGeonamesFromDb() -> Observable<[Geoname]>", parameterMatchers: matchers))
	    }
	    
	    func deleteGeonameFromDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Geoname)> where M1.MatchedType == Geoname {
	        let matchers: [Cuckoo.ParameterMatcher<(Geoname)>] = [wrap(matchable: geoname) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockDbHelperProtocol.self, method: "deleteGeonameFromDb(geoname: Geoname)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_DbHelperProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func saveGeonameToDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Geoname {
	        let matchers: [Cuckoo.ParameterMatcher<(Geoname)>] = [wrap(matchable: geoname) { $0 }]
	        return cuckoo_manager.verify("saveGeonameToDb(geoname: Geoname)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getGeonamesFromDb() -> Cuckoo.__DoNotUse<Observable<[Geoname]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getGeonamesFromDb() -> Observable<[Geoname]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func deleteGeonameFromDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Geoname {
	        let matchers: [Cuckoo.ParameterMatcher<(Geoname)>] = [wrap(matchable: geoname) { $0 }]
	        return cuckoo_manager.verify("deleteGeonameFromDb(geoname: Geoname)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class DbHelperProtocolStub: DbHelperProtocol {
    

    

    
     func saveGeonameToDb(geoname: Geoname)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func getGeonamesFromDb()  -> Observable<[Geoname]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Geoname]>.self)
    }
    
     func deleteGeonameFromDb(geoname: Geoname)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/MainScreen/Utils/MainViewModelDelegate.swift at 2019-01-03 07:30:38 +0000

//
//  MainViewModelDelegate.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
import Cuckoo
@testable import WeatherApp

import Foundation

class MockMainViewModelDelegate: MainViewModelDelegate, Cuckoo.ProtocolMock {
    typealias MocksType = MainViewModelDelegate
    typealias Stubbing = __StubbingProxy_MainViewModelDelegate
    typealias Verification = __VerificationProxy_MainViewModelDelegate

    private var __defaultImplStub: MainViewModelDelegate?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: MainViewModelDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    
    
     var units: UnitsType {
        get {
            return cuckoo_manager.getter("units",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.units)
        }
        
    }
    

    

    
    // ["name": "receaveData", "returnSignature": "", "fullyQualifiedName": "receaveData(weather: Response, city: Geoname)", "parameterSignature": "weather: Response, city: Geoname", "parameterSignatureWithoutNames": "weather: Response, city: Geoname", "inputTypes": "Response, Geoname", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "weather, city", "call": "weather: weather, city: city", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("weather"), name: "weather", type: "Response", range: CountableRange(238..<255), nameRange: CountableRange(238..<245)), CuckooGeneratorFramework.MethodParameter(label: Optional("city"), name: "city", type: "Geoname", range: CountableRange(257..<270), nameRange: CountableRange(257..<261))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "weather, city", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func receaveData(weather: Response, city: Geoname)  {
        
            return cuckoo_manager.call("receaveData(weather: Response, city: Geoname)",
                parameters: (weather, city),
                escapingParameters: (weather, city),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.receaveData(weather: weather, city: city))
        
    }
    

	struct __StubbingProxy_MainViewModelDelegate: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var units: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockMainViewModelDelegate, UnitsType> {
	        return .init(manager: cuckoo_manager, name: "units")
	    }
	    
	    
	    func receaveData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(weather: M1, city: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Response, Geoname)> where M1.MatchedType == Response, M2.MatchedType == Geoname {
	        let matchers: [Cuckoo.ParameterMatcher<(Response, Geoname)>] = [wrap(matchable: weather) { $0.0 }, wrap(matchable: city) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMainViewModelDelegate.self, method: "receaveData(weather: Response, city: Geoname)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_MainViewModelDelegate: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var units: Cuckoo.VerifyReadOnlyProperty<UnitsType> {
	        return .init(manager: cuckoo_manager, name: "units", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func receaveData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(weather: M1, city: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Response, M2.MatchedType == Geoname {
	        let matchers: [Cuckoo.ParameterMatcher<(Response, Geoname)>] = [wrap(matchable: weather) { $0.0 }, wrap(matchable: city) { $0.1 }]
	        return cuckoo_manager.verify("receaveData(weather: Response, city: Geoname)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MainViewModelDelegateStub: MainViewModelDelegate {
    
     var units: UnitsType {
        get {
            return DefaultValueRegistry.defaultValue(for: (UnitsType).self)
        }
        
    }
    

    

    
     func receaveData(weather: Response, city: Geoname)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/Repository/RepositoryProtocol.swift at 2019-01-03 07:30:38 +0000

//
//  RepositoryProtocol.swift
//  AvazBa
//
//  Created by Valentin Šarić on 16/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
import Cuckoo
@testable import WeatherApp

import Foundation
import RxSwift

class MockRepositoryProtocol: RepositoryProtocol, Cuckoo.ProtocolMock {
    typealias MocksType = RepositoryProtocol
    typealias Stubbing = __StubbingProxy_RepositoryProtocol
    typealias Verification = __VerificationProxy_RepositoryProtocol

    private var __defaultImplStub: RepositoryProtocol?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: RepositoryProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "getWeather", "returnSignature": " -> Observable<Response>", "fullyQualifiedName": "getWeather(endpoint: Endpoint) -> Observable<Response>", "parameterSignature": "endpoint: Endpoint", "parameterSignatureWithoutNames": "endpoint: Endpoint", "inputTypes": "Endpoint", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "endpoint", "call": "endpoint: endpoint", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("endpoint"), name: "endpoint", type: "Endpoint", range: CountableRange(241..<259), nameRange: CountableRange(241..<249))], "returnType": "Observable<Response>", "isOptional": false, "escapingParameterNames": "endpoint", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getWeather(endpoint: Endpoint)  -> Observable<Response> {
        
            return cuckoo_manager.call("getWeather(endpoint: Endpoint) -> Observable<Response>",
                parameters: (endpoint),
                escapingParameters: (endpoint),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getWeather(endpoint: endpoint))
        
    }
    
    // ["name": "getCities", "returnSignature": " -> Observable<Cities>", "fullyQualifiedName": "getCities(endpoint: Endpoint) -> Observable<Cities>", "parameterSignature": "endpoint: Endpoint", "parameterSignatureWithoutNames": "endpoint: Endpoint", "inputTypes": "Endpoint", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "endpoint", "call": "endpoint: endpoint", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("endpoint"), name: "endpoint", type: "Endpoint", range: CountableRange(304..<322), nameRange: CountableRange(304..<312))], "returnType": "Observable<Cities>", "isOptional": false, "escapingParameterNames": "endpoint", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getCities(endpoint: Endpoint)  -> Observable<Cities> {
        
            return cuckoo_manager.call("getCities(endpoint: Endpoint) -> Observable<Cities>",
                parameters: (endpoint),
                escapingParameters: (endpoint),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getCities(endpoint: endpoint))
        
    }
    

	struct __StubbingProxy_RepositoryProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getWeather<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.ProtocolStubFunction<(Endpoint), Observable<Response>> where M1.MatchedType == Endpoint {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint)>] = [wrap(matchable: endpoint) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoryProtocol.self, method: "getWeather(endpoint: Endpoint) -> Observable<Response>", parameterMatchers: matchers))
	    }
	    
	    func getCities<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.ProtocolStubFunction<(Endpoint), Observable<Cities>> where M1.MatchedType == Endpoint {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint)>] = [wrap(matchable: endpoint) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoryProtocol.self, method: "getCities(endpoint: Endpoint) -> Observable<Cities>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_RepositoryProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getWeather<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.__DoNotUse<Observable<Response>> where M1.MatchedType == Endpoint {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint)>] = [wrap(matchable: endpoint) { $0 }]
	        return cuckoo_manager.verify("getWeather(endpoint: Endpoint) -> Observable<Response>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCities<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.__DoNotUse<Observable<Cities>> where M1.MatchedType == Endpoint {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint)>] = [wrap(matchable: endpoint) { $0 }]
	        return cuckoo_manager.verify("getCities(endpoint: Endpoint) -> Observable<Cities>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class RepositoryProtocolStub: RepositoryProtocol {
    

    

    
     func getWeather(endpoint: Endpoint)  -> Observable<Response> {
        return DefaultValueRegistry.defaultValue(for: Observable<Response>.self)
    }
    
     func getCities(endpoint: Endpoint)  -> Observable<Cities> {
        return DefaultValueRegistry.defaultValue(for: Observable<Cities>.self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/SettingsScreen/Utils/SettingsDataDelegate.swift at 2019-01-03 07:30:38 +0000

//
//  SettingsDataDelegate.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
import Cuckoo
@testable import WeatherApp

import Foundation

class MockSettingsDataDelegate: SettingsDataDelegate, Cuckoo.ProtocolMock {
    typealias MocksType = SettingsDataDelegate
    typealias Stubbing = __StubbingProxy_SettingsDataDelegate
    typealias Verification = __VerificationProxy_SettingsDataDelegate

    private var __defaultImplStub: SettingsDataDelegate?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: SettingsDataDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    
    
     var settings: WeatherParametersToShow {
        get {
            return cuckoo_manager.getter("settings",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.settings)
        }
        
        set {
            cuckoo_manager.setter("settings",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.settings = newValue)
        }
        
    }
    
    
     var city: Geoname! {
        get {
            return cuckoo_manager.getter("city",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.city)
        }
        
        set {
            cuckoo_manager.setter("city",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.city = newValue)
        }
        
    }
    
    
     var units: UnitsType {
        get {
            return cuckoo_manager.getter("units",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.units)
        }
        
    }
    

    

    
    // ["name": "setNewSettings", "returnSignature": "", "fullyQualifiedName": "setNewSettings(settingsDataModel: SettingsDataModel)", "parameterSignature": "settingsDataModel: SettingsDataModel", "parameterSignatureWithoutNames": "settingsDataModel: SettingsDataModel", "inputTypes": "SettingsDataModel", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "settingsDataModel", "call": "settingsDataModel: settingsDataModel", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("settingsDataModel"), name: "settingsDataModel", type: "SettingsDataModel", range: CountableRange(351..<387), nameRange: CountableRange(351..<368))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "settingsDataModel", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func setNewSettings(settingsDataModel: SettingsDataModel)  {
        
            return cuckoo_manager.call("setNewSettings(settingsDataModel: SettingsDataModel)",
                parameters: (settingsDataModel),
                escapingParameters: (settingsDataModel),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.setNewSettings(settingsDataModel: settingsDataModel))
        
    }
    

	struct __StubbingProxy_SettingsDataDelegate: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var settings: Cuckoo.ProtocolToBeStubbedProperty<MockSettingsDataDelegate, WeatherParametersToShow> {
	        return .init(manager: cuckoo_manager, name: "settings")
	    }
	    
	    var city: Cuckoo.ProtocolToBeStubbedProperty<MockSettingsDataDelegate, Geoname?> {
	        return .init(manager: cuckoo_manager, name: "city")
	    }
	    
	    var units: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSettingsDataDelegate, UnitsType> {
	        return .init(manager: cuckoo_manager, name: "units")
	    }
	    
	    
	    func setNewSettings<M1: Cuckoo.Matchable>(settingsDataModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(SettingsDataModel)> where M1.MatchedType == SettingsDataModel {
	        let matchers: [Cuckoo.ParameterMatcher<(SettingsDataModel)>] = [wrap(matchable: settingsDataModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSettingsDataDelegate.self, method: "setNewSettings(settingsDataModel: SettingsDataModel)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_SettingsDataDelegate: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var settings: Cuckoo.VerifyProperty<WeatherParametersToShow> {
	        return .init(manager: cuckoo_manager, name: "settings", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var city: Cuckoo.VerifyProperty<Geoname?> {
	        return .init(manager: cuckoo_manager, name: "city", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var units: Cuckoo.VerifyReadOnlyProperty<UnitsType> {
	        return .init(manager: cuckoo_manager, name: "units", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func setNewSettings<M1: Cuckoo.Matchable>(settingsDataModel: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == SettingsDataModel {
	        let matchers: [Cuckoo.ParameterMatcher<(SettingsDataModel)>] = [wrap(matchable: settingsDataModel) { $0 }]
	        return cuckoo_manager.verify("setNewSettings(settingsDataModel: SettingsDataModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class SettingsDataDelegateStub: SettingsDataDelegate {
    
     var settings: WeatherParametersToShow {
        get {
            return DefaultValueRegistry.defaultValue(for: (WeatherParametersToShow).self)
        }
        
        set { }
        
    }
    
     var city: Geoname! {
        get {
            return DefaultValueRegistry.defaultValue(for: (Geoname!).self)
        }
        
        set { }
        
    }
    
     var units: UnitsType {
        get {
            return DefaultValueRegistry.defaultValue(for: (UnitsType).self)
        }
        
    }
    

    

    
     func setNewSettings(settingsDataModel: SettingsDataModel)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

