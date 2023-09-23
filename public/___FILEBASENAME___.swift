import ComposableArchitecture

public struct ___VARIABLE_MODULENAME___: Reducer {
    public struct State: Equatable {
        public init(){}
    }

    public enum Action: Equatable {
        case activate
    }

    public init(){}

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }
    }
}