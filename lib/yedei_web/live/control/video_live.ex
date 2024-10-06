defmodule YedeiWeb.Control.VideoLive do
  use YedeiWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="text-gray-600 body-font">
      <div
        class="container mx-auto flex px-5 pt-5 md:flex-row flex-col items-top"
        bis_skin_checked="1"
      >
        <div
          class="lg:flex-grow md:w-1/2 lg:pr-24 md:pr-16 pt-16 flex flex-col md:items-start md:text-left mb-16 md:mb-0 items-center text-center"
          bis_skin_checked="1"
        >
          <h1 class="title-font sm:text-4xl group poppins-bold flex items-center relative text-3xl mb-4 text-gray-200">
            Unleash Your Video Creativity
            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"  class="w-30 group-hover:text-[#fd500092] poppins-bold w-30 text-gray-200" viewBox="0 0 16 16">
              <path d="M15 12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h1.172a3 3 0 0 0 2.12-.879l.83-.828A1 1 0 0 1 6.827 3h2.344a1 1 0 0 1 .707.293l.828.828A3 3 0 0 0 12.828 5H14a1 1 0 0 1 1 1zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4z"/>
              <path d="M8 11a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5m0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0"/>
            </svg>
            </h1>

          <p class="mb-8 text-gray-200 poppins-regular leading-relaxed">
           Whether you're creating tutorials, vlogs, short films, or animations, our platform provides you with the tools to produce high-quality content effortlessly
          </p>

          <div class="flex w-full md:justify-start justify-center items-center" bis_skin_checked="1">
            <button class="group relative inline-flex h-12 items-center justify-center overflow-hidden rounded-md bg-light shadow-line px-6 font-medium text-neutral-200 duration-500"><div class="relative inline-flex -translate-x-0 items-center transition group-hover:translate-x-6"><div class="absolute -translate-x-4 opacity-0 transition group-hover:-translate-x-6 group-hover:opacity-100"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5"><path d="M6.97942 1.25171L6.9585 1.30199L5.58662 4.60039C5.54342 4.70426 5.44573 4.77523 5.3336 4.78422L1.7727 5.0697L1.71841 5.07405L1.38687 5.10063L1.08608 5.12475C0.820085 5.14607 0.712228 5.47802 0.914889 5.65162L1.14406 5.84793L1.39666 6.06431L1.43802 6.09974L4.15105 8.42374C4.23648 8.49692 4.2738 8.61176 4.24769 8.72118L3.41882 12.196L3.40618 12.249L3.32901 12.5725L3.25899 12.866C3.19708 13.1256 3.47945 13.3308 3.70718 13.1917L3.9647 13.0344L4.24854 12.861L4.29502 12.8326L7.34365 10.9705C7.43965 10.9119 7.5604 10.9119 7.6564 10.9705L10.705 12.8326L10.7515 12.861L11.0354 13.0344L11.2929 13.1917C11.5206 13.3308 11.803 13.1256 11.7411 12.866L11.671 12.5725L11.5939 12.249L11.5812 12.196L10.7524 8.72118C10.7263 8.61176 10.7636 8.49692 10.849 8.42374L13.562 6.09974L13.6034 6.06431L13.856 5.84793L14.0852 5.65162C14.2878 5.47802 14.18 5.14607 13.914 5.12475L13.6132 5.10063L13.2816 5.07405L13.2274 5.0697L9.66645 4.78422C9.55432 4.77523 9.45663 4.70426 9.41343 4.60039L8.04155 1.30199L8.02064 1.25171L7.89291 0.944609L7.77702 0.665992C7.67454 0.419604 7.32551 0.419604 7.22303 0.665992L7.10715 0.944609L6.97942 1.25171ZM7.50003 2.60397L6.50994 4.98442C6.32273 5.43453 5.89944 5.74207 5.41351 5.78103L2.84361 5.98705L4.8016 7.66428C5.17183 7.98142 5.33351 8.47903 5.2204 8.95321L4.62221 11.461L6.8224 10.1171C7.23842 9.86302 7.76164 9.86302 8.17766 10.1171L10.3778 11.461L9.77965 8.95321C9.66654 8.47903 9.82822 7.98142 10.1984 7.66428L12.1564 5.98705L9.58654 5.78103C9.10061 5.74207 8.67732 5.43453 8.49011 4.98442L7.50003 2.60397Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div><span class="pr-6">Start creating videos that resonate—your way, your style!</span><div class="absolute right-0 translate-x-0 opacity-100 transition group-hover:translate-x-4 group-hover:opacity-0"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5"><path d="M8.14645 3.14645C8.34171 2.95118 8.65829 2.95118 8.85355 3.14645L12.8536 7.14645C13.0488 7.34171 13.0488 7.65829 12.8536 7.85355L8.85355 11.8536C8.65829 12.0488 8.34171 12.0488 8.14645 11.8536C7.95118 11.6583 7.95118 11.3417 8.14645 11.1464L11.2929 8H2.5C2.22386 8 2 7.77614 2 7.5C2 7.22386 2.22386 7 2.5 7H11.2929L8.14645 3.85355C7.95118 3.65829 7.95118 3.34171 8.14645 3.14645Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div></div></button>
          </div>
        </div>

        <div class="lg:max-w-lg lg:w-full md:w-1/2 w-5/6" bis_skin_checked="1">
          <%!-- <img class="object-cover object-center rounded" alt="hero" src="https://dummyimage.com/720x600"> --%>
          <div id="bento-div" class="w-full grid grid-cols-12 max-auto auto-rows-[20rem] gap-4 p-1 object-cover object-center rounded">
            <div class="col-span-12 md:col-span-6 group overflow-hidden rounded-lg">
              <img
                src={~p"/images/vid2.jpg"}
                class="h-full w-full object-cover object-top group-hover:scale-105 transition-transform duration-500 ease-in-out"
              />
            </div>

            <div class="col-span-12 md:col-span-6 group overflow-hidden rounded-lg">
              <img
                src={~p"/images/vid3.jpg"}
                class="h-full w-full object-cover object-top group-hover:scale-105 transition-transform duration-500 ease-in-out"
              />
            </div>

            <div class="hidden md:block col-span-12 md:col-span-6 group overflow-hidden rounded-lg">
              <img
                src={~p"/images/vid1.jpg"}
                class="h-full w-full object-cover object-center group-hover:scale-105 transition-transform duration-500 ease-in-out"
              />
            </div>

            <div class="hidden md:block col-span-12 md:col-span-6 group overflow-hidden rounded-lg">
               <img src={~p"/images/vid3.jpg"} class="h-full w-full object-cover object-center group-hover:scale-105 transition-transform duration-500 ease-in-out" alt="My Image" />
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{page_title: :video, app: false})}
  end
end
