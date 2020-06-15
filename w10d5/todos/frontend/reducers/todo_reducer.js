import {RECEIVE_TODOS, RECEIVE_TODO} from '../actions/todo_actions';

const todosReducer = (state = initialState, action) => { //action based on the shirt_actions.js
    Object.freeze(state);
    let nextState =  Object.assign({}, state);
    //copy of the state, make a shadow object from the state to the empty {}

    switch(action.type) { //the type from shirt_actions.js
        case RECEIVE_TODOS:
            action.todos.forEach(todo => {
                nextStage[todo.id] = todo;
            })
            //get action, shirt, id from shirt_actions
            return nextState;
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo
            return nextState;
        default:
            return state;
            //nothing matches
    }
}

export default todosReducer;

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false,
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true,
  },
};