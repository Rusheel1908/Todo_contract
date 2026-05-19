// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {todoList} from "../src/todo.sol";

contract testTodoList is Test {
    todoList todo;

    function setUp() public {
        todo = new todoList();
    }

    function testAddTask() public {
        todo.addTask("cricket");
        assertEq(todo.getLength(), 1);
        (string memory task, bool status) = todo.getTask(0);
        assertEq(task, "cricket");
        assertEq(status, false);
    }

    function testToggleStatus() public {
        todo.addTask("C-program");
        todo.toggleStatus(0);
        (, bool status) = todo.getTask(0);
        assertEq(status, true);
    }

    function testRemoveTask() public {
        todo.addTask("task-1");
        todo.addTask("task-2");
        todo.removeTask(1);
        assertEq(todo.getLength(), 1);
        (string memory task,) = todo.getTask(0);
        assertEq(task, "task-1");
    }

    function testRevert() public {
        vm.expectRevert("task not found");
        todo.getTask(0);
    }
}
