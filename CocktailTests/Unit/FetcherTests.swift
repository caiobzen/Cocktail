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
                            responseObject = response
                        }
                        
                        expect(responseObject).toEventuallyNot(beNil())
                        expect(responseObject).to(beAKindOf(Codable.self))
                    }
                }
                
                context("with failure") {
                    it("returns an error") {
                        fetcher.shouldFail = true
                        let endpoint = Endpoint(path: "someEndpoint", param: "someParam")
                        var responseObject: Codable?
                        
                        fetcher.fetch(endpoint) { response in
                            responseObject = try! JSONDecoder().decode(ResponseError.self, from: response)
                        }
                        
                        expect(responseObject).toEventuallyNot(beNil())
                        expect(responseObject).to(beAKindOf(ResponseError.self))
                    }
                }
            }
        }
    }
}
