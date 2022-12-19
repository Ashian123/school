// var cal = document.getElementById("student_calendar");
// cal.addEventListener("click", async () => {
// onload = async () => {
//   // document.querySelector(".features").innerHTML = `<div id="calendar"></div>`;
//   await calendar();
//   await additional();
// };
async function calendar() {
  var month_ = {
    00: "JANUARY",
    01: "FEBRUARY",
    02: "MARCH",
    03: "APRIL",
    04: "MAY",
    05: "JUNE",
    06: "JULY",
    07: "AUGUST",
    08: "SEPTEMBER",
    19: "OCTOBER",
    10: "NOVEMBER",
    11: "DECEMBER",
  };
  var dt = new Date();
  var dataMonth = month_[dt.getMonth()];
  var dataYear = dt.getFullYear();

  $("#calendar").evoCalendar({
    // theme: "Midnight blue",
    theme: "Orange Coral",
    calendarEvents: await get_events(dataMonth, dataYear),
  });
}
additional = () => {
  var month = document.querySelectorAll(".month");
  var year = document.querySelectorAll(".calendar-year>button.icon-button");
  month.forEach((month) => {
    month.setAttribute("onclick", "get_month_event()");
  });
  year.forEach((year) => {
    year.setAttribute("onclick", "get_year_event()");
  });
};
get_month_event = async () => {
  //   var event = params || document.querySelector(".active-month").innerText;
  var year = active_year();
  var month = active_month();
  //   document.querySelector(".features").innerHTML = `<div id="calendar"></div>`;
  //   let event = await get_events(month, year);
  var data = await get_events(month, year);
  await add_events(data);
  // await additional();
};
get_year_event = async () => {
  var year = active_year();
  var month = active_month();
  var data = await get_events(month, year);
  await add_events(data);
  // await additional();
};

active_year = () => {
  var year = document.querySelector(".calendar-year p").innerText;
  return year;
};
active_month = () => {
  var month = document.querySelector(".active-month").innerText;
  return month;
};

add_events = async (data) => {
  $("#calendar").evoCalendar("addCalendarEvent", data);
};
get_events = async (month, year) => {
  var events = await fetch("/student/get_this_month_event", {
    method: "POST",
    body: JSON.stringify({ month, year }),
    headers: {
      "Content-type": "application/json; charset=UTF-8",
    },
  }).then((res) => res.json());

  return events;
};
