import Quick
import Nimble

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
                context("for a cocktail name with success") {
                    it("returns a list of drinks") {
                        let fetcher = FetcherMock()
                        let cocktail = CocktailAPI(with: fetcher)
                        var response: CocktailResponse? = nil
                        
                        cocktail.search(byName: "margherita") { result in
                            response = result
                        }
                        
                        expect(fetcher.didCallFetch).to(beTrue())
                        expect(response?.cocktails.count).toEventually(equal(5))
                    }
                }
            }
        }
    }
}
