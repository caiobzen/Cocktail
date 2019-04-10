class CocktailAPI {
    let fetcher: Fetcher?
    
    init(with fetcher: Fetcher? = nil) {
        self.fetcher = fetcher
    }
    
    func search(byName: String, completion: @escaping (CocktailResponse) -> Void) {
        fetcher?.fetch()
    }
}
