const FollowToggle = require("./follow_toggle.js");

// $(() => {
//     $('button.follow-toggle').each((i, button)=>{
//       console.log(button);
//         new FollowToggle(button);
//     });
// });

$().ready(() => {
  $('button.follow_toggle').each((i, button) => {
    console.log(button);
    new FollowToggle(button);
  });
})