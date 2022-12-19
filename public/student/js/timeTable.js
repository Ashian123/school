$(document).ready(function(){
var tt = document.getElementById("student_timeTable");
let t_teachersnode = [];
tt.addEventListener("click", () => {
  // inputs = `<div><div class='table_inputs'><input type="number" placeholder="Year" id="year" />
  //       <input type="number" placeholder="Semester" id="semester" />
  //       <input type="button" id="get_time_table" onclick="get_time_table()" value="Get Time Table" /></div>
  //      <div class="show_table"></div> </div>`;
  // document.querySelector(".features").innerHTML = inputs;
  //get_time_table();
  //get_time_table(() => getsubject());
  
function firstFunction(_callback){
get_time_table();
_callback();    
}

function secondFunction(){
firstFunction(function() {
	getsubject();
});    
}
  
secondFunction();  
  
});
get_time_table = async () => {
  // var year = document.getElementById("year").value;
  // var semester = document.getElementById("semester").value;
  document.querySelector(
    ".features"
  ).innerHTML = `<div class='spinner'><div class='inner-spinner'></div></div>`;
  var table = await timeTable((year = ""), (semester = ""));
  document.querySelector(
    ".features"
  ).innerHTML = `<div class="show_table"> ${table}</div>`;
};
async function timeTable(year = "", semester = "") {
  var data = await fetch("/student/time-table", {
    method: "POST",
    body: JSON.stringify({ year, semester }),
    headers: {
      "Content-type": "application/json; charset=UTF-8",
    },
  })
    .then((response) => response.json())
    .then((response) => {
      let table_struct = JSON.parse(response[0].table_struct);
      let table_values = JSON.parse(response[0].table_values);
      let { days, periods, mrng, lunch, after } = table_struct;
      let { th, td, breaks } = table_values;
      
	  t_teachersnode = td;
      var day = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
      var table = `<div class="container-xxl py-5">
          <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp"
              data-wow-delay="0.1s"
              style="max-width: 600px"
            ><h1 class="mb-3">Time Table!</h1>
              <p>This is a current time table for ${CLASS} - Class & ${SECTION} - Section</p>
            </div></div></div>
      <div class="create-table"><table class="table table-dark"><thead><tr><th >Time</th>`;
      for (let i = 1; i <= periods; i++) {
        table += `<th  '>${th[`th${i}`]}</th>`;
        if (mrng == i || lunch == i || after == i) {
          table += `<th>Break</th>`;
        }
      }
      table += `<tbody>`;
      for (let i = 0; i < days; i++) {
        table += `<tr><td><p>${day[i]}</p></td>`;
        for (let j = 1; j <= periods; j++) {
          table += `<td class = 'td${i}${j}' >${td[`td${i}${j}`]}</td>`;
          if (i == 0) {
            if (mrng == j || lunch == j || after == j) {
              table += `<td  rowspan='${days}' style="writing-mode:tb-rl" >
               ${breaks[`break${j}`]}
                </td>`;
            }
          }
        }
        table += `</tr>`;
      }
      table += `</tbody></table></div>`;
      return table;
    }).then(getsubject())
    .catch((err) => "Enter correct year and semester");
  return data;
}



async function getsubject() {
  var data = await fetch("/student/time-table-subject", {
    method: "POST",
    body: JSON.stringify({ year, semester }),
    headers: {
      "Content-type": "application/json; charset=UTF-8",
    },
  })
	.then((response) => response.json())
	.then((response) => {
	

				for (let x in response) { 
for (const [key, value] of Object.entries(t_teachersnode)) { 
				if(value == response[x].cand_name){

				$("."+key+"").html(response[x].subject+'<br/><span style = "font-size: 0.75rem" >'+response[x].cand_name+'</span>');
				//
				}  
}
				
				
				} 
	}).catch((err) => "Enter correct year and semester");
  return data;
}		
  
});



