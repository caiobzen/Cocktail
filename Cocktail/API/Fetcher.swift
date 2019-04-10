class Fetcher {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetch(_ endpoint: Endpoint, completion: (Codable) -> Void) {
        
    }
}

struct Endpoint {
    let path: String
    let param: String
}

struct ResponseError: Codable {

}
