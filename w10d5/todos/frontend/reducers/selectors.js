// import React from 'react'

export const allTodos = (state) => {
  // debugger 
  const todos = Object.keys(state.todos).map((todoId) => {
    return state.todos[todoId];
  });
  return todos;
};
 
//{todos} = (state.todos)
// const initialState = { 
//     1: {
//       id: 1,
//       title: "wash car",
//       body: "with soap",
//       done: false,
//     },
//     2: {
//       id: 2,
//       title: "wash dog",
//       body: "with shampoo",
//       done: true,
//     },
//   }; 

// reducers/selectors.js

// export const getAllTodos = ({ todos }) => (
//   Object.keys(todos).map(id => todos[id])
// );


