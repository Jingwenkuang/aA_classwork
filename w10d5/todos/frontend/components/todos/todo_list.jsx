import React from 'react';
import TodoListItem from './todo_list_item'
import TodoForm from './todo_form'

class TodoList extends React.Component {
  render(){
    
        const todoList = this.props.todos.map((todo) => {
          return (
            <TodoListItem key={todo.id} todo={todo} /> //presentational component
          )
        })
        return (
          <div>
            <ul>
              {todoList}
            </ul>
            <TodoForm receiveTodo={this.props.receiveTodo}/>
          
          </div>
        )
      }
}



export default TodoList;