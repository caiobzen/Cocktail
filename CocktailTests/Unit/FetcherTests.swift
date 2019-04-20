import Quick
import Nimble

@testable import Cocktail

//API: https://www.thecocktaildb.com/api.php

class FetcherTests: QuickSpec {
    override func spec() {
        describe(".Fetcher") {
            context("#init") {
                it("has an instance of URLSession") {
                    let fetcher = Fetcher()
                    expect(fetcher.urlSession).toNot(beNil())
                }
            }
            
            context("#fetch") {
                var fetcher: FetcherMock!
                
                beforeEach {
                    fetcher = FetcherMock()
                    fetcher.reset()
                }
                
                it("calls the correct endpoint with expected parameters") {
                    let endpoint = Endpoint(path: "/endpoint", param: "foo")
                    
                    fetcher.fetch(endpoint) { _ in }
                    
                    expect(fetcher.lastEndpoint?.path).toEventually(equal("/endpoint"))
                    expect(fetcher.lastEndpoint?.param).toEventually(equal("foo"))
                }
                
                context("with success") {
                    it("returns an object that conforms to Codable") {
                        let endpoint = Endpoint(path: "someEndpoint", param: "someParam")
                        var responseObject: Codable?
                        
                        fetcher.fetch(endpoint) { response in
                            switch response {
                            case .success(let res):
                                responseObject = res
                            default:
                                fail()
                            }
                        }
                        
                        expect(responseObject).toEventuallyNot(beNil())
                        expect(responseObject).to(beAKindOf(Codable.self))
                    }
                }
                
                context("with failure") {
                    it("returns an error") {
                        fetcher.shouldFail = true
                        let endpoint = Endpoint(path: "someEndpoint", param: "?=someParam")
                        var error: Error?
                        
                        fetcher.fetch(endpoint) { response in
                            switch response {
                            case .success(_):
                                fail()
                            case .failure(let err):
                                error = err
                            }
                        }
                         expect(endpoint.url.absoluteString).to(equal("https://www.thecocktaildb.com/api/json/v1/1/someEndpoint?=someParam"))
                        expect(error).toEventuallyNot(beNil())
                        expect(error).to(beAKindOf(Error.self))
                    }
                }
            }
        }
    }
}
