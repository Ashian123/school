// active = () => {
//   counter = 1;
//   sessionStorage.setItem("counter", counter);
// };
// let c = sessionStorage.getItem("counter");
// if (c) window.history.forward();
// window.onscroll = function () {
//   myFunction();
// };

// var navbar = document.getElementById("nav-area");
// var sticky = navbar.offsetTop;

// function myFunction() {
//   if (window.pageYOffset >= sticky) {
//     navbar.classList.add("sticky");
//   } else {
//     navbar.classList.remove("sticky");
//   }
// }

function reformatDate(dateStr) {
  if (!dateStr) return "";
  dArr = dateStr.split("-");
  return dateStr && dArr[2] + "-" + dArr[1] + "-" + dArr[0];
}
var CAND_NAME = "";
var CLASS = "";
var SECTION = "";
window.onload = async () => {
  document.querySelector(".spinner").remove();
  fetch("/student/menu_status_fix")
    .then((res) => res.json())
    .then((res) => {
      res["menu_status"].forEach((e) => {
        if (isDisabled(e)) document.getElementById(e.menu).remove();
      });
    });
  // for calender
  await calendar();
  await additional();
  // for calender
  CAND_NAME = localStorage.getItem("cand_name");
  CLASS = localStorage.getItem("course_title");
  SECTION = localStorage.getItem("course");

  CAND_NAME.length
    ? (document.getElementById(
        "student_name"
      ).innerHTML = `<i class="fa fa-book-reader me-2"></i>${CAND_NAME}`)
    : null;
};
function isDisabled({ status }) {
  return status == "Disabled" ? true : false;
}
var marks = document.getElementById("student_marks");
marks.addEventListener("click", () => {
  // fetch("/get_student_marks")
  //   .then((response) => response.json())
  //   .then((response) => {
  //     var res = `<div class="create-table"><table class="table"><thead class="table-dark"><tr>
  //     <th width='250'>Subject</th><th width='250'>Marks</th></tr></thead><tbody>`;
  //     for (let key in response) {
  //       res += `<tr>
  //             <td>${key}</td>
  //             <td>${response[key]}</td>
  //           </tr>
  //         `;
  //     }
  //     res += `</tbody></table></div>`;
  //     document.querySelector(".features").innerHTML = res;
  //   });
  var data = "<div  class='material' style='display:block'></div>";

  document.querySelector(".features").innerHTML = data;
  learning_material((from = 0), (to = 1));
});
var fees = document.getElementById("student_fees");
fees.addEventListener("click", () => {
  document.querySelector(
    ".features"
  ).innerHTML = `<div class="spinner"><div class="inner-spinner"></div></div>`;
  fetch("/student/get_student_fees")
    .then((response) => response.json())
    .then((response) => {
      // document.querySelector(".spinner").remove();
      var res = `<div class="create-table"><table class="table"><thead ><tr>
      <th width='250'>Fees</th><th width='250'>Amount</th></tr></thead><tbody>`;
      for (let key in response) {
        res += `<tr>
              <td>${key}</td>
              <td>${response[key]}</td>
            </tr>
          `;
      }
      res += `</tbody></table></div>`;
      document.querySelector(".features").innerHTML = res;
    });
});

// ------profile--------//
document.querySelector("#profile").addEventListener("click", () => {
  document.querySelector(".popup").classList.add("active");
});
document.querySelector(".close-btn").addEventListener("click", () => {
  document.querySelector(".popup").classList.remove("active");
});
// ------profile--------//
// ---------Meeting----------------//
var meeting = document.getElementById("student_vr_class");
meeting.onclick = () => {
  var Sname = CAND_NAME;
  document.querySelector(
    ".features"
  ).innerHTML = `<div class="spinner"><div class="inner-spinner"></div></div>`;
  var res;
  fetch("/student/get_student_meeting")
    .then((response) => response.json())
    .then((response) => {
      document.querySelector(".spinner").remove();
      console.log(response);
      if (response.length) {
        var section = document.querySelector(".features");
        section.innerHTML = `<div class="container-xxl py-5">
          <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp"
              data-wow-delay="0.1s"
              style="max-width: 600px"
            ><h1 class="mb-3">Meeting!</h1>
              <p>Available Meeting for ${CLASS} - Class & ${SECTION} - Section</p>
            </div></div></div>`;
        response.forEach(({ meeting_link }) => {
          var { url, time, username } = JSON.parse(meeting_link);
          let URL =
            url.replace(
              "https://us05web.zoom.us/j/",
              "/student/meeting/?&mn="
            ) + `&role=0&name=${Sname}`;
          var card = document.createElement("div");
          card.classList = "meeting";
          card.innerHTML = ` <img src="/uploads/classroom.png" loading="lazy" alt="MeetingImg" style="width: 100%;" >
          <h2>You Have a Meeting</h2>
                <input  readonly value="${username}" style="border:none;color:darkgray;width: -webkit-fill-available;">
                <input type="datetime-local" readonly value="${time}" style="border:none;color:darkgray">
                <h3>Click the join button to join the meeting</h3>
                <a href=${URL}><button>Join Meeting</button></a>
                `;

          section.append(card);
          observer.observe(card);
        });
      } else {
        res = `
        <div class="container-xxl py-5">
          <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp"
              data-wow-delay="0.1s"
            >  <img  src="https://teamhood.com/wp-content/uploads/2020/12/Computer-meeting.png" alt="MeetingImg" loading="lazy" >
  <h3 style="color:darkgray;">No Meeting Available</h3></div>
            </div></div></div>`;
        document.querySelector(".features").innerHTML = res;
      }
    });
};

// ---------Meeting----------------//
// ----------Change PWD-----------------------//
let changePWD = document.getElementById("change_pwd");
changePWD.onclick = async () => {
  let old_pass = document.getElementById("old_pwd");
  let new_pass = document.getElementById("new_pwd");
  if (!old_pass.value || !new_pass.value) {
    changePWD.innerText = "Enter Password";
    displyMsg();
    return;
  }

  var spinner = document.createElement("div");
  spinner.classList = "spinner";
  spinner.innerHTML = '<div class="inner-spinner"></div>';
  document.querySelector(".changePWD").append(spinner);

  let response = await changePassword(old_pass.value, new_pass.value);
  changePWD.innerText = response;
  spinner.remove();
  displyMsg();
  old_pass.value = "";
  new_pass.value = "";
};
function displyMsg() {
  setTimeout(() => {
    changePWD.innerText = "Change";
  }, 3000);
}
async function changePassword(old_pass, new_pass) {
  let response = await fetch("/student/changePassword", {
    method: "Post",
    body: JSON.stringify({ old_pass, new_pass }),
    headers: {
      "content-type": "application/json;charset=UTF-8",
    },
  });
  var res = await response.text();

  return res;
}
