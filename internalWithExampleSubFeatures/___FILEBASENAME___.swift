import ComposableArchitecture

struct ___VARIABLE_MODULENAME___: Reducer {
    struct State: Equatable {
        init(){}
        var isLoading: Bool = false
        @BindingState var binding: String = ""
        @PresentationState var presentedFeatureState: PresentedFeature.State?
        var persistentSubFeatureState: PersistentSubFeature.State = .init()
    }

    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case presentedFeatureAction(PresentationAction<PresentedFeature.Action>)
        case persistentSubFeatureAction(PersistentSubFeature.Action)
        case startLoading
        case finishLoading
    }

    init(){}

    var body: some Reducer<State, Action> {
        BindingReducer()
        Scope(state: \.persistentSubFeatureState, action: /Action.persistentSubFeatureAction) {
            PersistentSubFeature()
        }
        .ifLet(\.$presentedFeatureState, action: /Action.presentedFeatureAction) {
            PresentedFeature()
        }
        Reduce { state, action in
            switch action {
            case .startLoading:
                state.isLoading = true
                return .send(.finishLoading)
            case .finishLoading:
                state.isLoading = false
                return .none
            case .presentedFeatureAction(.presented(.didFinish)):
                state.presentedFeatureState = nil
                return .none
            case .presentedFeatureAction(.dismiss):
                state.presentedFeatureState = nil
                return .none
            case .presentedFeatureAction:
                return .none
            case .persistentSubFeatureAction:
                return .none
            case .binding:
                return .none
            }
        }
    }
}

// MARK: - Example child reducers

struct PresentedFeature: Reducer {
    struct State: Equatable {}
    enum Action: Equatable {
        case didFinish
    }
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .didFinish:
                return .none
            }
        }
    }
}

struct PersistentSubFeature: Reducer {
    struct State: Equatable {}
    enum Action: Equatable {}
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            }
        }
    }
}
