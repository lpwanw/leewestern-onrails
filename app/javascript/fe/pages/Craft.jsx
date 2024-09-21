import React from "react"
import CraftCard from "@ui/CraftCard"

const crafts = [{
  name: "First Card",
  date: "September 2024",
  videoUrl: "https://cdn.rauno.me/gooey-tooltip.mp4#t=0.01"
},{
  name: "Second Card",
  date: "September 2024",
  url: "/",
  videoUrl: "https://cdn.rauno.me/gooey-tooltip.mp4#t=0.01"
},{
  name: "Third Card",
  date: "September 2024",
  url: "/",
  videoUrl: "https://cdn.rauno.me/gooey-tooltip.mp4#t=0.01"
},{
  name: "Fourth Card",
  date: "September 2024",
  url: "/",
  videoUrl: "https://cdn.rauno.me/gooey-tooltip.mp4#t=0.01"
}]

export default function () {
  return(
    <div className="w-full gap-2 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 p-1 md:p-2">
      {
        crafts.map(({name, date, url, videoUrl}) => (
          <CraftCard name={name}
            date={date}
            url={url}
            videoUrl={videoUrl}
            key={name + "_" + date}
          />
        ))
      }
    </div>
  )
}
