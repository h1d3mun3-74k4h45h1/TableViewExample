protocol GetCustomerRepositoryInput {
    func execute() -> [String]
}

struct GetCustomerRepository {
    let repositoryInput: GetCustomerRepositoryInput
}

extension GetCustomerRepository: GetCustomerUseCaseInput {
    func execute() -> [String] {
        return repositoryInput.execute()
    }
}
