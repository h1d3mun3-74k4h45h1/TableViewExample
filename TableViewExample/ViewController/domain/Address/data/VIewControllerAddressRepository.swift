protocol ViewControllerAddressRepositoryInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct ViewControllerAddressRepository {
    let repositoryInput: ViewControllerAddressRepositoryInput
}

extension ViewControllerAddressRepository: ViewControllerAddressUseCaseInput {
    func itemCount() -> Int {
        return repositoryInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return repositoryInput.itemData(of: index)
    }
}
