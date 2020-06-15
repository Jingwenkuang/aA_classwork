import {uniqueId} from '../../util/id_generator';
import React from 'react';

class TodoForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            id: uniqueId(),
            title: '',
            body: '',
            done: false
        }   
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }
    
    updateTitle() {
      this.setState({ title: event.target.value })
    }
    
    
    updateBody(e) {
        this.setState({ body: e.target.value });
    }

    handleSubmit(e) {
      e.preventDefault();
      this.props.receiveTodo(this.state) //click on submit, go to handle submit, go to receive todo
      //receiveTodo we create it in todo_list_container --> dispatch (receiveTodo(todo))
      this.setState({
        id: uniqueId(),
        title: '',
        body: '',
        done: false
      });
    }
    
    render() {
      return (
        <form onSubmit={this.handleSubmit}>
          <h4>Complete to Add a Todo</h4>
          <label>
            Title:
              <input
              type='text'
              value={this.state.title}
              onChange={this.updateTitle}
            />
          </label>
    
          <label>
            Body:
              <input
              type='text'
              value={this.state.body}
              onChange={this.updateBody}
            />
          </label>
          <input type='submit' value='Add todo' />
        </form>
      );
    }

};


export default TodoForm;


// this.state looks juist like a shirt object



