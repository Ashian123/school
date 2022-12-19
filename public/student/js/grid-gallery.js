const root = document.querySelector("body, html");
const galWindow = document.querySelector(".features");
var container;
var images;
var l;
const gallery = document.getElementById("photo_gallery");
gallery.onclick = () => {
  galWindow.innerHTML = `<div class="container-xxl py-5">
          <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp"
              data-wow-delay="0.1s"
              style="max-width: 600px"
            ><h1 class="mb-3">Gallery!</h1>
              <p>Memorable collections</p>
            </div></div></div>
  <div class="gg-container">
    <div class="gg-box dark featuresWindow" id="square-dark">
          </div></div>`;
  gridGallery({
    selector: ".dark",
    darkMode: true,
    // layout: "square",
    gapLength: 8,
    rowHeight: 180,
    columnWidth: 280,
  });
  getGallery(from, to);
};
const lastimageObserver = new IntersectionObserver(
  (entries) => {
    const lastCard = entries[0];
    if (!lastCard.isIntersecting) return;
    getGallery(from, to);
    lastimageObserver.unobserve(lastCard.target);
  },
  { rootMargin: "50px" }
);
function getGallery(from = 0, to = 1) {
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/student/getGallery", true);
  xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      const data = JSON.parse(this.responseText);

      if (!data.length) return;
      for (let i = 0; i < data.length; i++) {
        appendNewImage(data[i]["pic_url"]);
      }
    }
  };
  limit = { from, to };
  xhr.send("limit=" + JSON.stringify(limit));
}
function appendNewImage(url) {
  const galWindowInside = document.querySelector(".featuresWindow");
  var image = document.createElement("img");
  image.classList = "GalWindow";
  image.loading = "lazy";
  image.src = `/Gallery/${url}`;
  image.setAttribute("onclick", "viewthis(this);");
  galWindowInside.append(image);
  observer.observe(image);
  lastimageObserver.observe(document.querySelector(".GalWindow:last-child"));
  increase();
}
function increase() {
  from = to;
  to += 1;
}

function viewthis(param) {
  container = document.querySelector(".gg-container");
  images = document.querySelectorAll(".gg-box > img");
  l = images.length;
  var currentImg = param;
  console.log(currentImg);
  const parentItem = currentImg.parentElement,
    screenItem = document.createElement("div");
  screenItem.id = "gg-screen";
  container.prepend(screenItem);
  if (parentItem.hasAttribute("data-theme"))
    screenItem.setAttribute("data-theme", "dark");
  var route = currentImg.src;
  root.style.overflow = "hidden";
  screenItem.innerHTML =
    '<div class="gg-image"></div><div class="gg-close gg-btn">&times</div><div class="gg-next gg-btn">&rarr;</div><div class="gg-prev gg-btn">&larr;</div>';
  const first = images[0].src,
    last = images[l - 1].src;
  const imgItem = document.querySelector(".gg-image"),
    prevBtn = document.querySelector(".gg-prev"),
    nextBtn = document.querySelector(".gg-next"),
    close = document.querySelector(".gg-close");
  imgItem.innerHTML = '<img src="' + route + '">';

  if (l > 1) {
    if (route == first) {
      prevBtn.hidden = true;
      var prevImg = false;
      var nextImg = currentImg.nextElementSibling;
    } else if (route == last) {
      nextBtn.hidden = true;
      var nextImg = false;
      var prevImg = currentImg.previousElementSibling;
    } else {
      var prevImg = currentImg.previousElementSibling;
      var nextImg = currentImg.nextElementSibling;
    }
  } else {
    prevBtn.hidden = true;
    nextBtn.hidden = true;
  }

  screenItem.addEventListener("click", function (e) {
    if (e.target == this || e.target == close) hide();
  });

  root.addEventListener("keydown", function (e) {
    if (e.keyCode == 37 || e.keyCode == 38) prev();
    if (e.keyCode == 39 || e.keyCode == 40) next();
    if (e.keyCode == 27) hide();
  });

  prevBtn.addEventListener("click", prev);
  nextBtn.addEventListener("click", next);

  function prev() {
    prevImg = currentImg.previousElementSibling;
    imgItem.innerHTML = '<img src="' + prevImg.src + '">';
    currentImg = currentImg.previousElementSibling;
    var mainImg = document.querySelector(".gg-image > img").src;
    nextBtn.hidden = false;
    prevBtn.hidden = mainImg === first;
  }

  function next() {
    nextImg = currentImg.nextElementSibling;
    imgItem.innerHTML = '<img src="' + nextImg.src + '">';
    currentImg = currentImg.nextElementSibling;
    var mainImg = document.querySelector(".gg-image > img").src;
    prevBtn.hidden = false;
    nextBtn.hidden = mainImg === last;
  }

  function hide() {
    root.style.overflow = "auto";
    screenItem.remove();
  }
}

function gridGallery(options) {
  if (options.selector) selector = document.querySelector(options.selector);
  if (options.darkMode) selector.setAttribute("data-theme", "dark");
  if (options.layout == "horizontal" || options.layout == "square")
    selector.setAttribute("data-layout", options.layout);
  if (options.gaplength)
    selector.style.setProperty("--gap-length", options.gaplength + "px");
  if (options.rowHeight)
    selector.style.setProperty("--row-height", options.rowHeight + "px");
  if (options.columnWidth)
    selector.style.setProperty("--column-width", options.columnWidth + "px");
}
