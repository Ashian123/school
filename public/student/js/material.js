var from = 0;
var to = 1;
var material = document.getElementById("student_materials");
material.addEventListener("click", () => {
  var data = `<div class="container-xxl py-5">
          <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp"
              data-wow-delay="0.1s"
              style="max-width: 600px"
            ><h1 class="mb-3">Learning Materials!</h1>
              <p>Available materials for ${CLASS} - Class & ${SECTION} - Section</p>
            </div></div></div>
  <div  class="material" style="display:block;"></div>`;

  document.querySelector(".features").innerHTML = data;
  // loadNewCard();
  from = 0;
  to = 1;
  learning_material(from, to);
  // if (cards.length) {
  //   cards.forEach((card) => {
  //     observer.observe(card);
  //   });
  // lastcardObserver.observe(document.querySelector(".card:last-child"));
  // }
});

//------------ observing cards --------//
const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      entry.target.classList.toggle("show", entry.isIntersecting);
      if (entry.isIntersecting) observer.unobserve(entry.target);
    });
  },
  { threshold: 0.6 }
);
const lastcardObserver = new IntersectionObserver(
  (entries) => {
    const lastCard = entries[0];
    if (lastCard.target.textContent == "") {
      lastCard.target.remove();
    }
    if (!lastCard.isIntersecting) return;
    // loadNewCard();
    learning_material(from, to);
    lastcardObserver.unobserve(lastCard.target);
    // lastcardObserver.observe(document.querySelector(".card:last-child"));
  },
  { rootMargin: "50px" }
);

// fetching and loading part//

// var cand_name = "";
function loadNewCard({
  file_name,
  file_desc,
  day,
  file_id,
  uploader_name,
  subject_name,
}) {
  var scroll_ = document.querySelector(".material");

  var card = document.createElement("div");
  card.classList = "testimonial-item bg-light rounded p-5 card";
  card.innerHTML = ` <p class="fs-5">${file_desc}</p>
     <p>${subject_name}</p>
                <div
                  class="d-flex align-items-center bg-white me-n5"
                  style="border-radius: 50px 0 0 50px"
                >
                 
                  <div class="ps-3">
                    <h3 class="mb-1">${file_name}</h3>
                    <span>${uploader_name} / ${day}</span>
                  </div>
                  <i
                    class="fa fa-book fa-3x text-primary ms-auto d-none d-sm-flex"
                    style="margin-right:10px"
                  ></i>
                </div>`;
  card.setAttribute("onclick", `get_file('${file_id}','${file_name}')`);
  scroll_.append(card);
  observer.observe(card);
  lastcardObserver.observe(document.querySelector(".card:last-child"));
  increase();
}

function increase() {
  from = to;
  to += 1;
}
function learning_material(from = 0, to = 1) {
  var spinner = document.createElement("div");
  spinner.classList = "spinner";
  spinner.innerHTML = '<div class="inner-spinner"></div>';
  document.querySelector(".features").append(spinner);
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/student/learning-Material", true);
  xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      const data = JSON.parse(this.responseText);
      document.querySelector(".spinner").remove();
      if (!data.length) return;

      var cand_name = data[0]["details"];
      loadNewCard(JSON.parse(cand_name));
    }
  };
  limit = { from, to };
  xhr.send("limit=" + JSON.stringify(limit));
}

get_file = (id, name) => {
  var link = document.createElement("a");
  link.innerHTML = "Download PDF file";
  link.download = name;
  link.href = `/Material/${id}`;
  link.click();
  link.remove();
  return;
  // fetch("/student/download_material", {
  //   method: "POST",
  //   body: JSON.stringify({ id }),
  //   headers: {
  //     "Content-type": "application/json; charset=UTF-8",
  //   },
  // })
  //   .then((res) => res.json())
  //   .then((res) => {
  //     var link = document.createElement("a");
  //     link.innerHTML = "Download PDF file";
  //     link.download = name;
  //     link.href = "data:application/pdf;base64," + res[0].file_pdf;
  //     link.click();
  //     link.remove();
  //   });
};
// window.onscroll = () => {
//   var scroll_ = document.querySelector(".material");
//   var x = document.createElement("div");
//   x.classList = "card";
//   scroll_ ? scroll_.appendChild(x) : "";
// };
