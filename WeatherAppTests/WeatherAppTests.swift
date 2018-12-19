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

class MainScreenTests: QuickSpec {
    
    override func spec() {
        let testBundle = Bundle.init(for: MainScreenTests.self)
        let supplyListUrl = testBundle.url(forResource: "main_screen_response", withExtension: "json")!
        let supplyListData = try! Data(contentsOf: supplyListUrl)
        let supplyListResponse: Response? =
        {
            do{
                let responce = try JSONDecoder().decode(Response.self, from: supplyListData)
                return responce
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
                    mainViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("is not nil"){
                    expect(mainViewModel).toNot(be(nil))
                }
                it("data count is 0"){
                    expect(mainViewModel.data).to(beNil())
                }
            }
            context("Called data from repo first time"){
                var mockRepository = MockRepositoryProtocol()
                beforeEach {
                    mockRepository = MockRepositoryProtocol()
                    stub(mockRepository) { mock in
                        when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyListResponse!)))
                    }
                    let testScheduler = TestScheduler(initialClock: 0)
                    mainViewModel = MainViewModel(repository: mockRepository, scheduler: testScheduler)
                    mainViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("requst is sent"){
                    mainViewModel.initialDataRequest()
                    verify(mockRepository).getWeather(endpoint: any())
                }
                it("response is correct"){
                    mainViewModel.initialDataRequest()
                    expect(mainViewModel.data.currently.time).to(equal(supplyListResponse?.currently.time))
                    expect(mainViewModel.data.currently.temperature).to(equal(supplyListResponse?.currently.temperature))
                    expect(mainViewModel.data.currently.humidity).to(equal(supplyListResponse?.currently.humidity))
                }
            }
        }
    }
}
