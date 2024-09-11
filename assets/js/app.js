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
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"
import ToasterComponent from "../js/react/toast"


let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken}
})

// Show progress bar on live navigation and form submits
// topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
// window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
// window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket


  window.addEventListener("phx:page-patch", () => {
    if (window.scrollY > 0) {
      window.scrollTo({ top: 0, behavior: "smooth" });
    }
  });


   // Restore scroll position on page reload
 let scrollPos = sessionStorage.getItem("scrollPos");
 if (scrollPos) {
   window.scrollTo({
     top: parseInt(scrollPos),
     behavior: "smooth", // This enables smooth scrolling
   });
 }

    // Save the scroll position before the page unloads
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

    window.addEventListener("phx:page-loading-start", (info) => {
      console.log("LiveView loading started", info);
      toast.loading("Page is loading");
    });

    window.addEventListener("phx:page-loading-stop", (info) => {
      console.log("LiveView loading stopped", info);
      const root = ReactDOM.createRoot(rootElement);
      root.render(<ToasterComponent />);
    });

    import { toast } from "sonner";

    window.addEventListener("phx:flash", (e) => {
      if ((e.data = "expired")) {
        toast.error("Your code is expired please resend");
      } else {
        toast.error("Your code is incorrect");
      }
    });