// if (window.location.protocol != "https:") {
//   window.location.protocol = "https:";
// window.location.reload();
// }
var content = document.querySelector(".content");
var forget_content = document.querySelector(".forget-content");
window.onload = () => {
  content.classList.toggle("show");
};
const password = document.querySelector(".password");
const show = document.querySelector(".show-btn");
const span = show.querySelector("span");
password.addEventListener("keyup", (e) => {
  e.target.value ? (show.style.opacity = 1) : (show.style.opacity = 0);
});
show.addEventListener(
  "click",
  () => {
    password.type == "password"
      ? ((password.type = "text"),
        (span.innerText = "Hide"),
        (span.style.color = "gray"))
      : ((password.type = "password"),
        (span.innerText = "Show"),
        (span.style.color = "whitesmoke"));
  },
  []
);

const submit = document.querySelector("input[type='submit']");
submit.addEventListener(
  "click",
  async (e) => {
    e.preventDefault();
    var user = document.querySelector('input[name="user_name"]');
    var pass = document.querySelector('input[name="password"]');
    var username = user.value;
    var password = pass.value;
    if (!username) {
      user.style.border = "1px solid red";
      return;
    } else {
      user.removeAttribute("style");
    }
    if (!password) {
      pass.style.border = "1px red solid";
      return;
    } else {
      pass.removeAttribute("style");
    }
    const show_res = document.querySelector(".show-res");
    show_res.innerHTML = `<div class="spinner"><div class="inner-spinner"></div></div>`;
    var res = await fetch("/login", {
      method: "POST",
      body: JSON.stringify({ username, password }),
      headers: {
        "Content-type": "application/json; charset=UTF-8",
      },
    });

    try {
      if (res.redirected) {
        window.location.href = res.url;
      }
      if (res.status == 400) {
        show_res.innerText = await res.text();
        setTimeout(() => {
          show_res.innerText = null;
        }, 3000);
      }
    } catch (err) {
      console.error(err);
    }
  },
  []
);

// swap contents
const fp = document.querySelector(".pass a");
const back_to = document.querySelector(".f-pass a");

fp.addEventListener("click", (e) => {
  e.preventDefault();
  content.classList.toggle("show");
  forget_content.classList.toggle("show");
});
back_to.addEventListener("click", (e) => {
  e.preventDefault();
  content.classList.toggle("show");
  forget_content.classList.toggle("show");
});

// forget password
const get_psd = document.getElementById("get_psd");
get_psd.addEventListener("click", async (e) => {
  e.preventDefault();
  const userid = document.querySelector("input[name='userid']");
  var username = userid.value;
  if (!username) {
    userid.style.border = "1px red solid";
    return;
  } else {
    userid.removeAttribute("style");
  }
  const show_res = document.querySelector(".show-res2");
  show_res.innerHTML = `<div class="spinner"><div class="inner-spinner"></div></div>`;
  var res = await fetch("/recover_password", {
    method: "post",
    body: JSON.stringify({ username }),
    headers: { "content-type": "application/json; charset=UTF-8" },
  });
  try {
    show_res.innerText = await res.text();
    setTimeout(() => {
      show_res.innerText = null;
    }, 3000);
  } catch (err) {
    console.log(err);
  }
});
