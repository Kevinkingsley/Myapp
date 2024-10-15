// App.js
import React, { useState } from "react";
import './App.css'; // Assuming the CSS is in the App.css file

function App() {
  const [tasks, setTasks] = useState([]);
  const [task, setTask] = useState("");

  const handleAddTask = () => {
    if (task.trim()) {
      setTasks([...tasks, task]);
      setTask("");
    }
  };

  return (
    <div className="app-container">
      <h1 className="app-title">My Todo List</h1>
      
      <div className="task-input">
        <input
          type="text"
          value={task}
          onChange={(e) => setTask(e.target.value)}
          placeholder="Enter a task"
        />
        <button onClick={handleAddTask}>Add Task</button>
      </div>
      
      <ul className="task-list">
        {tasks.map((task, index) => (
          <li key={index} className="task-item">
            {task}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
