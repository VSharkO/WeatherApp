//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Valentin Šarić on 18/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Cuckoo
import Quick
import RxTest
import RxSwift
import Nimble
@testable import WeatherApp

class MainViewModelTests: QuickSpec {
    
    override func spec() {
        let testBundle = Bundle.init(for: MainViewModelTests.self)
        let supplyListUrl = testBundle.url(forResource: "main_screen_response", withExtension: "json")!
        let supplyListData = try! Data(contentsOf: supplyListUrl)
        let supplyListResponse: WeatherResponse? =
        {
            do{
                let response = try JSONDecoder().decode(WeatherResponse.self, from: supplyListData)
                return response
            }catch{
                return nil
            }

        }()

        var mainViewModel: MainViewModel!
        let disposeBag = DisposeBag()
        afterSuite {
            mainViewModel = nil
        }
        describe("MainViewModel initialization"){
            context("Initionalized correctly"){
                beforeEach {
                    let mockRepository = MockRepositoryProtocol()
                    stub(mockRepository) { mock in
                        when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyListResponse!)))
                    }
                    let testScheduler = TestScheduler(initialClock: 0)
                    mainViewModel = MainViewModel(repository: mockRepository, scheduler: testScheduler)
                    mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("is not nil"){
                    expect(mainViewModel).toNot(be(nil))
                }
                it("data is nil"){
                    expect(mainViewModel.data).to(beNil())
                }
            }
            context("Called data from api"){
                var testScheduler = TestScheduler(initialClock: 0)
                var subscriber = testScheduler.createObserver((icon: String, gradientInfo: Condition?).self)
                var mockRepository = MockRepositoryProtocol()
                beforeEach {
                    mockRepository = MockRepositoryProtocol()
                    stub(mockRepository) { mock in
                        when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyListResponse!)))
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    subscriber = testScheduler.createObserver((icon: String, gradientInfo: Condition?).self)
                    mainViewModel = MainViewModel(repository: mockRepository, scheduler: testScheduler)
                    mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
                    mainViewModel.viewSetBackgroundImages.subscribe(subscriber).disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("requst is sent"){
                    mainViewModel.initialDataRequest()
                    verify(mockRepository).getWeather(endpoint: any())
                }
                it("response is received with correct parameters"){
                    mainViewModel.initialDataRequest()
                    expect(mainViewModel.data.currently.time).to(equal(supplyListResponse?.currently.time))
                    expect(mainViewModel.data.currently.temperature).to(equal(supplyListResponse?.currently.temperature))
                    expect(mainViewModel.data.currently.humidity).to(equal(supplyListResponse?.currently.humidity))
                }
                it("daily variable time is in same day as currently variable time"){
                    mainViewModel.initialDataRequest()
                    expect(TimeDiferenceHelper.isTimeDiferenceInADay(fromSeconds: mainViewModel.data.daily.time, toSeconds: mainViewModel.data.currently.time)).to(beTrue())
                }
                it("is seting view background images trigered with correct parameter"){
                        mainViewModel.initialDataRequest()
                    let conditions = WeatherConditionsHelper.returnConditionThatStringContains(for: (supplyListResponse?.currently.icon)!)
                    expect(subscriber.events.first!.value.element!.icon).to(equal(supplyListResponse?.currently.icon))
                    expect(subscriber.events.first!.value.element!.gradientInfo).to(equal(conditions))
                }
                
            }
            
            describe("Loader logic"){
                context("when sending request"){
                    var testScheduler = TestScheduler(initialClock: 0)
                    var subscriber = testScheduler.createObserver(Bool.self)
                    beforeEach {
                        let mockRepository = MockRepositoryProtocol()
                        stub(mockRepository) { mock in
                            when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyListResponse!)))
                        }
                        testScheduler = TestScheduler(initialClock: 0)
                        subscriber = testScheduler.createObserver(Bool.self)
                        mainViewModel = MainViewModel(repository: mockRepository, scheduler: testScheduler)
                        mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
                        mainViewModel.viewShowLoader.subscribe(subscriber).disposed(by: disposeBag)
                        testScheduler.start()
                        mainViewModel.initialDataRequest()
                    }
                    it("loader is shown on start of request"){
                        expect(subscriber.events.first!.value.element).to(equal(true))
                    }
                    it("loader is hiden after receiving data"){
                        expect(subscriber.events.last!.value.element).to(be(false))
                    }
                }
            }
        }
    }
}
