protocol GetAddressRepositoryInput {
    func execute() -> [String]
}

struct GetAddressRepository {
    let repositoryInput: GetAddressRepositoryInput
}

extension GetAddressRepository: GetAddressUseCaseInput {
    func execute() -> [String] {
        return repositoryInput.execute()
    }
}
