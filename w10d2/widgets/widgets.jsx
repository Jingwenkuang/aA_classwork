
import React from "react";
import ReactDOM from "react-dom";
import Clock from "./frontend/clock.jsx";


document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root/>, main)
})

const Root = () => {
  return (
    <div className="clock">
      <Clock/>
    </div>
  );
}