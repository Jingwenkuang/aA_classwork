import React from "react";

export default class Clock extends React.Component {
  constructor(props) {
    super(props);
    // this.intervalId = 0
    this.state = {time: new Date()}
  }

  componentDidMount() {
   this.intervalId = setInterval(this.tick.bind(this), 1000) //have to bind this(clock)
   //we can access anywhere in the class, act like instance variable
   //just like the @intervalID in ruby 
  }

  componentWillUnmount() {
    // this.intervalId = 0;
    clearInterval(this.intervalId);
  }

  tick() {
    this.setState({time: new Date()})
    // this.intervalId += 1;
  } 


  render() {
    let year = this.state.time.getFullYear();
    let month = this.state.time.getMonth() + 1;
    let date = this.state.time.getDate();
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();

    return (
      <> 
        <h1>Clock</h1>
          <div>
            <p>
              <span>Time:</span>
              <span>{hours}:{minutes}:{seconds}</span>
            </p>
            <p>
              <span>Date:</span>
              <span>{month}/{date}/{year}</span>
            </p>
          </div>
      </>
    );
  }
}

// class Clock {
//   constructor() {
//     // 1. Create a Date object.
//     const currentTime = new Date();

//     // 2. Store the hour, minute, and second.
//     this.hours = currentTime.getHours();
//     this.minutes = currentTime.getMinutes();
//     this.seconds = currentTime.getSeconds();

//     // 3. Call printTime.
//     // this.printTime();
//     htmlGenerator(this.printTime(), clockElement)

//     // 4. Schedule the tick at 1 second intervals.
//     setInterval(this._tick.bind(this), 1000);
//   }

//   printTime() {
//     // Format the time in HH:MM:SS
//     const timeString = [this.hours, this.minutes, this.seconds].join(":");

//     // Use console.log to print it.
//     // console.log(timeString);
//     return timeString;
//   }

//   _tick() {
//     // 1. Increment the time by one second.
//     this._incrementSeconds();

//     // 2. Call printTime.
//     // this.printTime();
//     htmlGenerator(this.printTime(), clockElement)
//   }

//   _incrementSeconds() {
//     // 1. Increment the time by one second.
//     this.seconds += 1;
//     if (this.seconds === 60) {
//       this.seconds = 0;
//       this._incrementMinutes();
//     }
//   }

//   _incrementMinutes() {
//     this.minutes += 1;
//     if (this.minutes === 60) {
//       this.minutes = 0;
//       this._incrementHours();
//     }
//   }

//   _incrementHours() {
//     this.hours = (this.hours + 1) % 24;
//   }
// }

// const clockElement = document.getElementById('clock');
// const clock = new Clock();