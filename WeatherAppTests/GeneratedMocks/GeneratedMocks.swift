// MARK: - Mocks generated from file: WeatherApp/MainScreen/Utils/MainViewModelDelegate.swift at 2019-01-06 23:33:45 +0000

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
    

    

    
    // ["name": "receaveData", "returnSignature": "", "fullyQualifiedName": "receaveData(weather: WeatherResponse, city: City)", "parameterSignature": "weather: WeatherResponse, city: City", "parameterSignatureWithoutNames": "weather: WeatherResponse, city: City", "inputTypes": "WeatherResponse, City", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "weather, city", "call": "weather: weather, city: city", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("weather"), name: "weather", type: "WeatherResponse", range: CountableRange(238..<262), nameRange: CountableRange(238..<245)), CuckooGeneratorFramework.MethodParameter(label: Optional("city"), name: "city", type: "City", range: CountableRange(264..<274), nameRange: CountableRange(264..<268))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "weather, city", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func receaveData(weather: WeatherResponse, city: City)  {
        
            return cuckoo_manager.call("receaveData(weather: WeatherResponse, city: City)",
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
	    
	    
	    func receaveData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(weather: M1, city: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(WeatherResponse, City)> where M1.MatchedType == WeatherResponse, M2.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(WeatherResponse, City)>] = [wrap(matchable: weather) { $0.0 }, wrap(matchable: city) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMainViewModelDelegate.self, method: "receaveData(weather: WeatherResponse, city: City)", parameterMatchers: matchers))
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
	    func receaveData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(weather: M1, city: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == WeatherResponse, M2.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(WeatherResponse, City)>] = [wrap(matchable: weather) { $0.0 }, wrap(matchable: city) { $0.1 }]
	        return cuckoo_manager.verify("receaveData(weather: WeatherResponse, city: City)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MainViewModelDelegateStub: MainViewModelDelegate {
    
     var units: UnitsType {
        get {
            return DefaultValueRegistry.defaultValue(for: (UnitsType).self)
        }
        
    }
    

    

    
     func receaveData(weather: WeatherResponse, city: City)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/Repository/RepositoryProtocol.swift at 2019-01-06 23:33:45 +0000

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

    

    

    
    // ["name": "getWeather", "returnSignature": " -> Observable<WeatherResponse>", "fullyQualifiedName": "getWeather(endpoint: Endpoint) -> Observable<WeatherResponse>", "parameterSignature": "endpoint: Endpoint", "parameterSignatureWithoutNames": "endpoint: Endpoint", "inputTypes": "Endpoint", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "endpoint", "call": "endpoint: endpoint", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("endpoint"), name: "endpoint", type: "Endpoint", range: CountableRange(241..<259), nameRange: CountableRange(241..<249))], "returnType": "Observable<WeatherResponse>", "isOptional": false, "escapingParameterNames": "endpoint", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getWeather(endpoint: Endpoint)  -> Observable<WeatherResponse> {
        
            return cuckoo_manager.call("getWeather(endpoint: Endpoint) -> Observable<WeatherResponse>",
                parameters: (endpoint),
                escapingParameters: (endpoint),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getWeather(endpoint: endpoint))
        
    }
    
    // ["name": "getCities", "returnSignature": " -> Observable<Cities>", "fullyQualifiedName": "getCities(endpoint: Endpoint) -> Observable<Cities>", "parameterSignature": "endpoint: Endpoint", "parameterSignatureWithoutNames": "endpoint: Endpoint", "inputTypes": "Endpoint", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "endpoint", "call": "endpoint: endpoint", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("endpoint"), name: "endpoint", type: "Endpoint", range: CountableRange(311..<329), nameRange: CountableRange(311..<319))], "returnType": "Observable<Cities>", "isOptional": false, "escapingParameterNames": "endpoint", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getCities(endpoint: Endpoint)  -> Observable<Cities> {
        
            return cuckoo_manager.call("getCities(endpoint: Endpoint) -> Observable<Cities>",
                parameters: (endpoint),
                escapingParameters: (endpoint),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getCities(endpoint: endpoint))
        
    }
    
    // ["name": "saveCityToDb", "returnSignature": "", "fullyQualifiedName": "saveCityToDb(geoname: City)", "parameterSignature": "geoname: City", "parameterSignatureWithoutNames": "geoname: City", "inputTypes": "City", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "geoname", "call": "geoname: geoname", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("geoname"), name: "geoname", type: "City", range: CountableRange(375..<388), nameRange: CountableRange(375..<382))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "geoname", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func saveCityToDb(geoname: City)  {
        
            return cuckoo_manager.call("saveCityToDb(geoname: City)",
                parameters: (geoname),
                escapingParameters: (geoname),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.saveCityToDb(geoname: geoname))
        
    }
    
    // ["name": "getCityFromDb", "returnSignature": " -> Observable<[City]>", "fullyQualifiedName": "getCityFromDb() -> Observable<[City]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[City]>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getCityFromDb()  -> Observable<[City]> {
        
            return cuckoo_manager.call("getCityFromDb() -> Observable<[City]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getCityFromDb())
        
    }
    
    // ["name": "deleteCityFromDb", "returnSignature": "", "fullyQualifiedName": "deleteCityFromDb(geoname: City)", "parameterSignature": "geoname: City", "parameterSignatureWithoutNames": "geoname: City", "inputTypes": "City", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "geoname", "call": "geoname: geoname", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("geoname"), name: "geoname", type: "City", range: CountableRange(463..<476), nameRange: CountableRange(463..<470))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "geoname", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func deleteCityFromDb(geoname: City)  {
        
            return cuckoo_manager.call("deleteCityFromDb(geoname: City)",
                parameters: (geoname),
                escapingParameters: (geoname),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.deleteCityFromDb(geoname: geoname))
        
    }
    

	struct __StubbingProxy_RepositoryProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getWeather<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.ProtocolStubFunction<(Endpoint), Observable<WeatherResponse>> where M1.MatchedType == Endpoint {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint)>] = [wrap(matchable: endpoint) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoryProtocol.self, method: "getWeather(endpoint: Endpoint) -> Observable<WeatherResponse>", parameterMatchers: matchers))
	    }
	    
	    func getCities<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.ProtocolStubFunction<(Endpoint), Observable<Cities>> where M1.MatchedType == Endpoint {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint)>] = [wrap(matchable: endpoint) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoryProtocol.self, method: "getCities(endpoint: Endpoint) -> Observable<Cities>", parameterMatchers: matchers))
	    }
	    
	    func saveCityToDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(City)> where M1.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(City)>] = [wrap(matchable: geoname) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoryProtocol.self, method: "saveCityToDb(geoname: City)", parameterMatchers: matchers))
	    }
	    
	    func getCityFromDb() -> Cuckoo.ProtocolStubFunction<(), Observable<[City]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoryProtocol.self, method: "getCityFromDb() -> Observable<[City]>", parameterMatchers: matchers))
	    }
	    
	    func deleteCityFromDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(City)> where M1.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(City)>] = [wrap(matchable: geoname) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoryProtocol.self, method: "deleteCityFromDb(geoname: City)", parameterMatchers: matchers))
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
	    func getWeather<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.__DoNotUse<Observable<WeatherResponse>> where M1.MatchedType == Endpoint {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint)>] = [wrap(matchable: endpoint) { $0 }]
	        return cuckoo_manager.verify("getWeather(endpoint: Endpoint) -> Observable<WeatherResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCities<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.__DoNotUse<Observable<Cities>> where M1.MatchedType == Endpoint {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint)>] = [wrap(matchable: endpoint) { $0 }]
	        return cuckoo_manager.verify("getCities(endpoint: Endpoint) -> Observable<Cities>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func saveCityToDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(City)>] = [wrap(matchable: geoname) { $0 }]
	        return cuckoo_manager.verify("saveCityToDb(geoname: City)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCityFromDb() -> Cuckoo.__DoNotUse<Observable<[City]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getCityFromDb() -> Observable<[City]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func deleteCityFromDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(City)>] = [wrap(matchable: geoname) { $0 }]
	        return cuckoo_manager.verify("deleteCityFromDb(geoname: City)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class RepositoryProtocolStub: RepositoryProtocol {
    

    

    
     func getWeather(endpoint: Endpoint)  -> Observable<WeatherResponse> {
        return DefaultValueRegistry.defaultValue(for: Observable<WeatherResponse>.self)
    }
    
     func getCities(endpoint: Endpoint)  -> Observable<Cities> {
        return DefaultValueRegistry.defaultValue(for: Observable<Cities>.self)
    }
    
     func saveCityToDb(geoname: City)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func getCityFromDb()  -> Observable<[City]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[City]>.self)
    }
    
     func deleteCityFromDb(geoname: City)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/SettingsScreen/Utils/SettingsDataDelegate.swift at 2019-01-06 23:33:45 +0000

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
    
    
     var city: City! {
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
    
    
     var citiesFromDb: [City]! {
        get {
            return cuckoo_manager.getter("citiesFromDb",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.citiesFromDb)
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
    

    

    
    // ["name": "setNewSettings", "returnSignature": "", "fullyQualifiedName": "setNewSettings(settingsDataModel: SettingsDataModel)", "parameterSignature": "settingsDataModel: SettingsDataModel", "parameterSignatureWithoutNames": "settingsDataModel: SettingsDataModel", "inputTypes": "SettingsDataModel", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "settingsDataModel", "call": "settingsDataModel: settingsDataModel", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("settingsDataModel"), name: "settingsDataModel", type: "SettingsDataModel", range: CountableRange(376..<412), nameRange: CountableRange(376..<393))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "settingsDataModel", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func setNewSettings(settingsDataModel: SettingsDataModel)  {
        
            return cuckoo_manager.call("setNewSettings(settingsDataModel: SettingsDataModel)",
                parameters: (settingsDataModel),
                escapingParameters: (settingsDataModel),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.setNewSettings(settingsDataModel: settingsDataModel))
        
    }
    
    // ["name": "deleteCityFromDb", "returnSignature": "", "fullyQualifiedName": "deleteCityFromDb(index: Int)", "parameterSignature": "index: Int", "parameterSignatureWithoutNames": "index: Int", "inputTypes": "Int", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "index", "call": "index: index", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("index"), name: "index", type: "Int", range: CountableRange(440..<450), nameRange: CountableRange(440..<445))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "index", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func deleteCityFromDb(index: Int)  {
        
            return cuckoo_manager.call("deleteCityFromDb(index: Int)",
                parameters: (index),
                escapingParameters: (index),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.deleteCityFromDb(index: index))
        
    }
    
    // ["name": "receaveData", "returnSignature": "", "fullyQualifiedName": "receaveData(weather: WeatherResponse, city: City)", "parameterSignature": "weather: WeatherResponse, city: City", "parameterSignatureWithoutNames": "weather: WeatherResponse, city: City", "inputTypes": "WeatherResponse, City", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "weather, city", "call": "weather: weather, city: city", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("weather"), name: "weather", type: "WeatherResponse", range: CountableRange(238..<262), nameRange: CountableRange(238..<245)), CuckooGeneratorFramework.MethodParameter(label: Optional("city"), name: "city", type: "City", range: CountableRange(264..<274), nameRange: CountableRange(264..<268))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "weather, city", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func receaveData(weather: WeatherResponse, city: City)  {
        
            return cuckoo_manager.call("receaveData(weather: WeatherResponse, city: City)",
                parameters: (weather, city),
                escapingParameters: (weather, city),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.receaveData(weather: weather, city: city))
        
    }
    

	struct __StubbingProxy_SettingsDataDelegate: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var settings: Cuckoo.ProtocolToBeStubbedProperty<MockSettingsDataDelegate, WeatherParametersToShow> {
	        return .init(manager: cuckoo_manager, name: "settings")
	    }
	    
	    var city: Cuckoo.ProtocolToBeStubbedProperty<MockSettingsDataDelegate, City?> {
	        return .init(manager: cuckoo_manager, name: "city")
	    }
	    
	    var citiesFromDb: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSettingsDataDelegate, [City]?> {
	        return .init(manager: cuckoo_manager, name: "citiesFromDb")
	    }
	    
	    var units: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSettingsDataDelegate, UnitsType> {
	        return .init(manager: cuckoo_manager, name: "units")
	    }
	    
	    
	    func setNewSettings<M1: Cuckoo.Matchable>(settingsDataModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(SettingsDataModel)> where M1.MatchedType == SettingsDataModel {
	        let matchers: [Cuckoo.ParameterMatcher<(SettingsDataModel)>] = [wrap(matchable: settingsDataModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSettingsDataDelegate.self, method: "setNewSettings(settingsDataModel: SettingsDataModel)", parameterMatchers: matchers))
	    }
	    
	    func deleteCityFromDb<M1: Cuckoo.Matchable>(index: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: index) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSettingsDataDelegate.self, method: "deleteCityFromDb(index: Int)", parameterMatchers: matchers))
	    }
	    
	    func receaveData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(weather: M1, city: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(WeatherResponse, City)> where M1.MatchedType == WeatherResponse, M2.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(WeatherResponse, City)>] = [wrap(matchable: weather) { $0.0 }, wrap(matchable: city) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSettingsDataDelegate.self, method: "receaveData(weather: WeatherResponse, city: City)", parameterMatchers: matchers))
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
	    
	    var city: Cuckoo.VerifyProperty<City?> {
	        return .init(manager: cuckoo_manager, name: "city", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var citiesFromDb: Cuckoo.VerifyReadOnlyProperty<[City]?> {
	        return .init(manager: cuckoo_manager, name: "citiesFromDb", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var units: Cuckoo.VerifyReadOnlyProperty<UnitsType> {
	        return .init(manager: cuckoo_manager, name: "units", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func setNewSettings<M1: Cuckoo.Matchable>(settingsDataModel: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == SettingsDataModel {
	        let matchers: [Cuckoo.ParameterMatcher<(SettingsDataModel)>] = [wrap(matchable: settingsDataModel) { $0 }]
	        return cuckoo_manager.verify("setNewSettings(settingsDataModel: SettingsDataModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func deleteCityFromDb<M1: Cuckoo.Matchable>(index: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: index) { $0 }]
	        return cuckoo_manager.verify("deleteCityFromDb(index: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func receaveData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(weather: M1, city: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == WeatherResponse, M2.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(WeatherResponse, City)>] = [wrap(matchable: weather) { $0.0 }, wrap(matchable: city) { $0.1 }]
	        return cuckoo_manager.verify("receaveData(weather: WeatherResponse, city: City)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
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
    
     var city: City! {
        get {
            return DefaultValueRegistry.defaultValue(for: (City!).self)
        }
        
        set { }
        
    }
    
     var citiesFromDb: [City]! {
        get {
            return DefaultValueRegistry.defaultValue(for: ([City]!).self)
        }
        
    }
    
     var units: UnitsType {
        get {
            return DefaultValueRegistry.defaultValue(for: (UnitsType).self)
        }
        
    }
    

    

    
     func setNewSettings(settingsDataModel: SettingsDataModel)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func deleteCityFromDb(index: Int)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func receaveData(weather: WeatherResponse, city: City)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

