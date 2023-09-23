import ComposableArchitecture

struct ___VARIABLE_MODULENAME___: Reducer {
    struct State: Equatable {
        init(){}
    }

    enum Action: Equatable {
        case activate
    }

    init(){}

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }
    }
}