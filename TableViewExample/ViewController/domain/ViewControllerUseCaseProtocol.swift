protocol ViewControllerUseCaseProtocol {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}
