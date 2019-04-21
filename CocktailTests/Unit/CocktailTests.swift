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
                        
                        let firstCocktail = cocktailResponse?.cocktails.first
                        expect(firstCocktail?.name).toEventually(equal("Margarita"))
                        expect(firstCocktail?.category).toEventually(equal("Ordinary Drink"))
                        expect(firstCocktail?.alcoholic).toEventually(equal("Alcoholic"))
                        expect(firstCocktail?.thumbUrl).toEventually(equal("https://www.thecocktaildb.com/images/media/drink/wpxpvu1439905379.jpg"))
                        expect(firstCocktail?.tags).toEventually(equal(["IBA", "ContemporaryClassic"]))
                        expect(firstCocktail?.tagsString).toEventually(equal("IBA,ContemporaryClassic"))
                        
                        expect(firstCocktail?.ingredient1).toEventually(equal("Tequila"))
                        expect(firstCocktail?.ingredient2).toEventually(equal("Triple sec"))
                        expect(firstCocktail?.ingredient3).toEventually(equal("Lime juice"))
                        expect(firstCocktail?.ingredient4).toEventually(equal("Salt"))
                        expect(firstCocktail?.ingredient5).toEventually(equal(""))
                        expect(firstCocktail?.ingredient6).toEventually(equal(""))
                        expect(firstCocktail?.ingredient7).toEventually(equal(""))
                        expect(firstCocktail?.ingredient8).toEventually(equal(""))
                        expect(firstCocktail?.ingredient9).toEventually(equal(""))
                        expect(firstCocktail?.ingredient10).toEventually(equal(""))
                        expect(firstCocktail?.ingredient11).toEventually(equal(""))
                        expect(firstCocktail?.ingredient12).toEventually(equal(""))
                        expect(firstCocktail?.ingredient13).toEventually(equal(""))
                        expect(firstCocktail?.ingredient14).toEventually(equal(""))
                        expect(firstCocktail?.ingredient15).toEventually(equal(""))
                        
                        expect(firstCocktail?.measure1).toEventually(equal("1 1/2 oz "))
                        expect(firstCocktail?.measure2).toEventually(equal("1/2 oz "))
                        expect(firstCocktail?.measure3).toEventually(equal("1 oz "))
                        expect(firstCocktail?.measure4).toEventually(equal(""))
                        expect(firstCocktail?.measure5).toEventually(equal(""))
                        expect(firstCocktail?.measure6).toEventually(equal(""))
                        expect(firstCocktail?.measure7).toEventually(equal(""))
                        expect(firstCocktail?.measure8).toEventually(equal(""))
                        expect(firstCocktail?.measure9).toEventually(equal(""))
                        expect(firstCocktail?.measure10).toEventually(equal(""))
                        expect(firstCocktail?.measure11).toEventually(equal(""))
                        expect(firstCocktail?.measure12).toEventually(equal(""))
                        expect(firstCocktail?.measure13).toEventually(equal(""))
                        expect(firstCocktail?.measure14).toEventually(equal(""))
                        expect(firstCocktail?.measure15).toEventually(equal(""))
                        
                        expect(firstCocktail?.instructions).toEventually(equal("Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass."))
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
