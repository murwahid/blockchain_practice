// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//contract declaration
contract TodoList {
    /*state variables*/
    //counts number of tasks.
    uint public taskCount = 0; 

    //create structure for tasks
    struct Task {
        uint id; 
        string content; 
        bool completed;
    }

    //map the id to a task, since you want to be able to look them up
    //you want the public to see these tasks => public keyword.
    mapping(uint => Task) public tasks; 

}