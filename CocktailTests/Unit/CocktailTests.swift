import Quick
import Nimble
import OHHTTPStubs

@testable import Cocktail

//API: https://www.thecocktaildb.com/api.php

class CocktailTests: QuickSpec {
    override func spec() {
        describe(".Cocktail") {
            context("#init") {
                it("creates a Cocktail instance") {
                    let cocktail = CocktailAPI()
                    expect(cocktail).toNot(beNil())
                }
                
                it("has a fetching mechanism") {
                    let fetcher = Fetcher()
                    let cocktail = CocktailAPIMock(with: fetcher)
                    expect(cocktail._fetcher).toNot(beNil())
                }
            }
            
            context("#search") {
                beforeEach {
                    OHHTTPStubs.removeAllStubs()
                    
                    stub(condition: isHost("www.thecocktaildb.com")) { _ in
                        let stubPath = OHPathForFile("margherita.json", type(of: self))
                        return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
                    }
                }
                
                context("for a cocktail name with success") {
                    it("returns a list of cocktails") {
                        let fetcher = Fetcher()
                        let cocktail = CocktailAPI(with: fetcher)
                        var cocktailResponse: CocktailResponse? = nil
                        
                        cocktail.searchBy(drinkName: "margherita") { response in
                            switch response {
                            case .success(let res):
                                cocktailResponse = res
                            case .failure(_):
                                fail()
                            }
                        }
                        
                        expect(cocktailResponse?.cocktails.count).toEventually(equal(5))
                    }
                }
                
                context("for a cocktail name with returning a failure") {
                    beforeEach {
                        OHHTTPStubs.removeAllStubs()
                        
                        stub(condition: isHost("www.thecocktaildb.com")) { _ in
                            return OHHTTPStubsResponse(error:MockError())
                        }
                    }
                    
                    it("returns an Error") {
                        let fetcher = Fetcher()
                        let cocktail = CocktailAPI(with: fetcher)
                        var error: Error? = nil
                        
                        cocktail.searchBy(drinkName: "margherita") { response in
                            switch response {
                            case .success(_):
                                fail()
                            case .failure(let err):
                                error = err
                            }
                        }
                        
                        expect(error).toEventuallyNot(beNil())
                    }
                }
            }
            
            afterSuite {
                OHHTTPStubs.removeAllStubs()
            }
        }
    }
}
