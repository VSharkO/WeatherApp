// MARK: - Mocks generated from file: WeatherApp/Repository/RepositoryProtocol.swift at 2018-12-19 13:35:13 +0000

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
    

	struct __StubbingProxy_RepositoryProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getWeather<M1: Cuckoo.Matchable>(endpoint: M1) -> Cuckoo.ProtocolStubFunction<(Endpoint), Observable<Response>> where M1.MatchedType == Endpoint {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint)>] = [wrap(matchable: endpoint) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoryProtocol.self, method: "getWeather(endpoint: Endpoint) -> Observable<Response>", parameterMatchers: matchers))
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
	    
	}

}

 class RepositoryProtocolStub: RepositoryProtocol {
    

    

    
     func getWeather(endpoint: Endpoint)  -> Observable<Response> {
        return DefaultValueRegistry.defaultValue(for: Observable<Response>.self)
    }
    
}

