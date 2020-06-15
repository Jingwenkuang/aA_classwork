import { connect } from 'react-redux';
import TodoList from './todo_list';
import {receiveTodo} from '../../actions/todo_actions'
import {allTodos} from '../../reducers/selectors'

const mapStateToProps = (state) => ({
    todos: allTodos(state),
});

const mapDispatchToProps = (dispatch) => {
    return {
        receiveTodo: todo  => dispatch(receiveTodo(todo))//action creator return action(pojo)
    }
    //dispatch sent info to reducer, update state(newstate) -> container(part of view)
    // container wrap our component, return todo list with new prop -> redener
};


export default connect(mapStateToProps, mapDispatchToProps)(TodoList)