// MARK: - Mocks generated from file: WeatherApp/MainScreen/Utils/MainViewModelDelegate.swift at 2019-01-08 18:57:35 +0000

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


// MARK: - Mocks generated from file: WeatherApp/Repository/CitiesRepository/CitiesRepositoryProtocol.swift at 2019-01-08 18:57:35 +0000

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

class MockCitiesRepositoryProtocol: CitiesRepositoryProtocol, Cuckoo.ProtocolMock {
    typealias MocksType = CitiesRepositoryProtocol
    typealias Stubbing = __StubbingProxy_CitiesRepositoryProtocol
    typealias Verification = __VerificationProxy_CitiesRepositoryProtocol

    private var __defaultImplStub: CitiesRepositoryProtocol?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: CitiesRepositoryProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "getCities", "returnSignature": " -> Observable<Cities>", "fullyQualifiedName": "getCities(startingWith: String) -> Observable<Cities>", "parameterSignature": "startingWith: String", "parameterSignatureWithoutNames": "startingWith: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "startingWith", "call": "startingWith: startingWith", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("startingWith"), name: "startingWith", type: "String", range: CountableRange(246..<266), nameRange: CountableRange(246..<258))], "returnType": "Observable<Cities>", "isOptional": false, "escapingParameterNames": "startingWith", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getCities(startingWith: String)  -> Observable<Cities> {
        
            return cuckoo_manager.call("getCities(startingWith: String) -> Observable<Cities>",
                parameters: (startingWith),
                escapingParameters: (startingWith),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getCities(startingWith: startingWith))
        
    }
    
    // ["name": "saveCityToDb", "returnSignature": "", "fullyQualifiedName": "saveCityToDb(geoname: City)", "parameterSignature": "geoname: City", "parameterSignatureWithoutNames": "geoname: City", "inputTypes": "City", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "geoname", "call": "geoname: geoname", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("geoname"), name: "geoname", type: "City", range: CountableRange(312..<325), nameRange: CountableRange(312..<319))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "geoname", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func saveCityToDb(geoname: City)  {
        
            return cuckoo_manager.call("saveCityToDb(geoname: City)",
                parameters: (geoname),
                escapingParameters: (geoname),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.saveCityToDb(geoname: geoname))
        
    }
    
    // ["name": "getCitiesFromDb", "returnSignature": " -> Observable<[City]>", "fullyQualifiedName": "getCitiesFromDb() -> Observable<[City]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[City]>", "isOptional": false, "escapingParameterNames": "", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getCitiesFromDb()  -> Observable<[City]> {
        
            return cuckoo_manager.call("getCitiesFromDb() -> Observable<[City]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getCitiesFromDb())
        
    }
    
    // ["name": "deleteCityFromDb", "returnSignature": "", "fullyQualifiedName": "deleteCityFromDb(geoname: City)", "parameterSignature": "geoname: City", "parameterSignatureWithoutNames": "geoname: City", "inputTypes": "City", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "geoname", "call": "geoname: geoname", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("geoname"), name: "geoname", type: "City", range: CountableRange(402..<415), nameRange: CountableRange(402..<409))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "geoname", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func deleteCityFromDb(geoname: City)  {
        
            return cuckoo_manager.call("deleteCityFromDb(geoname: City)",
                parameters: (geoname),
                escapingParameters: (geoname),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.deleteCityFromDb(geoname: geoname))
        
    }
    

	struct __StubbingProxy_CitiesRepositoryProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getCities<M1: Cuckoo.Matchable>(startingWith: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<Cities>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: startingWith) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCitiesRepositoryProtocol.self, method: "getCities(startingWith: String) -> Observable<Cities>", parameterMatchers: matchers))
	    }
	    
	    func saveCityToDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(City)> where M1.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(City)>] = [wrap(matchable: geoname) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCitiesRepositoryProtocol.self, method: "saveCityToDb(geoname: City)", parameterMatchers: matchers))
	    }
	    
	    func getCitiesFromDb() -> Cuckoo.ProtocolStubFunction<(), Observable<[City]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCitiesRepositoryProtocol.self, method: "getCitiesFromDb() -> Observable<[City]>", parameterMatchers: matchers))
	    }
	    
	    func deleteCityFromDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(City)> where M1.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(City)>] = [wrap(matchable: geoname) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCitiesRepositoryProtocol.self, method: "deleteCityFromDb(geoname: City)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_CitiesRepositoryProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getCities<M1: Cuckoo.Matchable>(startingWith: M1) -> Cuckoo.__DoNotUse<Observable<Cities>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: startingWith) { $0 }]
	        return cuckoo_manager.verify("getCities(startingWith: String) -> Observable<Cities>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func saveCityToDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(City)>] = [wrap(matchable: geoname) { $0 }]
	        return cuckoo_manager.verify("saveCityToDb(geoname: City)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCitiesFromDb() -> Cuckoo.__DoNotUse<Observable<[City]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getCitiesFromDb() -> Observable<[City]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func deleteCityFromDb<M1: Cuckoo.Matchable>(geoname: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == City {
	        let matchers: [Cuckoo.ParameterMatcher<(City)>] = [wrap(matchable: geoname) { $0 }]
	        return cuckoo_manager.verify("deleteCityFromDb(geoname: City)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class CitiesRepositoryProtocolStub: CitiesRepositoryProtocol {
    

    

    
     func getCities(startingWith: String)  -> Observable<Cities> {
        return DefaultValueRegistry.defaultValue(for: Observable<Cities>.self)
    }
    
     func saveCityToDb(geoname: City)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func getCitiesFromDb()  -> Observable<[City]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[City]>.self)
    }
    
     func deleteCityFromDb(geoname: City)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/Repository/WeatherRepository/WeatherRepositoryProtocol.swift at 2019-01-08 18:57:35 +0000

//
//  WeatherRepositoryProtocol.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 08/01/2019.
//  Copyright © 2019 Valentin Šarić. All rights reserved.
import Cuckoo
@testable import WeatherApp

import Foundation
import RxSwift

class MockWeatherRepositoryProtocol: WeatherRepositoryProtocol, Cuckoo.ProtocolMock {
    typealias MocksType = WeatherRepositoryProtocol
    typealias Stubbing = __StubbingProxy_WeatherRepositoryProtocol
    typealias Verification = __VerificationProxy_WeatherRepositoryProtocol

    private var __defaultImplStub: WeatherRepositoryProtocol?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: WeatherRepositoryProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "getWeather", "returnSignature": " -> Observable<WeatherResponse>", "fullyQualifiedName": "getWeather(coordinates: String, units: UnitsType) -> Observable<WeatherResponse>", "parameterSignature": "coordinates: String, units: UnitsType", "parameterSignatureWithoutNames": "coordinates: String, units: UnitsType", "inputTypes": "String, UnitsType", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "coordinates, units", "call": "coordinates: coordinates, units: units", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("coordinates"), name: "coordinates", type: "String", range: CountableRange(260..<279), nameRange: CountableRange(260..<271)), CuckooGeneratorFramework.MethodParameter(label: Optional("units"), name: "units", type: "UnitsType", range: CountableRange(281..<297), nameRange: CountableRange(281..<286))], "returnType": "Observable<WeatherResponse>", "isOptional": false, "escapingParameterNames": "coordinates, units", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getWeather(coordinates: String, units: UnitsType)  -> Observable<WeatherResponse> {
        
            return cuckoo_manager.call("getWeather(coordinates: String, units: UnitsType) -> Observable<WeatherResponse>",
                parameters: (coordinates, units),
                escapingParameters: (coordinates, units),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getWeather(coordinates: coordinates, units: units))
        
    }
    

	struct __StubbingProxy_WeatherRepositoryProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getWeather<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(coordinates: M1, units: M2) -> Cuckoo.ProtocolStubFunction<(String, UnitsType), Observable<WeatherResponse>> where M1.MatchedType == String, M2.MatchedType == UnitsType {
	        let matchers: [Cuckoo.ParameterMatcher<(String, UnitsType)>] = [wrap(matchable: coordinates) { $0.0 }, wrap(matchable: units) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherRepositoryProtocol.self, method: "getWeather(coordinates: String, units: UnitsType) -> Observable<WeatherResponse>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_WeatherRepositoryProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getWeather<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(coordinates: M1, units: M2) -> Cuckoo.__DoNotUse<Observable<WeatherResponse>> where M1.MatchedType == String, M2.MatchedType == UnitsType {
	        let matchers: [Cuckoo.ParameterMatcher<(String, UnitsType)>] = [wrap(matchable: coordinates) { $0.0 }, wrap(matchable: units) { $0.1 }]
	        return cuckoo_manager.verify("getWeather(coordinates: String, units: UnitsType) -> Observable<WeatherResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class WeatherRepositoryProtocolStub: WeatherRepositoryProtocol {
    

    

    
     func getWeather(coordinates: String, units: UnitsType)  -> Observable<WeatherResponse> {
        return DefaultValueRegistry.defaultValue(for: Observable<WeatherResponse>.self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/SettingsScreen/Utils/SettingsDataDelegate.swift at 2019-01-08 18:57:35 +0000

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
    
    
     var units: UnitsType {
        get {
            return cuckoo_manager.getter("units",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.units)
        }
        
    }
    

    

    
    // ["name": "setNewSettings", "returnSignature": "", "fullyQualifiedName": "setNewSettings(settingsDataModel: SettingsDataModel)", "parameterSignature": "settingsDataModel: SettingsDataModel", "parameterSignatureWithoutNames": "settingsDataModel: SettingsDataModel", "inputTypes": "SettingsDataModel", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "settingsDataModel", "call": "settingsDataModel: settingsDataModel", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("settingsDataModel"), name: "settingsDataModel", type: "SettingsDataModel", range: CountableRange(341..<377), nameRange: CountableRange(341..<358))], "returnType": "Void", "isOptional": false, "escapingParameterNames": "settingsDataModel", "stubFunction": "Cuckoo.ProtocolStubNoReturnFunction"]
     func setNewSettings(settingsDataModel: SettingsDataModel)  {
        
            return cuckoo_manager.call("setNewSettings(settingsDataModel: SettingsDataModel)",
                parameters: (settingsDataModel),
                escapingParameters: (settingsDataModel),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.setNewSettings(settingsDataModel: settingsDataModel))
        
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
	    
	    var units: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSettingsDataDelegate, UnitsType> {
	        return .init(manager: cuckoo_manager, name: "units")
	    }
	    
	    
	    func setNewSettings<M1: Cuckoo.Matchable>(settingsDataModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(SettingsDataModel)> where M1.MatchedType == SettingsDataModel {
	        let matchers: [Cuckoo.ParameterMatcher<(SettingsDataModel)>] = [wrap(matchable: settingsDataModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSettingsDataDelegate.self, method: "setNewSettings(settingsDataModel: SettingsDataModel)", parameterMatchers: matchers))
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
	    
	    var units: Cuckoo.VerifyReadOnlyProperty<UnitsType> {
	        return .init(manager: cuckoo_manager, name: "units", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func setNewSettings<M1: Cuckoo.Matchable>(settingsDataModel: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == SettingsDataModel {
	        let matchers: [Cuckoo.ParameterMatcher<(SettingsDataModel)>] = [wrap(matchable: settingsDataModel) { $0 }]
	        return cuckoo_manager.verify("setNewSettings(settingsDataModel: SettingsDataModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
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
    
     var units: UnitsType {
        get {
            return DefaultValueRegistry.defaultValue(for: (UnitsType).self)
        }
        
    }
    

    

    
     func setNewSettings(settingsDataModel: SettingsDataModel)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func receaveData(weather: WeatherResponse, city: City)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

