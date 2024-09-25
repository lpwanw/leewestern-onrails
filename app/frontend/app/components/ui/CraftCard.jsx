"use client"
import React from "react"
import ReactPlayer from "react-player"
import { Link } from "react-router-dom"
import { IconArrowRight } from "@tabler/icons-react"
import { cn } from "@utils"

export default function ({ name, date, url, videoUrl, textClassName }) {
  return (
    <div
      className={cn(
        "h-fit rounded-xl border dark:border-neutral-700 overflow-hidden ",
        url ? "p-2" : "",
        "flex-1 sm:flex-[1_1_45%] md:flex-[1_1_30%]",
      )}
    >
      <div
        className={cn(
          "relative h-fit rounded-xl overflow-hidden text-sm",
          url ? "border dark:border-neutral-700" : "",
        )}
      >
        <ReactPlayer
          playing={true}
          loop
          playsinline
          url={videoUrl}
          width="100%"
          height={"auto"}
        />
        <span className={cn("absolute left-2 bottom-2", textClassName)}>
          {name}
        </span>
        <span className={cn("absolute right-2 bottom-2", textClassName)}>
          {date}
        </span>
      </div>

      {url && (
        <Link
          to={url}
          className="mt-1 dark:text-gray-200 rounded-xl bg-neutral-800 transition-all hover:bg-neutral-700 w-full py-2 flex justify-center items-center"
        >
          <span>View Prototype</span>
          <IconArrowRight />
        </Link>
      )}
    </div>
  )
}
