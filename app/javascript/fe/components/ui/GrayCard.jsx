"use client"
import React from "react"
import {cn} from "@utils"
import {Link} from "react-router-dom"

export default function ({onMouseEnter, onMouseLeave, href, className, children}) {
  return (
    <Link to={href || "/"}
      className={cn(
        "select-none",
        className,
      )}>
      <div
        className={cn(
          "select-none cursor-pointer overflow-hidden shadow-2xl relative card h-full rounded-md  mx-auto flex flex-col justify-end border border-transparent dark:border-neutral-800",
        )}
      >
        <div
          onMouseEnter={onMouseEnter}
          onMouseLeave={onMouseLeave}
          className={cn(
            "select-none shadow-2xl",
            "transition-all duration-500",
            "grayscale hover:grayscale-0",
            "h-full"
          )}>
          {children}
        </div>
      </div>
    </Link>
  )
}
