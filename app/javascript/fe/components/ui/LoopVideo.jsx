"use client"
import React, {useState} from "react"
import ReactPlayer from "react-player"
import {cn} from "@utils"

export default function({url, className, ...rest}) {
  const [hovered, setHovered] = useState(false)

  return (
    <div className={cn("w-fit h-fit", className)} onMouseEnter={() => setHovered(true)} onMouseLeave={() => setHovered(false)}>
      <ReactPlayer style={{objectFit: "cover"}}
        playing={hovered}
        height={"auto"}
        width={"100%"}
        loop={true}
        playsinline={true}
        muted={true}
        url={url} {...rest}
      />
    </div>
  )
}
