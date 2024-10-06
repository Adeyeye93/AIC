document.documentElement.classList.toggle("dark");
// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html";
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import topbar from "../vendor/topbar";
import ToasterComponent from "./react/toast";
import React from "react";
import ReactDOM from "react-dom/client";
import SampleDemo from "./react/prime";
import { toast } from "sonner";

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: { _csrf_token: csrfToken },
});

// Show progress bar on live navigation and form submits
// topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
// window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
// window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect();

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket;
window.addEventListener("phx:page-patch", () => {
  if (window.scrollY > 0) {
    window.scrollTo({ top: 0, behavior: "smooth" });
  }
});

let scrollPos = sessionStorage.getItem("scrollPos");
if (scrollPos) {
  window.scrollTo({
    top: parseInt(scrollPos),
    behavior: "smooth",
  });
}

window.addEventListener("beforeunload", () => {
  sessionStorage.setItem("scrollPos", window.scrollY);
});

window.addEventListener("phx:login_user", (e) => {
  let attrs = e.detail.user;
  fetch("/users/log_in?_action=registered", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "x-csrf-token": document
        .querySelector("meta[name='csrf-token']")
        .getAttribute("content"),
    },
    body: JSON.stringify(attrs), // Send the user_id within a "user" object
  })
    .then((response) => {
      if (response.ok) {
        this.pending = false; // Reset pending status
      } else {
        console.error("Login failed");
      }
    })
    .catch((error) => console.error("Error:", error));
});

const rootElement = document.getElementById("root");

const root = ReactDOM.createRoot(rootElement);

window.addEventListener("phx:page-loading-stop", (info) => {
  root.render(<ToasterComponent />);
});

window.addEventListener("phx:save", () => {
  console.log("save called");
  const otp_form_email_verification = document.getElementById(
    "otp_form_email_verification"
  );
  const email_verification = ReactDOM.createRoot(otp_form_email_verification);
  email_verification.render(<SampleDemo />);
});

const ToastPromise = () =>
  new Promise((resolve) => setTimeout(() => resolve({}), 2000));

window.addEventListener("phx:flash", (e) => {
  const type = e.detail.type;
  const msg = e.detail.msg;
  const ms1 = e.detail.msg1;
  const funName = e.detail.funName;

  if (type == "promise") {
    toast.promise(ToastPromise(), {
      loading: ms1,
      success: () => `${msg}`,
      error: "An error occurred!",
    });
  } else if (type !== "action") {
    toast[type](msg);
  }
});

window.addEventListener("phx:flash_resend_otp", (e) => {
  const msg = e.detail.msg;
  const ms1 = e.detail.msg1;

  toast(`${msg}`, {
    action: {
      label: `${ms1}`,
      onClick: () => console.log("Undo"),
    },
  });
});
