// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract todoList {
    struct Todo {
        string task;
        bool status;
    }
    Todo [] public todos;
    // to aadd task 
    function addTask (string memory _task) public{
        todos.push(Todo(_task,false));
    }
    //to change status
    function toggleStatus (uint256 _index) public virtual {
        require(_index < todos.length,"task not found");
    todos[_index].status = !todos[_index].status;
    }
    //Get number of tasks
    function getLength () public view returns(uint256){
        return todos.length;
    }
    // to get specific task
    function getTask (uint256 _index) public view returns(string memory,bool) {
        require(_index < todos.length,"task not found");
        Todo memory todo = todos[_index];
        return(todo.task,todo.status);
    }
    //to delete a task 
    function removeTask (uint256 _index) public {
        require(_index < todos.length,"task not found");
        for( uint256 i = _index;i < todos.length - 1;i++){
            todos[i] = todos[i + 1];
        }
        todos.pop();
    }
}